@extends('frontend.layouts.master')
@section('content')
<!--====== App Content ======-->
<div class="app-content">
    <!--====== Section 2 ======-->
    <div class="u-s-p-b-60">



        <!--====== Section Content ======-->
        <div class="section__content">
            <div class="dash">
                <div class="container">
                    <div class="row" style="justify-content: center;">
                        <div class="dashboardpageLink">

                            <style>
                                /* Ensure horizontal alignment for heading and button */
                                .card-body .d-flex {
                                    display: flex;
                                    align-items: center;
                                    /* Center items vertically */
                                    justify-content: space-between;
                                    /* Space out the heading and button */
                                    width: 100%;
                                }

                                /* Optional: Add margin for better spacing */
                                .card-body h2 {
                                    margin-bottom: 0;
                                    /* Remove default margin for better alignment */
                                }

                                .card-body .btn {
                                    margin-left: auto;
                                    /* Push the button to the right */
                                }

                                /* Add spacing between address sections */
                                .address-section {
                                    margin-bottom: 1rem;
                                    /* Adjust as needed */
                                }
                            </style>
                            <div class="row">
                                <!-- Personal Profile Section -->
                                <div class="col-xl-4">
                                    <div class="card">
                                        <div class="card-body profile-card pt-4 d-flex flex-column align-items-start">
                                            <div class="d-flex justify-content-between w-100">
                                                <h2>Personal Profile</h2>
                                                <button class="btn btn-primary" onclick="editPersonalProfile()">Edit
                                                    Profile</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Address Book Section -->
                                <div class="col-xl-8">
                                    <div class="card">
                                        <div class="card-body profile-card pt-4 d-flex flex-column align-items-start">
                                            <div class="d-flex justify-content-between w-100">
                                                <h2>Address Book</h2>
                                                <button class="btn btn-primary" onclick="editAddressBook()">Edit Address
                                                    Book</button>
                                            </div>

                                            <!-- Address Sections -->
                                            <div class="mt-4">
                                                <div class="row">
                                                    <!-- Shipping Address Section -->
                                                    <div class="col-md-6">
                                                        <div class="address-section">
                                                            <h3>Default Shipping Address</h3>
                                                            <p id="shipping-address">123 Main Street, Springfield, IL,
                                                                62701</p>
                                                        </div>
                                                    </div>

                                                    <!-- Billing Address Section -->
                                                    <div class="col-md-6">
                                                        <div class="address-section">
                                                            <h3>Default Billing Address</h3>
                                                            <p id="billing-address">456 Elm Street, Springfield, IL,
                                                                62701</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <!--====== Dashboard Features ======-->
                            <div class="dash__box dash__box--bg-white dash__box--shadow u-s-m-b-30 ">
                                <div class="dash__pad-1 pageLinkParent">

                                    <span class="dash__text u-s-m-b-16 userName">Welcome,
                                        {{ Auth::guard('customer')->user()->full_name }}!</span>
                                    <ul class="dash__f-list pageUl">
                                        <li>
                                            <a class="dash-active" href="{{ route('frontend.account') }}">Manage My
                                                Account</a>
                                        </li>

                                        <li>
                                            <a href="{{ route('frontend.dash-my-order') }}">My Orders</a>
                                        </li>

                                        <li>
                                            <a href="{{ route('frontend.dash-cancellation') }}">My Returns &
                                                Cancellations</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--====== End - Dashboard Features ======-->
                        </div>


                        <ul class="dash__w-list  d-flex justify-content-around orderMng">
                            <li>
                                <div class="dash__w-wrap">

                                    <span class="dash__w-icon dash__w-icon-style-1"><i
                                            class="fas fa-cart-arrow-down"></i></span>

                                    <span class="dash__w-text">{{ $orderCount }}</span>

                                    <span class="dash__w-name">Orders Placed</span>
                                </div>
                            </li>
                            <li>
                                <div class="dash__w-wrap">

                                    <span class="dash__w-icon dash__w-icon-style-2"><i class="fas fa-times"></i></span>

                                    <span class="dash__w-text">{{ $cancelledCount }}</span>

                                    <span class="dash__w-name">Cancel Orders</span>
                                </div>
                            </li>
                            <li>
                                <div class="dash__w-wrap">

                                    <span class="dash__w-icon dash__w-icon-style-3"><i class="far fa-heart"></i></span>

                                    <span class="dash__w-text">0</span>

                                    <span class="dash__w-name">Wishlist</span>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <div class="dash__box dash__box--shadow dash__box--bg-white dash__box--radius bellowAllOrdered ">
                        <h2 class="dash__h2 u-s-p-xy-20 recOrderHeding">RECENT ORDERS</h2>
                        <div class="dash__table-wrap gl-scroll dashboardRecentOrder">
                            <table class="dash__table">
                                <thead>
                                    <tr>
                                        <th>Order #</th>
                                        <th>Placed On</th>
                                        <th>Items</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    @if($order)
                                        @foreach($orderItems as $item)
                                            <tr>
                                                <td>{{ $item->order_id }}</td>
                                                <td>{{ $item->created_at->format('d/m/Y') }}</td>
                                                <td>
                                                    <div class="dash__table-img-wrap">

                                                        <img class="u-img-fluid"
                                                            src="data:image/jpeg;base64,{{$item->product->primary_image}}"
                                                            alt="">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="dash__table-total">

                                                        <span>{{ $item->subtotal }}</span>
                                                    </div>
                                                </td>
                                            </tr>

                                        @endforeach
                                    @else
                                        <p>No recent orders found.</p>
                                    @endif

                                </tbody>
                            </table>
                        </div>
                    </div>



                </div>
            </div>
        </div>
        <!--====== End - Section Content ======-->
    </div>
    <!--====== End - Section 2 ======-->
</div>
<!--====== End - App Content ======-->
@endsection