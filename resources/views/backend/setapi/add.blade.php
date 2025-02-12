@extends('backend.layout.master')
@section('content')

      <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center">


          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center>Add API</center></h5>
                    
                    
              <!-- Multi Columns Form -->
              <form class="row g-3" method="post" action="{{ route('backend.setapi.store') }}" enctype="multipart/form-data">
              @csrf
                  
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">API Name</label>
                  <select class="form-select" name="api_name" aria-label="Account Type">
                      <option value="T">Token</option>
                      <option value="P">Products</option>
                      <option value="O">Orders</option>
                      <option value="OC">Order Cancel</option>
                  </select>
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">API Value</label>
                  <input type="text" class="form-control" name="api_value" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">API Username</label>
                  <input type="text" class="form-control" name="api_username">
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">API Password</label>
                  <input type="text" class="form-control" name="api_password">
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">API Grant Type</label>
                  <input type="text" class="form-control" name="api_granttype">
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">Remarks</label>
                  <input type="text" class="form-control" name="remarks">
                </div>
                
                <table>
                <tr>
                <th>
                    
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Add API Details</button>
                
              </form><!-- End Multi Columns Form -->
              </th>
              <th>
              <form method="get" action="{{ route('backend.setapi.index') }}">
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