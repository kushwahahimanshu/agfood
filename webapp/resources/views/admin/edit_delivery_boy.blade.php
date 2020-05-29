@extends('master') 
@section('title','editdeliveryboyprofile')
@section('main_body')
<br><br>
 <div class="container">
  @if($errors->any())
  <div class="alert alert-danger">
    <ul>
      @foreach($errors->all() as $error)
      <li>{{$error}}</li>
      @endforeach
    </ul>
  </div>
  @endif 
  @if(session()->has("success"))
  <div class="alert alert-warning">
    <p>  {{session()->get("success")}} </p>
  </div>
  @endif
<section class="content">
    <div class="row"> 
			<div class="col-md-7">
			    <div class="box box-primary">
					<div class="box-header with-border">
					  <h3 class="box-title"><b>Update Delivery-Boy Profile</b></h3>
					</div><!-- /.box-header -->
					<!-- form start -->
					<form action="{{url('update_delivery_boy')}}"  method="post" enctype="multipart/form-data">
                       {{csrf_field()}} 
                        <input type="hidden" class="form-control"  name="id" value="{{ $profile->id}}">
						
					    <div class="box-body"> 
							<div class="form-group">
							  <label>Delivery Boy Name</label>
							  <input type="text" class="form-control"  placeholder="Enter name" name="name" value="{{ $profile->name}}">
							</div>
							<div class="form-group">
							  <label>Address</label>
							  <input type="text" class="form-control"  placeholder="Enter Address" name="address" value="{{ $profile->address}}">
							</div> 
							<div class="form-group">
							  <label>Pic</label><br>
							  <img src="{{asset($profile ->image)}}" style="height: 70px; width: 100px;">
                              <input type="file" name="image" class="form-control"  style="margin-top:10px;"> 
							</div>
						    <div class="form-group">
							  <label>City</label>
							  <input type="text" class="form-control"  placeholder="Enter city" name="city" value="{{ $profile->city}}">
							</div>
							<div class="form-group">
							  <label>Contact no.</label>
							  <input type="number" class="form-control"  placeholder="Enter Contact number" name="mobileno" value="{{ $profile->mobileno}}">
							</div> 
							<div class="form-group">
							  <label>Alternate Contact no.</label>
							  <input type="number" class="form-control"  placeholder="Enter alternate Contact number" name="alternate_mobile" value="{{ $profile->alternate_mobile}}">
							</div> 
							<div class="form-group">
							  <label>Addhar Card Number</label>
							  <input type="text" class="form-control"  placeholder="Enter aadhar card number" name="aadhar" value="{{ $profile->aadhar}}">
							</div>
							<div class="form-group">
							  <label>Pan Card</label>
							  <input type="text" class="form-control"  placeholder="Enter Pancard" name="pancard" value="{{ $profile->pancard}}"> 
							</div>  
							<div class="form-group">
							  <label>Email</label>
							  <input type="email" class="form-control"  placeholder="Enter Email" name="email" value="{{ $profile->email}}">
							</div> 
							<div class="form-group">
							  <label>Bank Name</label>
							  <input type="text" class="form-control"  placeholder="Enter bank name" name="bank_name" value="{{ $profile->bank_name}}">
							</div>
							<div class="form-group">
							  <label>Bank Account Holder</label>
							  <input type="text" class="form-control"  placeholder="Enter bank account holder" name="bank_account_holder" value="{{ $profile->bank_account_holder}}">
							</div> 
							<div class="form-group">
							  <label>Bank Account No.</label>
							  <input type="number" class="form-control"  placeholder="Enter account number" name="bank_account_no" value="{{ $profile->bank_account_no}}">
							</div> 
							<div class="form-group">
							  <label>Ifsc Code</label>
							  <input type="text" class="form-control"  placeholder="Enter ifsc code" name="ifsc_code" value="{{ $profile->ifsc_code}}"> 
							</div>
					    </div> 
					    <div class="box-footer">
						  <button type="submit" class="btn btn-primary">Submit</button>
					    </div>
					</form>
			    </div>
			</div>
		</div>
	</div>
</section>

@endsection