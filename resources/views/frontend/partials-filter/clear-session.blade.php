@if ($shoplistproducts->isNotEmpty())
@foreach ($shoplistproducts as $shoplistproduct)
<div class="col-lg-3 col-md-4 col-sm-6 singleProduct">
    <div class="product-m">
        <div class="product-m__thumb">

            <a class="aspect aspect--bg-grey aspect--square u-d-block"
                href="{{ route('frontend.product-detail', $shoplistproduct->product_code) }}">

                <img class="aspect__img"
                    src="data:image/jpeg;base64,{{ $shoplistproduct->primary_image }}"
                    alt=""></a>


        </div>
        <div class="product-m__content d-flex justify-content-evenly flex-column">

            <div class="product-m__category text-center product-o__name productName">

                <a href="{{ route('frontend.product-detail', $shoplistproduct->product_code) }}">{{ $shoplistproduct->category_id
                    }}</a>
            </div>
            <div class="product-m__name text-center product-o__name productName">

                <a
                    href="{{ route('frontend.product-detail', $shoplistproduct->product_code) }}">{{
                    $shoplistproduct->product_name }}</a>
            </div>
            <div class="product-m__rating gl-rating-style"><i class="fas fa-star"></i><i
                    class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i
                    class="far fa-star"></i><i class="far fa-star"></i>

                <span class="product-m__review">(23)</span>
            </div>
            <div>
                {{ $shoplistproduct->category_id }}<span class="product-o__price">{{ $shoplistproduct->actual_price }}<span
                        class="product-o__discount">{{ $shoplistproduct->sell_price }}</span></span>
            </div>
            <div class="product-m__hover">

            </div>
        </div>


        <div class="prevQuickAddCart d-flex justify-content-evenly">

            <div class="quicklokandWishlist bg-info d-flex justify-content-evenly align-items-center"
                style="width:40%;">

                <div class="product-m__quick-look">
                    <a class="fas fa-search" data-modal="modal"
                        data-modal-id="#quick-look-{{ $shoplistproduct->product_code }}"
                        value="{{ $shoplistproduct->product_code }}"
                        data-tooltip="tooltip" data-placement="top" title="Quick Look"
                        style="color:white; font-size:1.2rem;"></a>
                </div>
                <div class="product-m__wishlist">
                    <a class="far fa-heart" href="#" data-tooltip="tooltip"
                        data-placement="top" title="Add to Wishlist"
                        style="color:white; font-size:1.2rem;"></a>
                </div>
            </div>
            <div class="product-m__add-cart Productoption addtoCartBtnHompepage"
                style="width:100%;">

                <a class="btn--e-brand" data-modal="modal"
                    data-modal-id="#add-to-cart-{{ $shoplistproduct->product_code }}"
                    value="{{ $shoplistproduct->product_code }}">Add to Cart</a>
            </div>
        </div>
    </div>  
</div>

