@extends('backend.layout.master')
@section('content')


<div class="pagetitle">
  <h1>Orders</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Orders</li>
    </ol>
  </nav>
</div><!-- End Page Title --> 

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Orders</h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th scope="col">S.N.</th>
            <th scope="col">Order ID</th>
            <th scope="col">Order By</th>
            <th scope="col">Shipping Address</th>
            <th scope="col">Total Items</th>
            <th scope="col">Total Amount</th>
            <th scope="col">Order Status</th>
            <th scope="col">Payment Status</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
          @foreach($orders as $index => $order)
          <tr>
            <th scope="row">{{ $index + 1 }}</th>
            <td><a href="{{ route('backend.orders.view', $order->id) }}">{{ $order->order_id }}</a></td>
            <td>{{ $order->customer->full_name }}</td>
            <td>{{ $order->deliveryInformation->address }}, {{ $order->deliveryInformation->city->city }}, {{ $order->deliveryInformation->province->province_name }}</td>
            <td>{{ $order->total_items }}</td>
            <td>{{ $order->total_amount }}</td>
            <td>{{ ucfirst($order->order_status) }}</td>
            <td>{{ ucfirst($order->payment_status) }}</td>
            <td>
              <div style="display: flex; align-items: center;">
                <form method="get" action="{{ route('backend.orders.view', $order->id) }}" style="margin-right: 10px;">
                @csrf
                  <button style="background-color: transparent; border: none;" type="submit">
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
