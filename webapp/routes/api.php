<?php

use Illuminate\Http\Request;

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

//-------------CAuthController--------------------------------//
    Route::post('register', 'CAuthController@register');           // user register api 
    Route::post('login', 'CAuthController@login');                // user  login api
    Route::get('user-profile', 'CAuthController@userprofile');   //  user api to select Userprofile
    Route::post('verify-otp', 'CAuthController@otpVerify');            //  user otp  api      
    

    Route::post('restaurant-details', 'CAuthController@restaurantdetail');   // restaurant detail api 

                                                    

    Route::post('place-order', 'CAuthController@placeOrder'); 

    Route::post('payment-response','CAuthController@paymentResponse');

    Route::get('my-orders', 'CAuthController@myorderapi');             // Myorder api 

//-------------  HomePageApiController --------------------------------//
   Route::get('home', 'HomePageApiController@homepage');                      
   Route::get('search', 'HomePageApiController@search');                      
    
   Route::post('add-address','HomePageApiController@addAddress');
   Route::post('edit-address','HomePageApiController@editAddress');
   Route::post('delete-address','HomePageApiController@deleteAddress');
   Route::get('get-address','HomePageApiController@getAddress');
   Route::get('get-all-address','HomePageApiController@getAllAddress');



//------------- DeliveryBoyApiController--------------------------------// 
   Route::post('delivery-login','DeliveryBoyApiController@deliveryLogin'); //delivery login api                          
   Route::get('get-d-boy-details','DeliveryBoyApiController@deliveryBoyDetails');
   Route::post('bank-details-update','DeliveryBoyApiController@updateBank');                           
   Route::post('location-update','DeliveryBoyApiController@locationUpdate');
   Route::get('check-in','DeliveryBoyApiController@checkIn');                     
   Route::get('check-out','DeliveryBoyApiController@checkOut');  
   Route::get('get-order','DeliveryBoyApiController@getOrders');
   Route::post('order-status','DeliveryBoyApiController@orderDelivered');  

   Route::post('forget-password', 'DeliveryBoyApiController@forgotPassword');



//------------------------------------------------------------------------------


//------------- OrderApiController--------------------------------// 
   //Route::get('my_order','OrderApiController@myorderapi');                         

Route::post('test',function(Request $req){
  //var_dump($req['order_data']['order_placed'][0]->price);
 // echo $req['order_data']['order_placed'][0]['price'];

   $new=$req['order_data'];
   echo $user_id=$new['user_id'];
   echo $restaurant_id=$new['restaurant_id'];
   echo $total_amount=$new['total_amount'];

  $data=$req['order_data']['order_placed'];
  //dd($data);
  $price = null;
  $food_name=null;
  $quantity=null;
  foreach ($data as $r) {
   echo $price .= $r['price'].',';
   echo $food_name .= $r['food_name'].',';
   echo $quantity .= $r['quantity'].',';
  }

  //echo rtrim($price, ',');
  //echo rtrim($food_name, ',');
  //echo rtrim($quantity, ',');

   
});


 