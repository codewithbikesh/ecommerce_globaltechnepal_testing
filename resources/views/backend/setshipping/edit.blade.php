@extends('backend.layout.master')
@section('content')

      <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center">


          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center>Update Shipping Cost Details</center></h5>
                    
                    
              <!-- Multi Columns Form -->
              <form class="row g-3" method="post" action="{{ route('backend.setshipping.update', $shipping->id) }}" enctype="multipart/form-data">
              @csrf
                  
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Province</label>
                  <select class="form-select" name="province" aria-label="Account Type">
                      <option value="" selected disabled>Select</option>
                      @foreach($provinces as $id => $province_name)
                          <option value="{{ $id }}" {{ $shipping->province == $id ? 'selected' : '' }}>
                              {{ $province_name }}
                          </option>
                      @endforeach
                  </select>
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">City</label>
                  <input type="text" class="form-control" value="{{ $shipping->city }}" name="city" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">Shipping Cost</label>
                  <input type="text" class="form-control" value="{{ $shipping->shipping_cost }}" name="shipping_cost" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputPassword5" class="form-label">Remarks</label>
                  <input type="text" class="form-control" value="{{ $shipping->remarks }}" name="remarks">
                </div>

                <table>
                <tr>
                <th>
                    
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Update Shipping Cost Details</button>
                
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