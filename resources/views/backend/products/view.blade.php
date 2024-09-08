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
                  <h5 class="card-title">Product Details</h5>
                </div>

                  <div class="row">
                    <div class="col-lg-6 col-md-6 label ">Product Code</div>
                    <div class="col-lg-6 col-md-6">{{ $product->product_code }}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Product Name</div>
                    <div class="col-lg-6 col-md-6">{{ $product->product_name }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Category</div>
                    <div class="col-lg-6 col-md-6">{{ $product->category_id }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Actual Price</div>
                    <div class="col-lg-6 col-md-6">{{ $product->actual_price }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Sell Price</div>
                    <div class="col-lg-6 col-md-6">{{ $product->sell_price }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Stock Quantity</div>
                    <div class="col-lg-6 col-md-6">{{ $product->stock_quantity }}</div>
                  </div>
                                    
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Image</div>
                    <div class="col-lg-6 col-md-6">{{ $product->primary_image }}</div>
                  </div>
                  
                    <div class="text-center">
                    <form method="GET" action="{{ route('backend.products.index') }}">
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
