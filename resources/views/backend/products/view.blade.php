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
                    <div class="col-lg-6 col-md-6 label">Product Description</div>
                    <div class="col-lg-6 col-md-6">{{ $product->product_description }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Category</div>
                    <div class="col-lg-6 col-md-6">{{ $product->category_name }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Sub Category</div>
                    <div class="col-lg-6 col-md-6">{{ $product->subcategory_name }}</div>
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
                    <div class="col-lg-6 col-md-6 label">Available Quantity</div>
                    <div class="col-lg-6 col-md-6">{{ $product->available_quantity }}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Stock Quantity</div>
                    <div class="col-lg-6 col-md-6">{{ $product->stock_quantity }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Brand Name</div>
                    <div class="col-lg-6 col-md-6">{{ $product->brand_name }}</div>
                  </div>
                                    
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Image</div>
                    <div class="col-lg-6 col-md-6">
                      
                    @if($product->primary_image)
                      <img src="data:image/jpeg;base64,{{ $product->primary_image }}" alt="Product Image" style="max-width: 100%; height: auto;">
                    @else
                      <p>No image available</p>
                    @endif

                    </div>
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
