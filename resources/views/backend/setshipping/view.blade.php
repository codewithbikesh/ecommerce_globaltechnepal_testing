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
                  <h5 class="card-title">Shipping Cost Details</h5>
                </div>

                  <div class="row">
                    <div class="col-lg-6 col-md-6 label ">Province</div>
                    <div class="col-lg-6 col-md-6">
                      @if ($shipping->province == '1')
                          Province 1
                      @elseif ($shipping->province == '2')
                          Madhesh
                      @elseif ($shipping->province == '3')
                          Bagmati
                      @elseif ($shipping->province == '4')
                          Gandaki
                      @elseif ($shipping->province == '5')
                          Lumbini
                      @elseif ($shipping->province == '6')
                          Karnali
                      @elseif ($shipping->province == '7')
                          Sudurpaschim
                      @else
                          Unknown
                      @endif
                    </div>
                  </div>


                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">City</div>
                    <div class="col-lg-6 col-md-6">{{ $shipping->city }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Shipping Cost</div>
                    <div class="col-lg-6 col-md-6">{{ $shipping->shipping_cost }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Remarks</div>
                    <div class="col-lg-6 col-md-6">{{ $shipping->remarks }}</div>
                  </div>
                                    
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Created Date</div>
                    <div class="col-lg-6 col-md-6">{{ $shipping->created_at }}</div>
                  </div>
                  
                    <div class="text-center">
                    <form method="GET" action="{{ route('backend.setshipping.index') }}">
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
