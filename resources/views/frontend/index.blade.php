@extends('frontend.layouts.master')
@section('content')
<!--====== App Content ======-->
<div class="app-content">

    <!-- crousal  -->
    <div class="crousalUpper-containerP">

        <div class="crousalUpper-slider">
            @if ($carousel->isNotEmpty())
            @foreach ($carousel as $carouselItem)
            <!-- fade css -->
            <div class="crousalUpper-myslide crousalUpper-fade">
                <div class="crousalUpper-txt">
                    <a href="{{ route('frontend.explore') }}"><button type="button"
                            class="btn btn-light btn--e-brand">Shop Now !</button></a>

                    <p>Web Devoloper<br />The code for this Slider is provided below</p>
                </div>
                <img class="crousalUpper-slider_img"
                    src="{{ asset('storage/backend/carousel_images/' . $carouselItem->image_1) }}" />
            </div>

            <div class="crousalUpper-myslide crousalUpper-fade">
                <div class="crousalUpper-txt">
                    <a href="{{ route('frontend.explore') }}"><button type="button"
                            class="btn btn-light btn--e-brand">Shop Now !</button></a>

                    <p>Web Devoloper<br />The code for this Slider is provided below</p>
                </div>
                <img class="crousalUpper-slider_img"
                    src="{{ asset('storage/backend/carousel_images/' . $carouselItem->image_2) }}" />
            </div>

            <div class="crousalUpper-myslide crousalUpper-fade">
                <div class="crousalUpper-txt">
                    <a href="{{ route('frontend.explore') }}"><button type="button"
                            class="btn btn-light btn--e-brand">Shop Now !</button></a>


                    <p>Web Devoloper<br />The code for this Slider is provided below</p>
                </div>
                <img class="crousalUpper-slider_img"
                    src="{{ asset('storage/backend/carousel_images/' . $carouselItem->image_3) }}" />
            </div>
            <!-- /fade css -->

            <!-- onclick js -->
            <a class="crousalUpper-prev" onclick="crousalUpperPlusSlides(-1)"><i class="bx bx-chevron-left"></i></a>
            <a class="crousalUpper-next" onclick="crousalUpperPlusSlides(1)"><i class="bx bx-chevron-right"></i></a>

            <div class="crousalUpper-dotsbox" style="text-align: center">
                <span class="crousalUpper-dot" onclick="crousalUpperCurrentSlide(1)"></span>
                <span class="crousalUpper-dot" onclick="crousalUpperCurrentSlide(2)"></span>
                <span class="crousalUpper-dot" onclick="crousalUpperCurrentSlide(3)"></span>
            </div>
            <!-- /onclick js -->
            @endforeach
            @endif
        </div>
    </div>
    <!-- end crousal  -->



    <!--====== Section 2 ======-->
    <div class="u-s-p-b-60">

        <!--====== Section Intro ======-->
        <div class="section__intro u-s-m-b-16">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section__text-wrap">
                            <h1 class="section__heading u-c-secondary u-s-m-b-12">TOP TRENDING</h1>

                            <span class="section__span u-c-silver">CHOOSE CATEGORY</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section Intro ======-->


        <!--====== Section Content ======-->
        <div class="section__content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        @if ($categories->isNotEmpty())
                        <div class="filter-category-container">
                            <div class="filter__category-wrapper">
                                <button class="btn filter__btn filter__btn--style-1 js-checked" type="button"
                                    data-filter="*">ALL</button>
                            </div>
                            @foreach ($categories as $category)
                            <div class="filter__category-wrapper">
                                <button class="btn filter__btn filter__btn--style-1" type="button"
                                    data-filter=".{{ $category }}">{{ $category }}</button>
                            </div>
                            @endforeach
                        </div>
                        @endif
                        <div class="filter__grid-wrapper u-s-m-t-30">
                            <div class="row">
                                @if($products->isNotEmpty())
                                @foreach ($products as $product)

                                <div
                                    class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item {{ $product->category_id }}">
                                    <a class="product-o-link"
                                        href="{{ route('frontend.product-detail', $product->product_code) }}">
                                        <div class="product-o product-o--hover-on product-o--radius">

                                            <div class="product-o__wrap">
                                                <div class="aspect aspect--bg-grey aspect--square u-d-block">
                                                    <img class="aspect__img"
                                                        src="data:image/jpeg;base64,{{$product->primary_image}}" alt="">
                                                </div>

                                            </div>
                                            <!-- <span class="product-o__category">{{ $product->product_name }}</span> -->
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
                        </div>
                    </div>
                </div>



                @auth('customer')

                @else
                <!--====== Newsletter Subscribe Modal ======-->
                <!-- <div class="modal fade new-l" id="newsletter-modal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content modal--shadow">

                    <button class="btn new-l__dismiss fas" type="button" data-dismiss="modal">X</button>
                    <div class="modal-body popup">
                        <div class="row u-s-m-x-0">
                            <div class="col-lg-6 new-l__col-1 u-s-p-x-0">

                                <a class="new-l__img-wrap u-d-block" href="shop-side-version-2.html">

                                    <img class="u-img-fluid u-d-block" src="images/newsletter/newsletter.jpg" alt=""></a>
                            </div>
                            <div class="col-lg-6 new-l__col-2">
                                <div class="new-l__section u-s-m-t-30">
                                    <div class="u-s-m-b-8 new-l--center">
                                        <h3 class="new-l__h3">Explore More Product</h3>
                                    </div>
                                    <div class="u-s-m-b-30 new-l--center">
                                        <p class="new-l__p1">Be Our Member by Signing In righ now. </p>
                                    </div>
                                    <form class="new-l__form" action="{{ route('frontend.signin') }}">
                                        <div class="u-s-m-b-15">
                                            <div class="u-s-m-b-15">
                                                <button class="btn btn--e-brand-b-2" type="submit">Sign In!</button>
                                            </div>
                                    </form>
                                    <div class="u-s-m-b-15 new-l--center">
                                        <p class="new-l__p2">By Signing up, you agree to receive Reshop
                                            offers,<br />promotions and other commercial messages. You may unsubscribe at
                                            any time.</p>
                                    </div>
                                    <div class="u-s-m-b-15 new-l--center">

                                        <a class="new-l__link" data-dismiss="modal">No Thanks</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
                <!--====== End - Newsletter Subscribe Modal ======-->
                @endauth

                <div class="col-lg-12">
                    <div class="load-more">
                        <button class="btn btn--e-brand" type="button">Load More</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Section Content ======-->

