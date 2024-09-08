@extends('backend.layout.master')
@section('content')


<div class="pagetitle">
  <h1>Products</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Products</li>
    </ol>
  </nav>
</div><!-- End Page Title --> 

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Products</h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th scope="col">S.N.</th>
            <th scope="col">Product Code</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col">Actual Price</th>
            <th scope="col">Sell Price</th>
            <th scope="col">Stock Quantity</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
          @foreach ($products as $index => $product)
          <tr>
            <th scope="row">{{ $index + 1 }}</th>
            <td>{{ $product->product_code }}</td>
            <td>{{ $product->product_name }}</td>
            <td>{{ $product->category_id }}</td>
            <td>{{ $product->actual_price }}</td>
            <td>{{ $product->sell_price }}</td>
            <td>{{ $product->stock_quantity }}</td>
            <td>
              <div style="display: flex; align-items: center;">
                <form method="post" action="{{ route('backend.products.view') }}" style="margin-right: 10px;">
                @csrf
                  <input type="hidden" name="product_code" value="{{ $product->product_code }}"></button>
                  <button style="background-color: transparent; border: none;">
                    <i title="View Details" class="fa fa-info-circle" style="font-size:35px;color:#24a0ed"></i>
                  </button>
                </form>
                &nbsp;

              </div>
            </td>
          </tr>

          @endforeach
        </tbody>
      </table>
    </div>
  </div>
</div>

@endsection
