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

                                    <!--====== Dashboard Features ======-->
                                    <div class="dash__box dash__box--bg-white dash__box--shadow u-s-m-b-30 ">
                                        <div class="dash__pad-1 pageLinkParent">

                                            <span class="dash__text u-s-m-b-16 userName">Hello, John Doe</span>
                                            <ul class="dash__f-list pageUl">
                                                <li>

                                                    <a class="dash-active" href="dashboard.html">Manage My Account</a>
                                                </li>

                                                <li>

                                                    <a href="dash-my-order.html">My Orders</a>
                                                </li>

                                                <li>

                                                    <a href="dash-cancellation.html">My Returns & Cancellations</a>
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

                                            <span class="dash__w-text">4</span>

                                            <span class="dash__w-name">Orders Placed</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dash__w-wrap">

                                            <span class="dash__w-icon dash__w-icon-style-2"><i
                                                    class="fas fa-times"></i></span>

                                            <span class="dash__w-text">0</span>

                                            <span class="dash__w-name">Cancel Orders</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dash__w-wrap">

                                            <span class="dash__w-icon dash__w-icon-style-3"><i
                                                    class="far fa-heart"></i></span>

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
                                                    <tr>
                                                        <td>3054231326</td>
                                                        <td>26/13/2016</td>
                                                        <td>
                                                            <div class="dash__table-img-wrap">

                                                                <img class="u-img-fluid" src="images/product/electronic/product3.jpg" alt=""></div>
                                                        </td>
                                                        <td>
                                                            <div class="dash__table-total">

                                                                <span>$126.00</span>
                                                            </div>
                                                        </td>
                                                    </tr>
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