</div>
<!--====== End - Section 2 ======-->



<!--====== Section 4 ======-->
<div class="u-s-p-b-60">
    <!--====== Section Intro ======-->
    <div class="section__intro u-s-m-b-46">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section__text-wrap">
                        <h1 class="section__heading u-c-secondary u-s-m-b-12">NEW ARRIVALS</h1>

                        <span class="section__span u-c-silver">GET UP FOR NEW ARRIVALS</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Section Intro ======-->

    <!--====== Section Content ======-->
    <div class="section__content">
        <div class="container">
            <div class="slider-fouc">
                <div class="owl-carousel product-slider" data-item="4">

                    @if ($newarriveproducts->isNotEmpty())
                    @foreach ($newarriveproducts as $newarriveproduct)

                    <div class="u-s-m-b-30">
                        <div class="product-o product-o--hover-on">
                            <a class="product-o__wrap"
                                href="{{ route('frontend.product-detail', $newarriveproduct->product_code) }}">

                                <div class="aspect aspect--bg-grey aspect--square u-d-block">
                                    <img class="aspect__img"
                                        src="data:image/jpeg;base64,{{ $newarriveproduct->primary_image }}" alt="">
                                </div>

                            </a>
                            <span class="product-o__category">

                                <a href="shop-side-version-2.html">{{ $newarriveproduct->category_id }}</a></span>

                            <span class="product-o__name">
                                <a href="{{ route('frontend.product-detail', $newarriveproduct->product_code) }}">{{
                                    $newarriveproduct->product_name }}</a></span>

                            <span class="product-o__price">Rs.{{ $newarriveproduct->sell_price }}

                                <span class="product-o__discount">Rs.{{ $newarriveproduct->actual_price
                                    }}</span></span>
                            <div class="quickvewandAddtocart">
                                <!-- quick view button    -->
                                <button id="quick-view-link" class="Productoption quickViewBtnHompepage"
                                    data-modal="modal" data-modal-id="#quick-look{{ $newarriveproduct->product_code }}"
                                    data-tooltip="tooltip" data-placement="top" title="Quick View"
                                    value="{{ $newarriveproduct->product_code }}"><i class="fas fa-search-plus">Quick
                                        View</i>
                                </button>

                                <button data-modal="modal" class="Productoption addtoCartBtnHompepage"
                                    data-modal-id="#add-to-cart{{ $newarriveproduct->product_code }}"
                                    data-tooltip="tooltip" data-placement="top"
                                    value="{{ $newarriveproduct->product_code }}" title="Add to Cart"><i
                                        class="fas fa-shopping-cart">Add to Cart</i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!--======End- Section Content ======-->



                    @endforeach
                    @endif
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Section Content ======-->
</div>
<!--====== End - Section 4 ======-->


