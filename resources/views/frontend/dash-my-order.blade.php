@extends('frontend.layouts.app')
@section('contents')

    <!--====== Section 2 ======-->
    <div class="u-s-p-b-60">
        <!--====== Section Content ======-->
        <div class="section__content">
            <div class="dash">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 col-md-12 ordersParent">
                            <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white u-s-m-b-30">
                                <div class="dash__pad-2">
                                    <h1 class="dash__h1 u-s-m-b-14">My Orders</h1>

                                    <span class="dash__text u-s-m-b-30">Here you can see all products that have been
                                        delivered.</span>
                                    <form class="m-order u-s-m-b-30">
                                        <div class="m-order__select-wrapper">

                                            <label class="u-s-m-r-8" for="my-order-sort">Show:</label><select
                                                class="select-box select-box--primary-style" id="my-order-sort">
                                                <option selected>Last 5 orders</option>
                                                <option>Last 15 days</option>
                                                <option>Last 30 days</option>
                                                <option>Last 6 months</option>
                                                <option>Orders placed in 2018</option>
                                                <option>All Orders</option>
                                            </select>
                                        </div>
                                    </form>
                                    <div class="m-order__list">

                                        @forelse($orders as $order)
                                        <div class="m-order__get">
                                            

                                            <div class="manage-o__header u-s-m-b-30">
                                                <div class="dash-l-r">
                                                    <div>
                                                        <div class="manage-o__text-2 u-c-secondary">Order {{ $order->order_id }}
                                                        </div>
                                                        <div class="manage-o__text u-c-silver">Placed on {{ $order->created_at->format('d M Y H:i:s') }}</div>
                                                    </div>
                                                    <div>
                                                        <div class="dash__link dash__link--brand">

                                                            <a href="dash-manage-order.html">MANAGE</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        
        @forelse($order->orderItems as $item)
                                            <div class="manage-o__description">
                                                <div class="description__container">
                                                    <div class="description__img-wrap">

                                                        <img class="u-img-fluid"
                                                            src="data:image/jpeg;base64,{{$item->product->primary_image}}" alt="">
                                                    </div>
                                                    <div class="description-title">{{ $item->product->product_name }}</div>
                                                </div>
                                                <div class="description__info-wrap">
                                                    <div>

                                                        <span
                                                            class="manage-o__badge badge--processing">{{ ucfirst($order->order_status) }}</span>
                                                    </div>
                                                    <div>

                                                        <span class="manage-o__text-2 u-c-silver">Quantity:

                                                            <span class="manage-o__text-2 u-c-secondary">{{ $item->quantity }}</span></span>
                                                    </div>
                                                    <div>

                                                        <span class="manage-o__text-2 u-c-silver">Total:

                                                            <span
                                                                class="manage-o__text-2 u-c-secondary">{{ number_format($item->subtotal, 2) }}</span></span>
                                                    </div>
                                                </div>
                                            </div>
                               
        @empty
        <p>No items found for this order.</p>
        @endforelse
                                        </div>

                                        @empty
                                        <p>No orders found.</p>
                                    @endforelse

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section Content ======-->
    </div>
    <!--====== End - Section 2 ======-->


<!--====== End - App Content ======-->

@endsection