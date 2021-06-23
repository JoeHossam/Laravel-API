<?php

namespace App\Http\Controllers;

use App\Models\bill;
use App\Models\discountCode;
use App\Models\order;
use App\Models\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Facades\JWTAuth;

use function PHPSTORM_META\type;

class generalController extends Controller
{

    public function __construct() {
        $this->middleware('auth:api', ['except' => ['appInfo', 'contact']]);
    }


    function appInfo(Request $request) {
        $request->validate(['langauge' => 'required']); //why should i check for the language shouldn't i send them both and the front end handle it?

        return response()->json([""=>""],200); //what is the app info object
    }

    function contact(Request $request) {
        $request->validate([
            'api_token' => 'string',
            'name' => 'string',
            'phone' => 'string',
            'contactTypeId' => 'required|int',
            'message' => 'required|string'
        ]);

        if(empty($request->api_token)) {
            //Send the message with phone and name in here
        }
        else {
            //Send the message with the apitoken here
        }

        return response()->json([
            'ar' => 'تم الإرسال بنجاح',
            'en' => 'Sent successfully'
        ], 200);
    }

    function unseenNotifications(Request $request) {
        $request->validate(['api_token' => 'required|string']);

        $user = User::where('api_token', $request->api_token)->first();

        $unseenNotifications = DB::table('notify_users')
            ->select('notifications_id')
            ->where('users_id', '=', $user->id)
            ->where('is_seen', '=', 0)
            ->get();
        
        return response()->json([
            'unseenNotifications' => count($unseenNotifications),
        ], 200);
    }

    function notifications(Request $request) {
        $request->validate(['api_token' => 'required|string']);
        $user = User::where('api_token', $request->api_token)->first();

        $notifications = DB::table('notifications')
        ->select('notifications.*')
        ->join('notify_users', 'notifications.id', '=', 'notify_users.notifications_id')
        ->where('notify_users.users_id', $user->id)
        ->get();
        
        return response()->json(['notifications' => $notifications]);
    }

    function discountCode(Request $request) {
        $request->validate([
            'api_token' => 'required|string',
            'order_id' => 'required',
            'code' => 'string'
        ]);

        $code = discountCode::where('code', $request->code)->first();
        $order_id = $request->order_id;
        $user = User::where('api_token', $request->api_token)->first();
        
        if(empty($code)) {
            return response()->json([
                'ar' => 'الكود غير موجود',
                'en' => 'the code does not exist'
            ], 422);
        }

        if($code->is_active != 1) {
            return response()->json([
                'ar' => 'الكود غير مفعل',
                'en' => 'the code isn\'t activated'
            ], 419);
        }

        $is_code_used_by_user = DB::table('users_has_discount_code')
            ->where('discount_code_id', $code->id)
            ->where('users_id', $user->id)
            ->first();

        if(!empty($is_code_used_by_user)) {
            return response()->json([
                'ar' => 'استخدمت الكود مسبقا',
                'en' => 'you have used this code before'
            ], 421);
        }

        if($code->count < 1) {
            return response()->json([
                'ar' => 'الكود وصلل للحد الأقصى',
                'en' => 'code reached it\'s limit'
            ], 420);
        }

        //Applying discount to bill
        try {
            DB::table('bills')->where('orders_id', $order_id)->update(['discount'=>$code->discount]);
        }
        catch (Exception $e){
            return response()->json([
                'ar' => 'الفاتورة غير موجودة',
                'en' => 'bill does not exist'
            ]);
        }

        $code->count--;
        $code->save();

        DB::table('users_has_discount_code')->insert([
            'users_id' => $user->id,
            'discount_code_id' => $code->id
        ]);

        return response()->json([
            'ar' => 'تم تطبيق الخصم بنجاح',
            'en' => 'code applied successfully'
        ], 200);
    }