<!--====== Section 5 ======-->
<div class="banner-bg">

    <!--====== Section Content ======-->
    <div class="section__content">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="banner-bg__countdown">
                        <div class="countdown countdown--style-banner" data-countdown="2020/05/01"></div>
                    </div>
                    <div class="banner-bg__wrap">
                        <div class="banner-bg__text-1">

                            <span class="u-c-white">Global</span>

                            <span class="u-c-secondary">Offers</span>
                        </div>
                        <div class="banner-bg__text-2">

                            <span class="u-c-secondary">Official Launch</span>

                            <span class="u-c-white">Don't Miss!</span>
                        </div>

                        <span class="banner-bg__text-block banner-bg__text-3 u-c-secondary">Enjoy Free Shipping when
                            you buy 2 items and above!</span>

                        <a class="banner-bg__shop-now btn--e-secondary" href="shop-side-version-2.html">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Section Content ======-->
</div>
<!--====== End - Section 5 ======-->


<!--====== Section 6 ======-->
<div class="u-s-p-y-60">

    <!--====== Section Intro ======-->
    <div class="section__intro u-s-m-b-46">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section__text-wrap">
                        <h1 class="section__heading u-c-secondary u-s-m-b-12">FEATURED PRODUCTS</h1>

                        <span class="section__span u-c-silver">FIND NEW FEATURED PRODUCTS</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Section Intro ======-->


    <!--====== Section Content ======-->
    <div class="section__content">
        <div class="container">
            <div class="row">
                @if($featureproducts->isNotEmpty())
                @foreach ($featureproducts as $featureproduct)
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                    <div class="product-o product-o--hover-on u-h-100">
                        <a class="product-o__wrap"
                            href="{{ route('frontend.product-detail', $featureproduct->product_code) }}">

                            <div class="aspect aspect--bg-grey aspect--square u-d-block">

                                <img class="aspect__img"
                                    src="data:image/jpeg;base64,{{ $featureproduct->primary_image }}" alt="">
                            </div>
                        </a>

                        <span class="product-o__category">

                            <a href="shop-side-version-2.html">{{ $featureproduct->category_id }}</a></span>

                        <span class="product-o__name">

                            <a href="{{ route('frontend.product-detail', $featureproduct->product_code) }}">{{
                                $featureproduct->product_name }}</a></span>
                        <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i
                                class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                class="fas fa-star-half-alt"></i>

                            <span class="product-o__review">(23)</span>
                        </div>

                        <span class="product-o__price">Rs.{{ $featureproduct->sell_price }}

                            <span class="product-o__discount">Rs.{{ $featureproduct->actual_price }}</span></span>
                        <div class="quickvewandAddtocart">
                            <!-- quick view button    -->
                            <button id="quick-view-link" class="Productoption quickViewBtnHompepage" data-modal="modal"
                                data-modal-id="#quick-look{{ $featureproduct->product_code }}" data-tooltip="tooltip"
                                data-placement="top" title="Quick View" value="{{ $featureproduct->product_code }}"><i
                                    class="fas fa-search-plus">Quick
                                    View</i>
                            </button>

                            <button data-modal="modal" class="Productoption addtoCartBtnHompepage"
                                data-modal-id="#add-to-cart{{ $featureproduct->product_code }}" data-tooltip="tooltip"
                                data-placement="top" value="{{ $featureproduct->product_code }}" title="Add to Cart"><i
                                    class="fas fa-shopping-cart">Add to Cart</i>
                            </button>
                        </div>
                    </div>
                </div>
                @endforeach
                @endif
            </div>
        </div>
    </div>
    <!--====== End - Section Content ======-->
