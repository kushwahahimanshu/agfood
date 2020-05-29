<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash; 
use App\order_item; 
use App\Profiles; 
use App\order; 
use App\Payouts; 
use App\menus; 
use App\restaurants; 
use App\settings; 
use App\Delivery;
use App\Address;
use DB; 
use Razorpay\Api\Api;


class CAuthController extends Controller
{  

   
    //--------------------------------- LOGIN API START------------------------------------//
    public function login(Request $req) 
    {

        $user = Profiles::where('email', $req->email)->orWhere('mobileno', $req->mobileno)->first();
        if($user != null) 
        {
            if(Hash::check($req->password, $user->password)) 
            {
                return response()->json($data = 
                [
                    'status' => 200,
                    'msg' => 'Success',
                    'user' => Profiles::where('email', $req->email )->orWhere('mobileno', $req->mobileno)->select('id as userid','name','email','mobileno','applied_refer_code','refer_code')->first()
                ]);

            } 
            else 
            { 
                return response()->json($data = 
                [
                    'status' => 201,
                    'msg' => 'Credential Not Matched'
                ]);
            }
        }
        else
        { 
            return response()->json($data = 
            [
                'status' => 400,
               'msg' => 'Not Registered'
            ]);
        }
         
    }
   //--------------------------------- LOGIN API END------------------------------------//

  //--------------------------------- Registration  API start------------------------------//

    public function register(Request $req) 
    {
       if(Profiles::where('email', $req->email)->count() > 0) 
        {
            return response()->json($data = [
                'status' => 201,
                'msg' => 'Already Registered'
            ]);
        }
        else 
        {
            $otp = rand (100000, 999999);
           
            $reg = new Profiles;

            $reg->name = $req->name;
            $reg->email = $req->email;
            $reg->mobileno = $req->mobileno;
            $reg->password = bcrypt($req->password); 
            $reg->applied_refer_code = $req->refer_code; 
            $reg->otp = $otp;

            $is_saved=$reg->save();
             $rest = substr($req->name, 0,3);
            //dd($rest);
             $num = sprintf("%02s", $reg->id);
             $refer_code=$rest.$num;
             //dd($refer_code);
             if ($is_saved) {           
                DB::table('profiles')
                ->where('id', $reg->id)
                ->update(['refer_code' => $refer_code]);
            }

            //$user['userid'] = Profiles::where('email', $req->email)->pluck('id')->first();

            
            $msg = urlencode("Welcome to AGFOODS. Your OTP for registration is ".$otp);

            $curl = curl_init("http://roundsms.com/api/sendhttp.php?authkey=YTkxMjU0ODg1MmR&mobiles=".$req->mobileno."&message=".$msg."&sender=AGFSMS&type=1&route=2");

            curl_setopt ($curl,CURLOPT_RETURNTRANSFER,true);
            $response=curl_exec($curl);
            curl_close($curl);
            //echo $response;

            return response()->json($data = [
                'status' => 200,
                'msg' => 'Success',
                //'otp' => $otp,
                //'response'=>$response,
                'user' => Profiles::where('email', $req->email )->select('id as userid','name','email','mobileno','applied_refer_code','refer_code')->first()
            ]);
        }
    } 
  //--------------------------------- Registration  API End------------------------------//


 //--------------------------------- user profile start------------------------------------// 

    public function userprofile(Request $req) 
    {

        $userprofile = profiles::where('id', $req->userid)->select('name', 'email', 'mobileno')->first();
        if($userprofile) 
        {
            return response()->json($userprofile = 
            [
                'status' => 200,
                 'msg' => "Success",
                'userprofile' => Profiles::where('id', $req->userid )->select('id as userid','name','email','mobileno','applied_refer_code','refer_code')->first()
            ]);
        } else 
        {
            return response()->json($userprofile = 
            [
                'status' => 201,
                'msg' => 'Data Not found'
            ]);
        }
    }
 //--------------------------------- user profile end------------------------------------//
 
