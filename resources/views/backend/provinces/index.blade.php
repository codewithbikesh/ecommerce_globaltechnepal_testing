@extends('backend.layout.master')
@section('content')

    <div class="pagetitle">
      <h1>Provinces</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}"><i class="fa fa-dashboard"></i><span> Dashboard</span></a>
          </li>
          <li class="breadcrumb-item active">Provinces</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->


    
    <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h4 class="card-title" style="display: inline-block;">Provinces
                <form method="get" action="{{ route('backend.provinces.add') }}" enctype="multipart/form-data" style="display: inline-block;">
                    <button class="btn btn-primary"><span style="color:white;">Add Province</span></button>
                </form>
                </h4>
            </div>&nbsp;
            
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"> 
               <thead>
                   <tr>
                    <th scope="col">S.N.</th>
                    <th scope="col">Province Name</th>
                    <th scope="col">Action</th>
                   </tr>
               </thead>
               <tbody>
                    
          @foreach ($provinces as $index => $province)
                  <tr>
                    <th scope="row">{{ $index + 1 }}</th>
                    <td>{{ $province->province_name }}</td>
                    <td>
                        
                        <div style="display: flex; align-items: center;">
                        <form method="POST" action="{{ route('backend.provinces.view') }}" style="margin-right: 10px;">
                        @csrf
                        <input type="hidden" name="id" value="{{ $province->id }}">
                        <button style="background-color: transparent; border: none;">
                            <i title="View Details" class="fa fa-info-circle" style="font-size:35px;color:#24a0ed"></i>
                        </button>
                        
                        </form>
                        &nbsp;
                        
                        <form method="post" action="{{ route('backend.provinces.edit') }}" style="margin-right: 10px;">
                        @csrf
                        <input type="hidden" name="id" value="{{ $province->id }}">
                        <button style="background-color: transparent; border: none;">
                            <i title="Edit Details" class="fa fa-edit" style="font-size:35px;color:blue"></i>
                        </button>
                        </form>
                        &nbsp;
                        
                        <button data-bs-toggle="modal" data-bs-target="#provincedeletemodal{{ $province->id }}" style="background-color: transparent; border: none;">
                            <i title="Delete" class="fa fa-trash" style="font-size:35px;color:red"></i>
                        </button>
                        
                    </div>
                    </td>
                    
                    
                <!--Province Delete Modal-->
              <div class="modal fade" id="provincedeletemodal{{ $province->id }}" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Delete Province</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        
                        <b>Are you sure you want to Delete this Province: {{ $province->province_name }} ?</b>
                  
                    </div>
                    
                    <div class="modal-footer">
                        
                      <form method="post" action="{{ route('backend.provinces.delete', $province->id) }}" enctype="multipart/form-data">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Delete </button>
                      </form>

                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Province Delete Modal-->
              
              
          @endforeach
              
                  </tr>
                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                  </div>

  
  


@endsection