</div>
<!--====== End - Section 6 ======-->


<!--====== Section 7 ======-->
<div class="u-s-p-b-60">

    <!--====== Section Content ======-->
    <div class="section__content">
        <div class="container">
            <div class="row">
                @if($carousel->isNotEmpty())
                @foreach ($carousel as $carouselItem)
                <div class="col-lg-4 col-md-4 col-sm-6 u-s-m-b-30">

                    <a class="promotion" href="{{ route('frontend.explore') }}">
                        <div class="aspect aspect--bg-grey aspect--square">

                            <img class="aspect__img promotion__img"
                                src="{{ asset('storage/backend/carousel_images/' . $carouselItem->image_1) }}" alt="">
                        </div>
                        <div class="promotion__content">
                            <div class="promotion__text-wrap">
                                <div class="promotion__text-1">

                                    <span class="u-c-secondary">EXPLORE OUR</span>
                                </div>
                                <div class="promotion__text-2">
                                    <span class="u-c-brand">GENUINE</span>
                                </div>
                                <span class="u-c-secondary">PRODUCTS</span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 u-s-m-b-30">

                    <a class="promotion" href="{{ route('frontend.newarrival') }}">
                        <div class="aspect aspect--bg-grey aspect--square">

                            <img class="aspect__img promotion__img"
                                src="{{ asset('storage/backend/carousel_images/' . $carouselItem->image_2) }}" alt="">
                        </div>
                        <div class="promotion__content">
                            <div class="promotion__text-wrap">
                                <div class="promotion__text-1">

                                    <span class="u-c-secondary">PRODUCTS</span>

                                    <span class="u-c-brand">2024</span>
                                </div>
                                <div class="promotion__text-2">

                                    <span class="u-c-secondary">NEW ARRIVALS</span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 u-s-m-b-30">

                    <a class="promotion" href="{{ route('frontend.whatsnew') }}">
                        <div class="aspect aspect--bg-grey aspect--square">

                            <img class="aspect__img promotion__img"
                                src="{{ asset('storage/backend/carousel_images/' . $carouselItem->image_3) }}" alt="">
                        </div>
                        <div class="promotion__content">
                            <div class="promotion__text-wrap">
                                <div class="promotion__text-1">

                                    <span class="u-c-secondary">WHAT"S NEW IN</span> <span class="u-c-brand">IN THIS
                                        YEAR?</span>
                                </div>
                            </div>
                            <div class="promotion__text-2">

                                <span class="u-c-brand">GET UP TO 10% OFF</span>
                            </div>
                        </div>
                </div>
                </a>
                @endforeach
                @endif
            </div>
        </div>
    </div>

</div>
<!--====== End - Section Content ======-->
</div>
<!--====== End - Section 7 ======-->


