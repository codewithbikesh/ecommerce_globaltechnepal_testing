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
                  <h5 class="card-title">User Details</h5>
                </div>

                  <div class="row">
                    <div class="col-lg-6 col-md-6 label ">Full Name</div>
                    <div class="col-lg-6 col-md-6">{{ $user->name }}</div>
                  </div>


                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Email</div>
                    <div class="col-lg-6 col-md-6">{{ $user->email }}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Phone</div>
                    <div class="col-lg-6 col-md-6">{{ $user->phone }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Address</div>
                    <div class="col-lg-6 col-md-6">{{ $user->address }}</div>
                  </div>
                                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Country</div>
                    <div class="col-lg-6 col-md-6">{{ $user->country }}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Account Type</div>
                    <div class="col-lg-6 col-md-6">{{ $user->account_type }}</div>
                  </div>
                  
                    <div class="text-center">
                    <form method="GET" action="{{ route('backend.users.index') }}">
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