    function addOrder(Request $request) {
        $request->validate([
            'api_token' => 'required',
            'locations_pickup_id' => 'required|int',
            'locations_destination_id' => 'required|int',
            'truck_type_id' => 'required',
            'good_type_id' => 'required',
            'i_am_recipient' => 'required'
        ]);

        if($request->i_am_recipient == 0) {
            $request->validate([
                'recipient_name' => 'required',
                'country_code' => 'required',
                'recipient_phone' => 'required'
            ]);
        }

        $user = User::where('api_token', $request->api_token)->first();

        //How to check if the user has an acive order?
        $has_active_order = false;
        if($has_active_order) {
            return response()->json([
                'ar' => 'لا يمكنك ارسال طلب لأنه يوجد طلب لم ينته',
                'en' => 'cannot send the order because you have order not done yet'
            ]);
        }

        //How to check if the user has rated the last order?
        $has_rated_last_order = true;
        if(!$has_rated_last_order) {
            return response()->json([
                'ar' => 'لا يمنك ارسال طلب لانك لم تقيم اخر طلب',
                'en' => 'you can\'t make an order because you haven\'t rated the last one'
            ], 418);
        }

        //generating a valid random code for the order
        $order_code = $this->generateRandomCode();
        $order = new order([
            'locations_pickup_id' => $request->locations_pickup_id,
            'locations_destination_id' => $request->locations_destination_id,
            'goods_types_id' => $request->good_type_id,
            'i_am_recipient' => $request->i_am_recipient,
            'created_at' => Carbon::now(),
            'users_id' => $user->id,
            'trucks_types_id' => $request->truck_type_id,
            'code' => $order_code
        ]);
        $order->save();


        //calculating the cost
        $distance = mt_rand(10,500);
        $price = DB::table('price_list')
            ->select('price')
            ->where('trucks_types_id', $request->truck_type_id)
            ->first();
        $cost = $distance * $price->price;

        $bill = new bill([
            'orders_id' => $order->id,
            'cost' => $cost,
            'created_at' => Carbon::now(),
        ]);
        $bill->save();

        return response()->json([
            'order' => $order,
            'ar' => 'تم ارسال الطلب بنجاح',
            'en' => 'order successfully submitted'
        ],200);
    }

    function generateRandomCode() {
        $code = mt_rand(10000, 99999);

        while(empty(order::where('code', $code)))
            $code = mt_rand(10000, 99999);

        return $code;
    }

    function getOrders(Request $request) {
        $request->validate(['api_token' => 'required', 'type' => 'required']);

        $user = User::where('api_token', $request->api_token)->first();

        $old_orders = $availableOrders = [];
        $orders = order::where('users_id', $user->id)->get();
        foreach($orders as $order) {
            if($order->status == 'paid') {
                array_push($old_orders, $order);
            }
        }

        if($request->type == 'driver') {
            array_push($availableOrders, order::where('status','awaitingDriver')->get());
        }

        return response()->json([
            'old_orders' => $old_orders,
            'available_orders' => $availableOrders
        ], 200);
    }

    function cancelOrderByUser(Request $request) {
        $request->validate(['order_id' => 'required']);

        $order = order::where('id', $request->order_id)->first();

        if($order->status == 'awatingPayment') {
            $order->status = 'cancelledByUser';
            $order->save();
            return response()->json([
                'ar' => 'تم الإلغاء بنجاح',
                'en' => 'Successfully cancelled'
            ], 200);
        } else {
            return response()->json([
                'ar' => 'لا يمكن إلغاء الطلب',
                'en' => 'can\'t cancel the order'
            ]);
        }
    }