<!--====== Section 8 ======-->
<div class="u-s-p-b-60">

    <!--====== Section Content ======-->
    <div class="section__content">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                    <div class="column-product">


                        <span class="column-product__title u-c-secondary u-s-m-b-25">SPECIAL PRODUCTS</span>
                        <ul class="column-product__list">
                            @if ($specialproducts->isNotEmpty())
                            @foreach ($specialproducts as $specialproduct)
                            <li class="column-product__item">
                                <div class="product-l">
                                    <div class="product-l__img-wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link"
                                            href="{{ route('frontend.product-detail', $specialproduct->product_code) }}">

                                            <img class="aspect__img"
                                                src="data:image/jpeg;base64,{{ $specialproduct->primary_image }}"
                                                alt=""></a>
                                    </div>
                                    <div class="product-l__info-wrap">

                                        <span class="product-l__category">

                                            <a href="shop-side-version-2.html">{{ $specialproduct->category_id
                                                }}</a></span>

                                        <span class="product-l__name">

                                            <a
                                                href="{{ route('frontend.product-detail', $specialproduct->product_code) }}">{{$specialproduct->product_name}}</a></span>

                                        <span class="product-l__price">{{ $specialproduct->sell_price }}</span>
                                    </div>
                                </div>
                            </li>
                            @endforeach
                            @endif
                        </ul>

                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                    <div class="column-product">

                        <span class="column-product__title u-c-secondary u-s-m-b-25">WEEKLY PRODUCTS</span>
                        <ul class="column-product__list">
                            @if ($weeklyproducts->isNotEmpty())
                            @foreach ($weeklyproducts as $weeklyproduct)
                            <li class="column-product__item">
                                <div class="product-l">
                                    <div class="product-l__img-wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link"
                                            href="{{ route('frontend.product-detail', $weeklyproduct->product_code) }}">

                                            <img class="aspect__img"
                                                src="data:image/jpeg;base64,{{ $weeklyproduct->primary_image }}"
                                                alt=""></a>
                                    </div>
                                    <div class="product-l__info-wrap">

                                        <span class="product-l__category">

                                            <a href="shop-side-version-2.html">{{ $weeklyproduct->category_id
                                                }}</a></span>

                                        <span class="product-l__name">

                                            <a
                                                href="{{ route('frontend.product-detail', $weeklyproduct->product_code) }}">{{
                                                $weeklyproduct->product_name }}</a></span>

                                        <span class="product-l__price">{{ $weeklyproduct->sell_price }}

                                            <span class="product-l__discount">{{ $weeklyproduct->actual_price
                                                }}</span></span>
                                    </div>
                                </div>
                            </li>
                            @endforeach
                            @endif
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                    <div class="column-product">

                        <span class="column-product__title u-c-secondary u-s-m-b-25">FLASH PRODUCTS</span>
                        <ul class="column-product__list">
                            @if ($flashproducts->isNotEmpty())
                            @foreach ($flashproducts as $flashproduct)
                            <li class="column-product__item">
                                <div class="product-l">
                                    <div class="product-l__img-wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link"
                                            href="{{ route('frontend.product-detail', $flashproduct->product_code) }}">

                                            <img class="aspect__img"
                                                src="data:image/jpeg;base64,{{ $flashproduct->primary_image }}"
                                                alt=""></a>
                                    </div>
                                    <div class="product-l__info-wrap">
                                        <div class="product-l__rating gl-rating-style"><i class="fas fa-star"></i><i
                                                class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                class="far fa-star"></i><i class="far fa-star"></i></div>

                                        <span class="product-l__category">

                                            <a href="shop-side-version-2.html">{{ $flashproduct->category_id
                                                }}</a></span>

                                        <span class="product-l__name">

                                            <a
                                                href="{{ route('frontend.product-detail', $flashproduct->product_code) }}">{{
                                                $flashproduct->product_name }}</a></span>

                                        <span class="product-l__price">{{ $flashproduct->sell_price }}</span>
                                    </div>
                                </div>
                            </li>
                            @endforeach
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Section Content ======-->
</div>
<!--====== End - Section 8 ======-->


<!--====== Section 9 ======-->
<div class="u-s-p-b-60">

    <!--====== Section Content ======-->
    <div class="section__content">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 u-s-m-b-30">
                    <div class="service u-h-100">
                        <div class="service__icon"><i class="fas fa-truck"></i></div>
                        <div class="service__info-wrap">

                            <span class="service__info-text-1">Free Shipping</span>

                            <span class="service__info-text-2">Free shipping on all US order or order above $200</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 u-s-m-b-30">
                    <div class="service u-h-100">
                        <div class="service__icon"><i class="fas fa-redo"></i></div>
                        <div class="service__info-wrap">

                            <span class="service__info-text-1">Shop with Confidence</span>

                            <span class="service__info-text-2">Our Protection covers your purchase from click to
                                delivery</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 u-s-m-b-30">
                    <div class="service u-h-100">
                        <div class="service__icon"><i class="fas fa-headphones-alt"></i></div>
                        <div class="service__info-wrap">

                            <span class="service__info-text-1">24/7 Help Center</span>

                            <span class="service__info-text-2">Round-the-clock assistance for a smooth shopping
                                experience</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Section Content ======-->
</div>
<!--====== End - Section 9 ======-->



