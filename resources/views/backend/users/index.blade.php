@extends('backend.layout.master')
@section('content')

    <div class="pagetitle">
      <h1>Users</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}"><i class="fa fa-dashboard"></i><span> Dashboard</span></a>
          </li>
          <li class="breadcrumb-item active">Users</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->


    
    <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h4 class="card-title" style="display: inline-block;">Users
                <form method="get" action="{{ route('backend.users.add') }}" enctype="multipart/form-data" style="display: inline-block;">
                    <button class="btn btn-primary"><span style="color:white;">Add User</span></button>
                </form>
                </h4>
            </div>&nbsp;
            
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"> 
               <thead>
                   <tr>
                    <th scope="col">S.N.</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Account Type</th>
                    <th scope="col">Action</th>
                   </tr>
               </thead>
               <tbody>
                    
          @foreach ($users as $index => $user)
                  <tr>
                    <th scope="row">{{ $index + 1 }}</th>
                    <td>{{ $user->name }}</td>
                    <td>{{ $user->email }}</td>
                    <td>{{ $user->phone }}</td>
                    <td>{{ $user->account_type }}</td>
                    <td>
                        
                        <div style="display: flex; align-items: center;">
                        <form method="POST" action="{{ route('backend.users.view') }}" style="margin-right: 10px;">
                        @csrf
                        <input type="hidden" name="id" value="{{ $user->id }}">
                        <button style="background-color: transparent; border: none;">
                            <i title="View Details" class="fa fa-info-circle" style="font-size:35px;color:#24a0ed"></i>
                        </button>
                        
                        </form>
                        &nbsp;
                        
                        <form method="post" action="{{ route('backend.users.edit') }}" style="margin-right: 10px;">
                        @csrf
                        <input type="hidden" name="id" value="{{ $user->id }}">
                        <button style="background-color: transparent; border: none;">
                            <i title="Edit Details" class="fa fa-edit" style="font-size:35px;color:blue"></i>
                        </button>
                        </form>
                        &nbsp;
                        
                        <button data-bs-toggle="modal" data-bs-target="#userdeletemodal{{ $user->id }}" style="background-color: transparent; border: none;">
                            <i title="Delete" class="fa fa-trash" style="font-size:35px;color:red"></i>
                        </button>
                        
                    </div>
                    </td>
                    
                    
                <!--Users Delete Modal-->
              <div class="modal fade" id="userdeletemodal{{ $user->id }}" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Delete User</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        
                        <b>Are you sure you want to Delete this User: {{ $user->name }} ?</b>
                  
                    </div>
                    
                    <div class="modal-footer">
                        
                      <form method="post" action="{{ route('backend.users.delete', $user->id) }}" enctype="multipart/form-data">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Delete </button>
                      </form>

                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div><!-- End User Delete Modal-->
              
              
          @endforeach
              
                  </tr>
                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                  </div>

  
  


@endsection