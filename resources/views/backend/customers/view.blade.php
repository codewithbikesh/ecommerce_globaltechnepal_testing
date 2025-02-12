@extends('backend.layout.master')
@section('content')

<section class="section profile">
    <div class="container">
      <div class="row justify-content-center">

        <div class="col-xl-6">

          <div class="card mb-6">
            <div class="card-body pt-3">
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">

                <div style="display: flex; justify-content: space-between; align-items: center;">
                  <h5 class="card-title">Customer Details</h5>
                </div>

                  <div class="row">
                    <div class="col-lg-6 col-md-6 label ">Full Name</div>
                    <div class="col-lg-6 col-md-6">{{ $customer->full_name }}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Email</div>
                    <div class="col-lg-6 col-md-6">{{ $customer->email }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Phone</div>
                    <div class="col-lg-6 col-md-6">{{ $customer->phone }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Province</div>
                    <div class="col-lg-6 col-md-6">{{ $customer->province }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">City</div>
                    <div class="col-lg-6 col-md-6">{{ $customer->city }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Street</div>
                    <div class="col-lg-6 col-md-6">{{ $customer->street_address }}</div>
                  </div>
                                    
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Registration Date</div>
                    <div class="col-lg-6 col-md-6">{{ $customer->created_at }}</div>
                  </div>
                  
                    <div class="text-center">
                    <form method="GET" action="{{ route('backend.customers.index') }}">
                        <div class="text-center">
                        <button type="submit" class="btn btn-secondary">Back </button>
                        </div>
                    </form>
                    </div>

                </div>


              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </div>
    </section>


@endsection
