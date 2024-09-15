@extends('backend.layout.master')
@section('content')

<style>
.breadcrumb {
  padding: 0;
  margin: 0;
  list-style: none;
  display: flex;
  flex-wrap: wrap;
}

.breadcrumb-item {
  margin-right: 5px;
}

.breadcrumb-item + .breadcrumb-item:before {
  content: " / ";
}
</style>

<div class="pagetitle">
  <h1>Order Details</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Order Details</li>
    </ol>
  </nav>
</div><!-- End Page Title --> 

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Order Details</h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      
    <div class="row">
      <!-- Order Information -->
      <div class="col-md-4">
          <h3>Order Information</h3>
          <div class="mb-3">
              <strong>Order ID:</strong>
              <p>{{ $order->order_id }}</p>
          </div>
          <div class="mb-3">
              <strong>Order Date:</strong>
              <p>{{ $order->created_at->format('d M Y H:i:s') }}</p>
          </div>
          <div class="mb-3">
              <strong>Order Status:</strong>
              <p>{{ ucfirst($order->order_status) }}</p>
          </div>
          <div class="mb-3">
              <strong>Payment Status:</strong>
              <p>{{ ucfirst($order->payment_status) }}</p>
          </div>
      </div>

      <!-- Customer Information -->
      <div class="col-md-4">
          <h3>Customer Information</h3>
          <div class="mb-3">
              <strong>Name:</strong>
              <p>{{ $order->customer->full_name }}</p>
          </div>
          <div class="mb-3">
              <strong>Email:</strong>
              <p>{{ $order->customer->email }}</p>
          </div>
          <div class="mb-3">
              <strong>Phone:</strong>
              <p>{{ $order->customer->phone }}</p>
          </div>
      </div>
      
      <!-- Shipping Address -->
      <div class="col-md-4">
        <h3>Shipping Address</h3>
        <div class="mb-3">
            <strong>Province:</strong>
            <p>{{ $order->deliveryInformation->province->province_name }}</p>
        </div>
        <div class="mb-3">
            <strong>City:</strong>
            <p>{{ $order->deliveryInformation->city->city }}</p>
        </div>
        <div class="mb-3">
            <strong>Street Address:</strong>
            <p>{{ $order->deliveryInformation->address }}</p>
        </div>
    </div>
    
  </div>


    <h3>Order Items</h3>
      <table class="table table-bordered" width="100%" cellspacing="0">
        <thead>
          <tr>
              <th>S.N.</th>
              <th>Product Name</th>
              <th>Quantity</th>
              <th>Price</th>
              <th>Subtotal</th>
          </tr>
      </thead>
      <tbody>
          @foreach($order->orderItems as $item)
          <tr>
              <td>{{ $loop->iteration }}</td>
              <td>{{ $item->product->product_name }}</td>
              <td>{{ $item->quantity }}</td>
              <td>{{ number_format($item->price, 2) }}</td>
              <td>{{ number_format($item->subtotal, 2) }}</td>
          </tr>
          @endforeach

        </tbody>
      </table>
      
    <p><strong>Total Items:</strong> {{ $order->total_items }}</p>
    <p><strong>Shipping Cost:</strong> {{ number_format($order->shipping_cost, 2) }}</p>
    <p><strong>Sub Total:</strong> {{ number_format($order->subtotal, 2) }}</p>
    <p><strong>Tax:</strong> {{ number_format($order->tax, 2) }}</p>
    <p><strong>Total Amount:</strong> {{ number_format($order->total_amount, 2) }}</p>

    </div>
  </div>
</div>

@endsection