 //-----------------------------------------------------------------------------------//
    public function otpVerify(Request $req) 
    {
        if(Profiles::where('id', $req->userid)->pluck('otp')->first() == $req->otp) {
            return response()->json($data = [
                'status' => 200,
                'msg' => 'Success',
                'user' => Profiles::where('otp', $req->otp )->select('id','name','email','mobileno','refer_code')->first()
            ]);
            Profiles::where('id', $req->userid)->update([
                'otp'=>null
            ]);
        } else {
            return response()->json($data = [
                'status' => 201,
                'msg' => 'OTP did not match'
            ]);
        }
    }
 //---------------------------------------------------------------------------------------------//

 //--------------------------------------------------------------------------------------------//
    
    public function myorderapi(Request $req) 
    {

        $user = order::where('user_id', $req->userid)->first();
        if($user) 
        {
            return response()->json($user = 
            [
                'status' => 200, 
                'msg' => "Success",
                'orders' => order::join('restaurant', 'orders.restaurant_id', '=', 'restaurant.userid')->where('orders.user_id', $req->userid)->select('orders.id as order_id','orders.restaurant_id', 'restaurant.name as restaurant_name','orders.ordered_products', 'orders.ordered_products_count as ordered_products_quantity','orders.order_amount as order_total','orders.created_at as order_date_time', 'orders.order_status')->get()
                //order::where('user_id', $req->userid )->select('id as order_id','restaurant_id','ordered_products','order_amount as order_total','created_at as order_date_time', 'order_status','')->get()
            ]);
        } else 
        {
            return response()->json($user = 
            [
                'status' => 201,
                'msg' => 'Not found'
            ]);
        }
    }

//---------------------------------------------------------------------------------------------//

 //------------------------------order api and assign order to delivery boy in randomly --------------------------------------------------------------//

