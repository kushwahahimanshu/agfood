@extends('master')
@section('title','Show all Banners') 
@section('main_body')
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title"><b>View All Banners</b></h3>
          <!-- <a href="{{url('adddelivery')}}" class="btn btn-sm btn-success" style="float:right;">Add Delivery Boy</a> -->
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="example1" class="table table-bordered table-striped">
            <thead>

                <tr>
                  <th>Sr.no</th> 
                  <th>Title</th>
                  <th>Image</th> 
                  <th>Action</th>
                </tr>
              </thead>
              <tbody> 
                <?php $i=1;?> <!-- auto increment--->
                @foreach($forms as $form)
                  <tr> 
                    <td>{{ $i++}}</td>
                    <td>{{ $form->title }}</td> 
                    <td>
                      @php
                       if(!empty($form->image))
                      { @endphp
                        <img src="{{asset($form ->image)}}" style="height: 50px; width: 50px;">
                      @php
                        }
                        else
                        {
                      @endphp
                      <h6>No Image Found</h6>
                      @php 
                        } 
                      @endphp
                    </td>
                    <td> 
                      <!-- <a href="{{url('/editdeliveryboy/'.$form->id)}}"><button type="button" class="btn btn-md">Edit</button></a> -->
                      <a href="{{ url('delete-banner/'.$form->id) }}" class="btn btn-danger btn-sm">Delete</a> 
                    </td> 
                  </tr>            
                @endforeach
                </tr> 
              </tbody> 
              <tfoot>
                <tr>
                  <th>Sr.no</th> 
                  <th>Title</th>
                  <th>Image</th> 
                  <th>Action</th>
                </tr>
              </tfoot>
          </table>
        </div><!-- /.box-body -->
      </div><!-- /.box -->

    </div>
  </div>
</section>
@endsection