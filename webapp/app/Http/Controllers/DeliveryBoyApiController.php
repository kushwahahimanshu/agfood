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
use App\PasswordReset;

class DeliveryBoyApiController extends Controller
{  
   // ----------------------------------------------- Delivery boy login api start--------------------------------// 
        public function deliveryLogin(Request $req) 
        { 
            $user = Delivery::where('email', $req->email)->orWhere('mobileno', $req->mobileno)->first();
            if($user != null) 
            {
                if(Hash::check($req->password, $user->password)) 
                {
                    return response()->json($data = 
                    [
                        'status' => 200,
                        'msg' => 'Success',
                        'user' => Delivery::where('email', $req->email )->orWhere('mobileno', $req->mobileno)->select('id','userid','name','mobileno','email')->first()
                    ]); 
                }else {
                    return response()->json($data = [
                        'status' => 201,
                        'msg' => 'Wrong Credentials'
                    ]);
                }
            }else {
                return response()->json($data = [
                    'status' => 400,
                    'msg' => 'Not Registered'
                ]);
            }
             
        }
   // ----------------------------------------------- Delivery boy login api End ---------------------------------//

   // ----------------------------------------------- Delivery boy details api start----------------------------// 
        public function deliveryBoyDetails(Request $req) 
        {              
            $user = Delivery::where('userid', $req->userid)->select('id','userid','name','address','image','city','mobileno','alternate_mobile','aadhar','pancard','email','bank_name','bank_account_holder','bank_account_no','ifsc_code')->first();

            if($user != null) 
            {   
                 
                if($user) { 
                    return response()->json($data = 
                    [
                        'status' => 200, 
                        'user' => $user
                    ]); 
                }
            }  
            else 
            {
                return response()->json($data = [
                    'status' => 201,
                    'msg' => 'No data available'
                ]);
            }
             
        } 
   // ----------------------------------------------- Delivery boy details api End ----------------------------//
        public function updateBank(Request $req) 
        {              
            $bank = Delivery::where('userid',$req->userid)->update([
            'bank_name' => $req->bank_name,
            'bank_account_no' => $req->bank_account_no,
            'bank_account_holder'=>$req->bank_account_holder,
            'ifsc_code'=>$req->ifsc_code
            ]);
            //$update = Delivery::where('userid',$req->userid)->select('image','title','price','service_status','service_date','service_time')->first();

            if($bank){
                return response()->json($data = [
                'status' => 200,
                'msg'=>'Success'
                ]);
            }
            else{
                return response()->json($data = [
                'status' => 201,
                'msg'=>'Failed'
                ]);
            }
             
        } 
        public function locationUpdate(Request $req)
        {
             $location = Delivery::where('userid',$req->userid)->update([
            'latitude' => $req->latitude,
            'longitude' => $req->longitude
            ]);
            if($location){
                return response()->json($data = [
                'status' => 200,
                'msg'=>'Success'
                ]);
            }
            else{
                return response()->json($data = [
                'status' => 201,
                'msg'=>'Failed'
                ]);
            }
        }
        public function checkIn(Request $req)
        {
            $check=Delivery::where('userid',$req->userid)->update([
            'check_in' =>1
            ]);
            if($check){
                return response()->json($data = [
                'status' => 200,
                'msg'=>'Success'
                ]);
            }
            else{
                return response()->json($data = [
                'status' => 201,
                'msg'=>'Failed'
                ]);
            }
        }
        public function checkOut(Request $req)
        {
            $check=Delivery::where('userid',$req->userid)->update([
            'check_in' =>0
            ]);
            if($check){
                return response()->json($data = [
                'status' => 200,
                'msg'=>'Success'
                ]);
            }
            else{
                return response()->json($data = [
                'status' => 201,
                'msg'=>'Failed'
                ]);
            }
        }
        public function getOrders(Request $req)
        {
            $order=order::where('delivery_boy_id',$req->userid)->where('order_status','!=','Delivered')->orderBy('created_at','asc')->first();
            //$restaurants=restaurants::where('id',$order->restaurant_id)->first();
            //$delivery=Delivery::where('id',$order->delivery_boy_id)->first();
            if($order){
                return response()->json($data = [
                'status' => 200,
                'msg'=>'Success',
                'order'=>$order,
                'restaurants'=>restaurants::where('userid',$order->restaurant_id)->first(),
                'customer' => Profiles::where('id', $order->user_id)->first()
                ]);
            }
            else{
                return response()->json($data = [
                'status' => 201,
                'msg'=>'Empty'
                ]);
            }
        }
        public function orderDelivered(Request $req)
        {
            $delivered=order::where('id',$req->order_id)->update([
            'order_status' =>'Delivered'
            ]);
            if($delivered){
                return response()->json($data = [
                'status' => 200,
                'msg'=>'Success'
                ]);
            }
            else{
                return response()->json($data = [
                'status' => 201,
                'msg'=>'Failed'
                ]);
            }
        }
        public function forgotPassword(Request $req){
        if(Profiles::where('email', $req->email)->count() > 0) {
            //$token = 
            $reg = new PasswordReset;
            $reg->email = $req->email;
            $reg->save();

            $token = sha1(rand()).$reg->id;

            PasswordReset::where('email', $req->email)->update(['validator' => $token]);

            $msg = urlencode("Your password reset link is http://agfoods.in/password-reset/".$token);

            $curl = curl_init("http://roundsms.com/api/sendhttp.php?authkey=YTkxMjU0ODg1MmR&mobiles=".Delivery::where('email', $req->email)->pluck('mobileno')->first()."&message=".$msg."&sender=AGFSMS&type=1&route=2");

            curl_setopt ($curl,CURLOPT_RETURNTRANSFER,true);
            $response=curl_exec($curl);
            curl_close($curl);

            $to = $req->email;
            $subject = 'Password Reset';
            $message = "Your password reset link  is :\nhttp://agfoods.in/password-reset//".$token." \n\nThank You  \n\nTeam Agfoods ";
            $headers = 'From: noreply@agfoods.in';        
            if(mail($to, $subject, $message, $headers)) {
               
            } else {
                
            }

            return response()->json($data = [
                'status' => 200,
                'msg' => 'Your password reset link has been sent to your registered mobile number successfully'
            ]);
        } else {
            return response()->json($data = [
                'status' => 400,
                'msg' => 'Email not registered'
            ]);
        }
    }


}
/*$user = Delivery::where('userid', $req->userid)->where('order_status', '=','1')->orWhere('order_status', '<','4')->orderby('id','desc')->select('restaurant_id','user_id','order_amount','delivery_charge','restaurant_charge')->get();*/