    public function placeOrder(Request $req) 
    {
        $payment_url =  null;

        

       $new=$req['order_data'];
       $user_id=$new['user_id'];
       $restaurant_id=$new['restaurant_id'];
       $total_amount=$new['total_amount'];
       $address_id=$new['address_id'];
       $payment_type=$new['payment_type'];

      $data=$new['order_placed'];
      $price = null;
      $food_name=null;
      $quantity=null;
      //dd($new);
      foreach ($data as $r) {
       $price .= $r['price'].',';
       $food_name .= $r['food_name'].',';
       $quantity .= $r['quantity'].',';
      } 

        $reg = new order;
        $reg->restaurant_id = $restaurant_id;
        $reg->user_id = $user_id;
        $reg->ordered_products = rtrim($food_name, ',');
        $reg->ordered_products_count = rtrim($quantity, ',');
        $reg->order_amount = $total_amount;
        $reg->delivery_charge = 0;
        $reg->restaurant_charge = 0;
        $reg->order_status = 'Pending';
        $reg->delivery_address = $address_id;
        $reg->payment_type = $payment_type;
        $reg->payment_status = 'Pending';
        $reg->payment_request_id = null;
        $reg->payment_id = null;

        $reg->save();

        $data=restaurants::where('userid',$restaurant_id)->pluck('city')->first();
        //dd($data);

        $model=Delivery::where('city',$data)->where('check_in',1)->get()->random(1)->first();
        //dd($model);
        order::where('id',$reg->id)->update([
            'delivery_boy_id'=>$model->userid
        ]);

        if($payment_type != 'cod'){

            $reg->order_amount = $total_amount;

            $api = new Api('rzp_live_l4he63BOjl6WXB', 'vVvvLSenHJbHV0JZ8NLCdICf');

            $order = $api->order->create(array(
                    'receipt' => $reg->id,
                    'amount' => $total_amount * 100,
                    'payment_capture' => 1,
                    'currency' => 'INR'
                )
            );

            $reg->payment_request_id = $order->id;
            $reg->payment_status = 'Pending';

            $reg->save();
            
            return response()->json($data = [
                'status' => 200,
                'msg'  => 'Success',
                'order_id' => $order->id
            ]);
        }
        else {
            
            $reg->save();
            
            return response()->json($data = [
                'status' => 200,
                'msg'  => 'Success',
                'order_id' => null
            ]);
        }


       /* if($reg){
        return response()->json($data = 
        [
            'status' => 200,
            'msg' => 'Success',
           // 'user'=>Address::where('user_id',$req->userid)->select('id as address_id','address_type','flat_no','address','landmark','phone_no')->first(),
            'payment_url' => $payment_url

        ]);
        }
        else{
                return response()->json($data = [
                    'status' => 201,
                    'msg' => 'Failled'
                ]);
            }*/

    }
    public function paymentResponse(Request $req) {
        $data1 = order::where('payment_request_id', $req->payment_request_id)->first();
        if($data1 != null) {
            //Checking Payment status
            if($req->payment_status != 'Failed') {
                //Payment === SUCCESSFUL
                //Update payment details to DB
                order::where('payment_request_id', $req->payment_request_id)->update([
                    'payment_status' => $req->payment_status,
                    'payment_id' => $req->payment_id
                ]);
                
                return response()->json($data = [
                    'status' => 200,
                    'msg' => 'Success',
                    'payment_request_id' => $req->payment_request_id,
                    'payment_status' => $req->payment_status,
                    'payment_id' => $req->payment_id,
                    'order_id' => $data1->id
                ]);
            } else {
                //Payment === FAILED
                //Update payment details to DB
                order::where('payment_request_id', $req->payment_request_id)->update([
                    'payment_status' => $req->payment_status,
                    'payment_id' => $req->payment_id
                ]);
                return response()->json($data = [
                    'status' => 200,
                    'msg' => 'Success',
                    //'payment_request_id' => $req->payment_request_id,
                    //'payment_status' => $req->payment_status,
                    //'payment_id' => $req->payment_id
                ]);
            }  
        }
        else {
             return response()->json($data = [
                'status' => 201,
                'msg' => 'Invalid payment request id'
            ]);
        }   
    }
    /*public function getPaymentResponse(Request $req) {
        $data = JobSeek::where('payment_request_id', $req->payment_request_id)->first();

        return response()->json($data = [
            'status' => 200,
            'order_status' => $data->payment_status
        ]);
    }*/
 //--------------------------------------------------------------------------------------------//
   /*public function myorderq(Request $req) 
    {
        $myorder = order_item::where('id', $req->id)->select('order_id','restaurant_id', 'item_quantity','order_id','item_price','total_item_price','item_name','created_at')->first();
        if($myorder) 
        {
            return response()->json($myorder = 
            [
                'status' => 200,
                'myorder' => $myorder,
                 'msg' => "welcome"
            ]);
        } else 
        {
            return response()->json($myorder = 
            [
                'status' => 201,
                'msg' => 'Not found'
            ]);
        }
    }*/
 //--------------------------------------------------------------------------------------------//
   

    public function restaurantdetail(Request $req) 
    {

        $restaurantdetail = restaurants::where('userid', $req->restaurant_id)->select('id','name','image','servetype','cost_for_two','categories','city','email')->first();
        if($req->has('type')){
            if($req->type=='veg'){
                $menu=menus::where('restaurant_id',$req->restaurant_id)->where('servetype',$req->type)->select('id','name','image','servetype','categories','price')->get();
            }
            elseif($req->type=='nonveg'){
                $menu=menus::where('restaurant_id',$req->restaurant_id)->where('servetype',$req->type)->select('id','name','image','servetype','categories','price')->get();
            }
            elseif($req->type=="" || $req->type=='null' ){
                $menu=menus::where('restaurant_id',$req->restaurant_id)->select('id','name','image','servetype','categories','price')->get();
            }
        }
        else{
              $menu=menus::where('restaurant_id',$req->restaurant_id)->select('id','name','image','servetype','categories','price')->get();
            }
        if($restaurantdetail) 
        {
            return response()->json($restaurantdetail = 
            [
                'status' => 200,
                'msg'=>'Welcome',
                'restaurantdetail' => $restaurantdetail,
                 'menu' => $menu
            ]);
        } else 
        {
            return response()->json($restaurantdetail = 
            [
                'status' => 201,
                'msg' => 'Not found'
            ]);
        }
    }
 //--------------------------------------------------------------------------------------------//
 
 
     


}