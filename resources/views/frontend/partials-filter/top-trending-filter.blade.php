<div class="filter__grid-wrapper u-s-m-t-30" id="partials-filter-top-trending">
    <div class="row">
        @if($products->isNotEmpty())
        @foreach ($products as $product)

        <div
            class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item">
            <a class="product-o-link"
                href="{{ route('frontend.product-detail', $product->product_code) }}">
                <div class="product-o product-o--hover-on product-o--radius">

                    <div class="product-o__wrap">
                        <div class="aspect aspect--bg-grey aspect--square u-d-block">
                            <img class="aspect__img"
                                src="data:image/jpeg;base64,{{$product->primary_image}}" alt="">
                        </div>

                    </div>
                    <span class="product-o__name productName">{{ $product->product_name
                        }}</span>

            </a>
            <div class="product-o__rating gl-rating-style">
                <i class="fas fa-star"></i><i class="fas fa-star"></i><i
                    class="fas fa-star"></i><i class="fas fa-star"></i><i
                    class="fas fa-star-half-alt"></i>
                <span class="product-o__review">(23)</span>
            </div>
            <span class="product-o__price">{{ $product->actual_price }} <span
                    class="product-o__discount">{{ $product->sell_price }}</span></span>
            <div class="quickvewandAddtocart">
                <!-- quick view button    -->
                <button id="quick-view-link" class="Productoption quickViewBtnHompepage"
                    data-modal="modal" data-modal-id="#quick-look{{ $product->product_code }}"
                    data-tooltip="tooltip" data-placement="top" title="Quick View"
                    value="{{ $product->product_code }}"><i class="fas fa-search-plus">Quick
                        View</i>
                </button>

                <button data-modal="modal" class="Productoption addtoCartBtnHompepage"
                    data-modal-id="#add-to-cart{{ $product->product_code }}"
                    data-tooltip="tooltip" data-placement="top"
                    value="{{ $product->product_code }}" title="Add to Cart"><i
                        class="fas fa-shopping-cart">Add to Cart</i>
                </button>
            </div>

        </div>

    </div>

    <!-- ---------------------------------------- -->
    <!--====== Quick Look Modal ======-->
    <div class="modal fade" id="quick-look{{ $product->product_code }}">
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
                                                src="data:image/jpeg;base64,{{ $product->primary_image }}"
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
                                    <span class="pd-detail__name">{{ $product->product_name
                                        }}</span>
                                </div>
                                <div>
                                    <div class="pd-detail__inline">

                                        <span class="pd-detail__price">{{
                                            $product->sell_price }}</span>
                                        @php
                                        $actualPrice = $product->actual_price;
                                        $sellPrice = $product->sell_price;


                            $discountPercentage = $actualPrice > 0
                            ? round(((($actualPrice - $sellPrice) /
                            $actualPrice) * 100), 2)
                            : 0;
                            @endphp
                            <span class="pd-detail__discount">({{
                                            $discountPercentage }}% OFF)</span><del
                                class="pd-detail__del">{{ $product->actual_price
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
                                            $product->stock_quantity }} in stock</span>
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
                                                        type="text" value="1" name="quantity"
                                                        data-min="1" data-max="1000">

                                                    <span
                                                        class="input-counter__plus fas fa-plus"></span>
                                                </div>
                                                <!--====== End - Input Counter ======-->
                                            </div>
                                            <div class="u-s-m-b-15 ">

                                                <input type="hidden" name="product_code"
                                                    value="{{ $product->product_code }}">
                                                <button class="btn btn--e-brand-b-2"
                                                    type="submit">Add to
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
    <div class="modal fade" id="add-to-cart{{ $product->product_code }}">
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
                                            src="data:image/jpeg;base64,{{ $product->primary_image }}"
                                            alt="">
                                    </div>

                                    <div class="success__info-wrap">

                            <span class="success__name">{{
                                            $product->product_name }}</span>

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
                                        <span class="success__price">{{ $product->sell_price
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
                                            value="{{ $product->product_code }}">
                                        <button class="s-option__link btn--e-brand-shadow"
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
    @endif