<!-- ---------------------------------------- -->
<!--====== Quick Look Modal ======-->
<div class="modal fade" id="quick-look-{{ $shoplistproduct->product_code }}">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal--shadow">

            <button class="btn dismiss-button fas" type="button"
                data-dismiss="modal">X</button>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-5">

                        <!--====== End - Product Breadcrumb ======-->


                        <!--====== Product Detail ======-->
                        <div class="pd u-s-m-b-30">
                            <div class="pd-wrap">
                                <div id="js-product-detail-modal">
                                    <div>

                                        <img class="u-img-fluid"
                                            src="data:image/jpeg;base64,{{ $shoplistproduct->primary_image }}"
                                            alt="">
                                    </div>
                                </div>
                            </div>
                            {{-- <div class="u-s-m-t-15">
                                <div id="js-product-detail-modal-thumbnail">
                                    <div>

                                        <img class="u-img-fluid"
                                            src="data:image/jpeg;base64,{{ $product->primary_image }}"
                                            alt="">
                                    </div>
                                </div>
                            </div> --}}
                        </div>
                        <!--====== End - Product Detail ======-->
                    </div>
                    <div class="col-lg-7">

                        <!--====== Product Right Side Details ======-->
                        <div class="pd-detail">
                            <div>

                                <span class="pd-detail__name">{{
                                    $shoplistproduct->product_name
                                    }}</span>
                            </div>
                            <div>
                                <div class="pd-detail__inline">

                                    <span class="pd-detail__price">{{
                                        $shoplistproduct->sell_price }}</span>
                                    @php
                                    $actualPrice = $shoplistproduct->actual_price;
                                    $sellPrice = $shoplistproduct->sell_price;


                                    $discountPercentage = $actualPrice > 0
                                    ? round(((($actualPrice - $sellPrice) /
                                    $actualPrice) * 100), 2)
                                    : 0;
                                    @endphp
                                    <span class="pd-detail__discount">({{
                                        $discountPercentage }}%
                                        OFF)</span><del class="pd-detail__del">{{
                                        $shoplistproduct->actual_price
                                        }}</del>
                                </div>
                            </div>
                            {{-- <div class="u-s-m-b-15">
                                <div class="pd-detail__rating gl-rating-style"><i
                                        class="fas fa-star"></i><i
                                        class="fas fa-star"></i><i
                                        class="fas fa-star"></i><i
                                        class="fas fa-star"></i><i
                                        class="fas fa-star-half-alt"></i>

                                    <span class="pd-detail__review u-s-m-l-4">

                                        <a href="product-detail.html">23
                                            Reviews</a></span>
                                </div>
                            </div> --}}
                            <div class="u-s-m-b-15">
                                <div class="pd-detail__inline">

                                    <span class="pd-detail__stock">{{
                                        $shoplistproduct->stock_quantity }}
                                        in
                                        stock</span>
                                </div>
                            </div>
                            <div class="u-s-m-b-15">
                                <form class="pd-detail__form" method="POST"
                                    action="{{ route('cart.add') }}">
                                    @csrf
                                    <div class="pd-detail-inline-2">
                                        <div class="u-s-m-b-15">

                                            <!--====== Input Counter ======-->
                                            <div class="input-counter">

                                                <span
                                                    class="input-counter__minus fas fa-minus"></span>

                                                <input
                                                    class="input-counter__text input-counter--text-primary-style"
                                                    type="text" value="1"
                                                    name="quantity" data-min="1"
                                                    data-max="1000">

                                                <span
                                                    class="input-counter__plus fas fa-plus"></span>
                                            </div>
                                            <!--====== End - Input Counter ======-->
                                        </div>
                                        <div class="u-s-m-b-15 ">

                                            <input type="hidden" name="product_code"
                                                value="{{ $shoplistproduct->product_code }}">
                                            <button class="btn btn--e-brand-b-2"
                                                type="submit">Add
                                                to
                                                Cart</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!--====== End - Product Right Side Details ======-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--====== End - Quick Look Modal ======-->

<!--====== Add to Cart Modal ======-->
<div class="modal fade" id="add-to-cart-{{ $shoplistproduct->product_code }}">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-radius modal-shadow">

            <button class="btn dismiss-button fas" type="button"
                data-dismiss="modal">X</button>
            <div class="modal-body">

                <form class="pd-detail__form" method="POST"
                    action="{{ route('cart.add') }}">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <div class="success u-s-m-b-30">
                                <div class="success__img-wrap">
                                    <img class="u-img-fluid"
                                        src="data:image/jpeg;base64,{{ $shoplistproduct->primary_image }}"
                                        alt="">
                                </div>

                                <div class="success__info-wrap">

                                    <span class="success__name">{{
                                        $shoplistproduct->product_name }}</span>

                                    <div class="input-counter">
                                        <span
                                            class="input-counter__minus fas fa-minus"></span>
                                        <input
                                            class="input-counter__text input-counter--text-primary-style"
                                            type="text" value="1" name="quantity"
                                            data-min="1" data-max="1000">
                                        <span
                                            class="input-counter__plus fas fa-plus"></span>
                                    </div>
                                    <span class="success__price">{{
                                        $shoplistproduct->sell_price
                                        }}</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="s-option">
                                <div class="s-option__link-box">
                                    <a class="s-option__link btn--e-white-brand-shadow"
                                        href="{{ route('frontend.index') }}">CONTINUE
                                        SHOPPING</a>
                                    <a class="s-option__link btn--e-white-brand-shadow"
                                        href="{{ route('frontend.cart') }}">GO TO CART
                                        PAGE</a>
                                    <input type="hidden" name="product_code"
                                        value="{{ $shoplistproduct->product_code }}">
                                    <button class="s-option__link btn--e-brand-shadow "
                                        type="submit">ADD
                                        TO CART</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--====== End - Add to Cart Modal ======-->
@endforeach
@else
<h1>Search No Result</h1>
<p>We're sorry. We cannot find any matches for your search term.</p>
@endif