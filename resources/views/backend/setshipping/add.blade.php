@extends('backend.layout.master')
@section('content')

      <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center">


          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center>Add Shipping Cost</center></h5>
                    
                    
              <!-- Multi Columns Form -->
              <form class="row g-3" method="post" action="{{ route('backend.setshipping.store') }}" enctype="multipart/form-data">
              @csrf
                  
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Province</label>
                  <select class="form-select" name="province" aria-label="Account Type">
                      <option value="" selected disabled>Select</option>
                      <option value="1">Province 1</option>
                      <option value="2">Madhesh</option>
                      <option value="3">Bagmati</option>
                      <option value="4">Gandaki</option>
                      <option value="5">Lumbini</option>
                      <option value="6">Karnali</option>
                      <option value="7">Sudurpaschim</option>
                  </select>
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">City</label>
                  <input type="text" class="form-control" name="city" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">Shipping Cost</label>
                  <input type="text" class="form-control" name="shipping_cost" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputPassword5" class="form-label">Remarks</label>
                  <input type="text" class="form-control" name="remarks">
                </div>
                
                <table>
                <tr>
                <th>
                    
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Add Shipping Cost</button>
                
              </form><!-- End Multi Columns Form -->
              </th>
              <th>
              <form method="get" action="{{ route('backend.setshipping.index') }}">
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