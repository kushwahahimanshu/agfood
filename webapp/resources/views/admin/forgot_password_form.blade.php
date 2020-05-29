<div class="container" style="margin-top:40PX;">
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

  @section('body')
  @show
</div>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Password reset</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<body> 
	<div class="container"><br>
	<div class="col-md-3"></div>
	<div class="col-md-5">
	  <h3 class="text-center">Change Your Password</h3><br>
	    <form action="{{url('submit')}}" class="form-horizontal" method="post" enctype="multipart/form-data">
	        {{csrf_field()}} 
	        <input type="hidden" name="email" value="{{ $forms }}"> 
		    <div class="form-group">
				<label>	New Password:</label>
				<input type="password" class="form-control"  placeholder="Enter new Password" name="password" required>
			</div>
			<div class="form-group">
			  <label>Confirm Password:</label>
			  <input type="password" class="form-control"  placeholder="Enter Confirm Password" name="cnf_password" required>
			</div> <br>
		    <div class="box-footer">
				<button type="submit" class="btn btn-md btn-primary">Update</button>
			</div>
	    </form>
	</div>
    </div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>
