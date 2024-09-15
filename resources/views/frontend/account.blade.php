@extends('frontend.layouts.app')
@section('contents')



                                    <div class="rightOptions">
                                    <div class="midetailsOfUser d-flex">
                                   <!-- Personal Profile Section -->
                                <div class="col-xl-4">
                                    <div class="card">
                                        <div class="card-body profile-card pt-4 d-flex flex-column align-items-start">
                                            <div class="d-flex justify-content-between w-100">
                                                <h2 class="fa section__heading">Personal Profile</h2>
                                                <form method="get" action="{{ route('frontend.profile.edit') }}">
                                                    <button class="btn btn-primary">Edit
                                        
                                                </form>
                                            </div>
                                  
                                            <p>{{ $customer_user->full_name }}</p>
                                            <p>{{ $customer_user->email }}</p>
                                            <p>{{ $customer_user->phone }}</p>

                                            <div class="moreAccountBtn">
                                                            <button class="btn btn-primary moreActionBtnButton">Account Menu</button>
       
                                            </div>

                                      
                                        </div>
                                    </div>
                                </div>

                                <!-- Address Book Section -->
                                <div class="col-xl-8">
                                    <div class="card">
                                        <div class="card-body profile-card pt-4 d-flex flex-column align-items-start">
                                            <div class="d-flex justify-content-between w-100">
                                                <h2 class="fa section__heading">Address Book</h2>
                                                <form method="get" action="{{ route('frontend.address.book') }}">
                                                <button class="btn btn-primary" type="submit">Edit Address
                                                    Book</button>
                                                </form>
                                            </div>

                                            <!-- Address Sections -->
                                            <div class="mt-4">
                                                <div class="row">
                                                    <!-- Shipping Address Section -->
                                                    <div class="col-md-6">
                                                        <div class="address-section">
                                                            <h3>Default Shipping Address</h3>
                                                            <p id="shipping-address">
                                                                @if($defaultShippingAddress)
                                                                    {{ $defaultShippingAddress->address }},
                                                                    {{ $defaultShippingAddress->city ? $defaultShippingAddress->city->city : '' }},
                                                                    {{ $defaultShippingAddress->province ? $defaultShippingAddress->province->province_name : '' }},
                                                                    {{ $defaultShippingAddress->phone }}
                                                                @else
                                                                    No default shipping address set.
                                                                @endif
                                                            </p>
                                                        </div>
                                                    </div>

                                                    <!-- Billing Address Section -->
                                                    <div class="col-md-6">
                                                        <div class="address-section">
                                                            <h3>Default Billing Address</h3>
                                                            <p id="billing-address">
                                                                @if($defaultBillingAddress)
                                                                    {{ $defaultBillingAddress->address }},
                                                                    {{ $defaultBillingAddress->city ? $defaultBillingAddress->city->city : '' }},
                                                                    {{ $defaultBillingAddress->province ? $defaultBillingAddress->province->province_name : '' }},
                                                                    {{ $defaultBillingAddress->phone }}
                                                                @else
                                                                    No default billing address set.
                                                                @endif
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>

                                    </div>
                                

                                                      <!-- roound icons number   -->
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


                        <div class="dash__box dash__box--shadow dash__box--bg-white dash__box--radius bellowAllOrdered ">
                            <h2 class="dash__h2 section__heading u-s-p-xy-20 recOrderHeding fa centerBlockText">RECENT ORDERS</h2>
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

                                                            <img class="u-img-fluid" src="data:image/jpeg;base64,{{$item->product->primary_image}}"
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
                                            <p class="centerBlockText">No recent orders found.</p>
                                        @endif
                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                                    </div>
            @endsection