    function acceptOrderByDriver(Request $request) {
        $request->validate(['api_token' => 'required', 'order_id' => 'required']);

        $order = order::where('id', $request->order_id)->first();
        $driver = DB::table('drivers')->select('id')->where('api_token', $request->api_token)->first();
        $active_orders = order::whereRaw('drivers_id = ? and status != \'closed\'', [$driver->id])->first();

        if(!empty($active_orders)) {
            return response()->json([
                'ar' => 'لا يمكنك إرسال الطلب لأنه يوجد طلب لم ينته',
                'en' => 'cannot send order becuase you have an order that is not done yet'
            ], 425);
        }

        if($order->status != 'awaitingDriver') {
            return response()->json([
                'ar' => 'لا يمكن إكمال الإجراء',
                'en' => 'action cannot be completed'
            ]);
        }

        $order->status = 'acceptedByDriver';
        $order->drivers_id = $driver->id;
        $order->save();

        $bill = bill::where('orders_id', $order->id)->first();

        try{
            $amount = $bill->cost * (($bill->fees/100)+1);
        }
        catch(Exception $e) {
            $amount = $bill->cost * 1.15;
        }

        try {
            DB::table('financials')->insert([
                'total_benefit' => $amount,
                'created_at' => Carbon::now(),
                'drivers_id' => $driver->id
            ]);
        }
        catch(Exception $e) {
            return response($e, 404);
        }

        return response()->json([
            'ar' => 'تم قبول الطلب بنجاح',
            'en' => 'successfully accepted'
        ]);
    }

    function cancelOrderByDriver(Request $request) {
        $request->validate([
            'api_token' => 'required',
            'order_id' => 'required'
        ]);

        $order = order::where('id', $request->order_id)->first();
        $driver = DB::table('drivers')->select('id')->where('api_token', $request->api_token)->first();

        if(!$order->status == 'acceptedByDriver') {
            return response()->json([
                'ar' => 'لا يمكنك إلغاء الطلب',
                'en' => 'You cannot cancel the order'
            ], 427);
        }

        $order->status = 'cancelledByDriver';
        $order->save();

        $bill = bill::where('orders_id', $order->id)->first();

        try{
            $amount = $bill->cost * (($bill->fees/100)+1);
        }
        catch(Exception $e) {
            $amount = $bill->cost * 1.15;
        }

        try {
            DB::table('financials')->insert([
                'total_benefit' => -$amount,
                'created_at' => Carbon::now(),
                'drivers_id' => $driver->id
            ]);
        }
        catch(Exception $e) {
            return response($e, 404);
        }

        return response()->json([
            'ar' => 'تم الإلغاء بنجاح',
            'en' => 'cancelled successfully'
        ], 200);
    }

    function arrivedToPickUpLocation(Request $request) {
        $request ->validate([
            'api_token' => 'required',
            'order_id' => 'required'
        ]);

        $order = order::where('id', $request->order_id)->first();

        $this->changeOrder($order, 'arrivedPickUpLocation','acceptedByDriver');
    }

    function goodsLoading(Request $request) {
        $request ->validate([
            'api_token' => 'required',
            'order_id' => 'required'
        ]);
        
        $order = order::where('id', $request->order_id)->first();

        $this->changeOrder($order, 'goodsLoading','arrivedPickUpLocation');
    }

    function startMoving(Request $request) {
        $request ->validate([
            'api_token' => 'required',
            'order_id' => 'required'
        ]);
        
        $order = order::where('id', $request->order_id)->first();

        $this->changeOrder($order, 'startMoving','goodsLoading');
    }

    function arrivedToDestinationLocation(Request $request) {
        $request ->validate([
            'api_token' => 'required',
            'order_id' => 'required'
        ]);
        
        $order = order::where('id', $request->order_id)->first();

        $this->changeOrder($order, 'arrivedToDestinationLocation','startMoving');
    }

    function FinishTripByDriver(Request $request) {
        $request ->validate([
            'api_token' => 'required',
            'order_id' => 'required'
        ]);
        
        $order = order::where('id', $request->order_id)->first();

        $this->changeOrder($order, 'finishedTripByDriver','arrivedToDestinationLocation');
    }

    function FinishTripByUser(Request $request) {
        $request ->validate([
            'api_token' => 'required',
            'order_id' => 'required'
        ]);
        
        $order = order::where('id', $request->order_id)->first();

        $this->changeOrder($order, 'finishedTripByUser','finishedTripByDriver');
    }

    function codeToCLoseTripByDriver(Request $request) {
        $request ->validate([
            'api_token' => 'required',
            'order_id' => 'required'
        ]);
        
        $order = order::where('id', $request->order_id)->first();

        $this->changeOrder($order, 'closed','finishedTripByUser');
    }