<!--====== Section 11 ======-->
<div class="u-s-p-b-90 u-s-m-b-30">

    <!--====== Section Intro ======-->
    <div class="section__intro u-s-m-b-46">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section__text-wrap">
                        <h1 class="section__heading u-c-secondary u-s-m-b-12">CLIENTS FEEDBACK</h1>

                        <span class="section__span u-c-silver">WHAT OUR CLIENTS SAY</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Section Intro ======-->


    <!--====== Section Content ======-->
    <div class="section__content">
        <div class="container">

            <!--====== Testimonial Slider ======-->
            <div class="slider-fouc">
                <div class="owl-carousel" id="testimonial-slider">
                    <div class="testimonial">
                        <div class="testimonial__img-wrap">

                            <img class="testimonial__img" src="images/about/test-1.jpg" alt="">
                        </div>
                        <div class="testimonial__content-wrap">

                            <span class="testimonial__double-quote"><i class="fas fa-quote-right"></i></span>
                            <blockquote class="testimonial__block-quote">
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illum enim consectetur,
                                    blanditiis soluta quae accusantium maiores aut ut facere porro in accusamus libero
                                    hic earum minus numquam necessitatibus officiis modi?</p>
                            </blockquote>

                            <span class="testimonial__author">Name</span>
                        </div>
                    </div>
                    <div class="testimonial">
                        <div class="testimonial__img-wrap">

                            <img class="testimonial__img" src="images/about/test-2.jpg" alt="">
                        </div>
                        <div class="testimonial__content-wrap">

                            <span class="testimonial__double-quote"><i class="fas fa-quote-right"></i></span>
                            <blockquote class="testimonial__block-quote">
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illum enim consectetur,
                                    blanditiis soluta quae accusantium maiores aut ut facere porro in accusamus libero
                                    hic earum minus numquam necessitatibus officiis modi?</p>
                            </blockquote>

                            <span class="testimonial__author">Name</span>
                        </div>
                    </div>
                    <div class="testimonial">
                        <div class="testimonial__img-wrap">

                            <img class="testimonial__img" src="images/about/test-3.jpg" alt="">
                        </div>
                        <div class="testimonial__content-wrap">

                            <span class="testimonial__double-quote"><i class="fas fa-quote-right"></i></span>
                            <blockquote class="testimonial__block-quote">
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illum enim consectetur,
                                    blanditiis soluta quae accusantium maiores aut ut facere porro in accusamus libero
                                    hic earum minus numquam necessitatibus officiis modi?</p>
                            </blockquote>

                            <span class="testimonial__author">Name</span>
                        </div>
                    </div>
                    <div class="testimonial">
                        <div class="testimonial__img-wrap">

                            <img class="testimonial__img" src="images/about/test-4.jpg" alt="">
                        </div>
                        <div class="testimonial__content-wrap">

                            <span class="testimonial__double-quote"><i class="fas fa-quote-right"></i></span>
                            <blockquote class="testimonial__block-quote">
                                <p>"Far far away, behind the word mountains, far from the countries Vokalia and
                                    Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right
                                    at the coast of the Semantics, a large language ocean."</p>
                            </blockquote>

                            <span class="testimonial__author">Name</span>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Testimonial Slider ======-->
        </div>
    </div>
    <!--====== End - Section Content ======-->
</div>
<!--====== End - Section 11 ======-->


<!--====== Section 12 ======-->
<div class="u-s-p-b-60">

    <!--====== Section Content ======-->
    <div class="section__content">
        <div class="container">

            <!--====== Brand Slider ======-->
            <div class="slider-fouc">
                <div class="owl-carousel" id="brand-slider" data-item="5">
                    <div class="brand-slide">

                        <a href="shop-side-version-2.html">

                            <img src="images/brand/b1.png" alt=""></a>
                    </div>
                    <div class="brand-slide">

                        <a href="shop-side-version-2.html">

                            <img src="images/brand/b2.png" alt=""></a>
                    </div>
                    <div class="brand-slide">

                        <a href="shop-side-version-2.html">

                            <img src="images/brand/b3.png" alt=""></a>
                    </div>
                    <div class="brand-slide">

                        <a href="shop-side-version-2.html">

                            <img src="images/brand/b4.png" alt=""></a>
                    </div>
                    <div class="brand-slide">

                        <a href="shop-side-version-2.html">

                            <img src="images/brand/b5.png" alt=""></a>
                    </div>
                    <div class="brand-slide">

                        <a href="shop-side-version-2.html">

                            <img src="images/brand/b6.png" alt=""></a>
                    </div>
                </div>
            </div>
            <!--====== End - Brand Slider ======-->
        </div>
    </div>
    <!--====== End - Section Content ======-->
</div>
<!--====== End - Section 12 ======-->
</div>
<!--====== End - App Content ======-->

@endsection