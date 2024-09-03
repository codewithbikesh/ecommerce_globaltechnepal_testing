@extends('backend.layout.master')
@section('content')

      <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center">


          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center>Add User</center></h5>
                    
                    
              <!-- Multi Columns Form -->
              <form class="row g-3" method="post" action="{{ route('backend.users.store') }}" enctype="multipart/form-data">
              @csrf
                  
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Name</label>
                  <input type="text" class="form-control" name="name"" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">Email</label>
                  <input type="email" class="form-control" name="email" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">Password</label>
                  <input type="password" class="form-control" name="password" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputPassword5" class="form-label">Phone Number</label>
                  <input type="phone" class="form-control" name="phone" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputZip" class="form-label">Address</label>
                  <input type="text" class="form-control" name="address" required>
                </div>             
                
                <div class="col-md-6">
                  <label for="inputZip" class="form-label">Country</label>
                  <input type="text" class="form-control" name="country" required>
                </div>    

                <div class="col-md-6">
                  <label for="inputZip" class="form-label">Account type</label>
                  <input type="text" class="form-control" name="account_type" required>
                </div>    

                <table>
                <tr>
                <th>
                    
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Add User Details</button>
                
              </form><!-- End Multi Columns Form -->
              </th>
              <th>
              <form method="get" action="{{ route('backend.users.index') }}">
                <div class="text-center">
                  <button type="submit" class="btn btn-secondary">Cancel </button>
                </div>
              </form>
              </div>
              
              </th>
              </tr>
              </table>
              
            </div>
          </div>

        </div>


            </div>
          </div>
        </div>
    </section>

@endsection