    function changeOrder(order $order, string $to, string $condition) {
        if($order->status == $condition) {
            $order->status = $to;
            $order->save();
            return response(200);
        } else {
            return response()->json([
                'ar' => 'لا يمكن إكمال الإجراء',
                'en' => 'action cannot be completed'
            ]);
        }
    }

    function addRating(Request $request) {
        $request->validate([
            'api_token' => 'required',
            'order_id' => 'required',
            'target_id' => 'required',
            'rate' => 'required|double',
        ]);

        //where do we store the ratings?
    }

    function getContactsTypes(Request $request) {
        $request->validate(['api_token'=>'required']);
        return DB::table('contacts_types')->select('*')->get();
    }

    function getTrucksTypes(Request $request) {
        $request->validate(['api_token'=>'required']);
        return DB::table('trucks_types')->select('*')->get();
    }

    function getGoodsTypes(Request $request) {
        $request->validate(['api_token'=>'required']);
        return DB::table('goods_types')->select('*')->get();
    }

    function getBankAccounts(Request $request) {
        $request->validate(['api_token'=>'required']);
        return DB::table('bank_accounts')->select('*')->get();
    }

    function changeLanguage(Request $request) {
        $request->validate([
            'api_token' => 'required',
            'language' => 'required'
        ]);

        if($request->language == 'en' || $request->language == 'ar')
            App::setLocale($request->language);
        else
            return response(400);

        return response(200);
    }

    function myProfit(Request $request) {
        $request->validate(['api_token' => 'required']);
        $driver = DB::table('drivers')
            ->select('id')
            ->where('api_token', $request->api_token)
            ->first();
            
        $profit = DB::table('financials')
            ->select(DB::raw('sum(total_benefit) as total_benefit, sum(paid_money) as paid_money'))
            ->where('drivers_id', $driver->id)
            ->get();

        return response()->json($profit, 200);
    }

    function getActiveOrder(Request $request) {
        $request->validate(['api_token' => 'required']);

        $ordersToCheck = [
            'waiting',
            'awaitingPayment',
            'awaitingDriver',
            'cancelledByUser',
            'cancelledByDriver',
            'closed'
        ];

        //There must be a way to know if its a user or a driver
        //and I should not use the api_token as an identifier
        $user = User::where('api_token', $request->api_token)->first();
        $driver = DB::table('drivers')
            ->select('id')
            ->where('api_token', $request->api_token)
            ->first();
        $orders = [];
        
        if(!empty($user)) {
            $orders = DB::table('orders')->select('*')->where('users_id', $user->id)->get();
        } else {
            $orders = DB::table('orders')->select('*')->where('drivers_id', $driver->id)->get();
        }

        if(!empty($orders)) {
            foreach($orders as $order) {
                if(in_array($order->status, $ordersToCheck)) {
                    continue;
                } else {
                    return response()->json(['active order'=>$order],200);
                }
            }
        }

        return response('no active orders',200);
    }

    function setDriverLocation(Request $request) {
        $request->validate([
            'api_token' => 'required',
            'location' => 'required'
        ]);
        
        $driver = DB::table('drivers')
            ->select('id')
            ->where('api_token', $request->api_token)
            ->first();

        //the location must be stored somewhere then access it in the next function
    }

    function getDriverLocation(Request $request) {
        $request->validate(['order_id' => 'required']);

        $order = order::where('id', $request->order_id)->first();
        if($order->drivers_id != null) {
            $driver = DB::table('drivers')
            ->select('*')
            ->where('id', $order->drivers_id)
            ->first();

            return response()->json([
                'driver' => $driver
            ], 204);
        } else {
            return response()->json([
                'ar' => 'لم يتم تعيين سائق لطلبك',
                'en' => 'no driver has been assigned to your order'
            ], 432);
        }
    }

    function getNearbyDrivers(Request $request) {
        $request->validate([
            'longitude' => 'required|double',
            'latitude' => 'requierd|double'
        ]);

        //what now?
    }
}
