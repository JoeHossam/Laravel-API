<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\generalController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('auth')->group(function () {
    Route::post('register',[AuthController::class, 'register']);
    Route::post('login',[AuthController::class, 'login']);
    Route::post('logout',[AuthController::class, 'logout']);
    Route::post('forgetPassword', [AuthController::class, 'forgetPassword']);
    Route::post('changePassword', [AuthController::class, 'changePassword']);
    Route::post('updatePassword', [AuthController::class, 'updatePassword']);
    Route::post('updateUser', [AuthController::class, 'updateUser']);

    Route::post('appInfo', [generalController::class, 'appInfo']);
    Route::post('unseenNotifications', [generalController::class, 'unseenNotifications']);
    Route::post('notifications', [generalController::class, 'notifications']);

    Route::post('addOrder', [generalController::class, 'addOrder']);
    Route::post('discountCode', [generalController::class, 'discountCode']);

    Route::post('acceptOrderByDriver', [generalController::class, 'acceptOrderByDriver']);
    Route::post('cancelOrderByDriver', [generalController::class, 'cancelOrderByDriver']);
    Route::post('getOrders', [generalController::class, 'getOrders']);
    Route::post('arrivedToPickUpLocation', [generalController::class, 'arrivedToPickUpLocation']);

    Route::post('getContactsType', [generalController::class, 'getContactsTypes']);
    Route::post('getTrucksTypes', [generalController::class, 'getTrucksTypes']);
    Route::post('getGoodsTypes', [generalController::class, 'getGoodsTypes']);
    Route::post('getBankAccounts', [generalController::class, 'getBankAccounts']);

    Route::post('changeLanguage', [generalController::class, 'changeLanguage']);

    Route::post('myProfit', [generalController::class, 'myProfit']);

    Route::post('getActiveOrder', [generalController::class, 'getActiveOrder']);
});