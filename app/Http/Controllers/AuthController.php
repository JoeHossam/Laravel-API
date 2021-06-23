<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Classes\Account;
use App\Models\Driver;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    public function __construct() {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

    public function register(Request $request) {

        $request->validate([
            'name' => 'required',
            'phone' => 'required',
            'country_code' => 'required',
            'password' => 'required',
            'language' => 'required',
            'email' => 'required',
            'type' => 'required'
        ]);

        if($request->type != 'user' && $request->type != 'driver') {
            return response()->json(['message'=>'invalid account type']);
        }
        if($request->type == 'user') {
            //checks if the phone is unique
            if(empty(User::where('phone',$request->phone)->first())) {


                $user = new User([
                    'name' => $request->name,
                    'phone' => $request->phone,
                    'country_code' => $request->country_code ,
                    'language' => $request->language,
                    'password' => Hash::make($request->password),
                    'email' => $request->email,
                    'type' => $request->type
                ]);

                $token = JWTAuth::fromUser($user);

                $user->api_token = $token; //the token is too long for the database how to resize it?
                $user->created_at = Carbon::now();
        
                $user->save();
                return response()->json([
                    'ar' => 'تم التسجيل بنجاح',
                    'en'=>'registered Successfully'
                ], 200);
            }
            else {
                return response()->json([
                    'ar' => 'هذا الهاتف مسجل بالفعل',
                    'en'=>'phone already registered'
                ], 401);
            }
        }
        elseif ($request->type == 'driver') {
            //checks if the phone is unique
            if(empty(Driver::where('phone',$request->phone)->first())) {


                $user = new Driver([
                    'name' => $request->name,
                    'phone' => $request->phone,
                    'country_code' => $request->country_code ,
                    'language' => $request->language,
                    'password' => Hash::make($request->password),
                    'email' => $request->email,
                    'type' => $request->type
                ]);

                $token = auth('drivers')->attempt(request()->only('phone', 'password'));

                $user->api_token = $token;
                $user->created_at = Carbon::now();
        
                $user->save();
                return response()->json([
                    'ar' => 'تم التسجيل بنجاح',
                    'en'=>'registered Successfully'
                ], 200);
            }
            else {
                return response()->json([
                    'ar' => 'هذا الهاتف مسجل بالفعل',
                    'en'=>'phone already registered'
                ], 401);
            }
        }
    }

    public function login(Request $request) {

        $request->validate([
            'phone' => 'required',
            'password' => 'required|string',
            'language' => 'required',
            'type' => 'required'
        ]);

        $credentials = request(['phone','password']);

        if($request->type == 'user') {
            if(! $token = auth()->attempt(request()->only('phone', 'password'))) {
                return response()->json(['message'=>'wrong credentials'], 401);
            }
            $user = User::where('phone', $request->phone)->first();
        } elseif ($request->type == 'driver') {
            if(! $token = auth('drivers')->attempt(request()->only('phone', 'password'))) {
                return response()->json(['message'=>'wrong credentials'], 401);
            }
            $user = Driver::where('phone', $request->phone)->first();
        }


        if($user->is_active = false) {
            return response()->json([
                'ar' => 'هذا الهاتف لم يفعل بعد',
                'en' => 'phone not activated yet'
                ]);
        }

        $account = new Account($token, $user->country_code, $user->phone, $user->type);
        $auth = $request->type == 'user' ? auth()->user() : auth('drivers')->user();

        return response()->json(['data' => [
            'user' => $auth,
            'account' => $account
        ]],200);
    }
    
    public function logout() {
        JWTAuth::logout();
        return response()->json([
            'ar' => 'تم تسجيل الخروج بنجاح',
            'en' => 'User successfully signed out'
            ]);
    }

    function forgetPassword(Request $request) {
        $request->validate([
            'phone'=>'required'
        ]);

        $user = User::where('phone', $request->phone)->first();

        if(empty($user)) {
            return response()->json([
                'ar' => 'هذا الهاتف غير مسجل',
                'en'=>'wrong phone'
                ]);
        }

        $token = JWTAuth::login($user);

        //i just returned the original token
        return response()->json([
            'tmp_token' => $token
        ]);
    }

    function changePassword(Request $request) {
        $request->validate([
            'tmp_token'=>'required',
            'newPassword'=>'required'
        ]);

        $user = User::where('tmp_token',$request->api_token)->first();
        $user->password = Hash::make($request->newPassword);
        $user->save();

        return response()->json([
            'ar' => 'تم تحديث كلمة المرور بنجاح',
            'en'=>'password updated successfully'
            ]);
    }

    function updatePassword(Request $request) {
        $request->validate([
            'oldPassword'=>'required',
            'newPassword'=>'required',
            'api_token'=>'required'
        ]);

        $user = User::where('api_token',$request->api_token)->first();

        if(Hash::check($request->oldpassword, $user->password)) {
            $user->password = Hash::make($request->newPassword);
            $user->save();
            return response()->json([
                'ar' => 'تم تحديث كلمة المرور بنجاح',
                'en'=>'password updated successfully'
                ]);
        }
        else {
            return response()->json([
                'ar' => 'كلمة المرور القديمة غير صحيحة',
                'en' => 'old password is not correct'
            ]);
        }
    }

    function updateUser(Request $request){
        $request->validate([
            'api_token' => 'required|string',
            'name'=>'string',
            'image'=>'string', //how string
            'countryCode'=>'string',
            'phone'=>'string'
        ]);

        if(empty(User::where('phone',$request->phone)->first())) {
            return response()->json([
                'ar'=>'هذا الهاتف مسجل مسبقا',
                'en'=>'this phone is already registered'
            ], 415);
        }

        $user = User::where('api_token',$request->api_token)->first();
        
        $user->name = empty($request->name) ? $user->name : $request->name;
        $user->image = empty($request->image) ? $user->image : $request->image;
        $user->country_code = empty($request->country_code) ? $user->country_code : $request->country_code;
        $user->phone = empty($request->phone) ? $user->phone : $request->phone;

        $user->save();

        return response()->json([
            'ar'=>'تم التحديث بنجاح',
            'en'=>'updated succefully'
        ], 200);
    }
     
}
