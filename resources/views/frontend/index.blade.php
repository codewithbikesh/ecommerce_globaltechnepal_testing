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
                                            <div class="product-o product-o--hover-on product-o--radius">
                                                <div class="product-o__wrap">

                                                    <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                                        href="{{ route('frontend.product-detail',$product->id) }}">

                                                        <img class="aspect__img"
                                                            src="data:image/jpeg;base64,{{$product->primary_image}}" alt=""></a>
                                                    <div class="product-o__action-wrap">
                                                        <ul class="product-o__action-list">
                                                            <li>

                                                                <a class="quick-view-link" data-modal="modal" data-modal-id="#quick-look"
                                                                    data-tooltip="tooltip" data-placement="top"
                                                                    title="Quick View" value="{{ $product->id }}"><i class="fas fa-search-plus"></i></a>
                                                            </li>
                                                            <li>

                                                                <a data-modal="modal" data-modal-id="#add-to-cart"
                                                                    data-tooltip="tooltip" data-placement="top"
                                                                    title="Add to Cart"><i class="fas fa-plus-circle"></i></a>
                                                            </li>
                                                            <li>

                                                                <a href="signin.html" data-tooltip="tooltip"
                                                                    data-placement="top" title="Add to Wishlist"><i
                                                                        class="fas fa-heart"></i></a>
                                                            </li>
                                                            <li>

                                                                <a href="signin.html" data-tooltip="tooltip"
                                                                    data-placement="top"
                                                                    title="Email me When the price drops"><i
                                                                        class="fas fa-envelope"></i></a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <span class="product-o__category">

                                                    <a href="shop-side-version-2.html">{{ $product->product_name }}</a></span>

                                                <span class="product-o__name">

                                                    <a
                                                        href="{{ route('frontend.product-detail',$product->id) }}">{{ $product->product_name }}</a></span>
                                                <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i
                                                        class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                        class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>

                                                    <span class="product-o__review">(23)</span>
                                                </div>

                                                <span class="product-o__price">{{ $product->actual_price }}

                                                    <span class="product-o__discount">{{ $product->sell_price }}</span></span>
                                            </div>
                                        </div>
                                    @endforeach
                                @endif
                            </div>
                        </div>
                    </div>

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
                        <div class="u-s-m-b-30">
                            <div class="product-o product-o--hover-on">
                                <div class="product-o__wrap">

                                    <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                        href="{{ route('frontend.product-detail',$product->id) }}">

                                        <img class="aspect__img" src="images/product/electronic/product13.jpg"
                                            alt=""></a>
                                    <div class="product-o__action-wrap">
                                        <ul class="product-o__action-list">
                                            <li>

                                                <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip"
                                                    data-placement="top" title="Quick View"><i
                                                        class="fas fa-search-plus"></i></a>
                                            </li>
                                            <li>

                                                <a data-modal="modal" data-modal-id="#add-to-cart"
                                                    data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i
                                                        class="fas fa-plus-circle"></i></a>
                                            </li>
                                            <li>

                                                <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                    title="Add to Wishlist"><i class="fas fa-heart"></i></a>
                                            </li>
                                            <li>

                                                <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                    title="Email me When the price drops"><i
                                                        class="fas fa-envelope"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <span class="product-o__category">

                                    <a href="shop-side-version-2.html">Electronics</a></span>

                                <span class="product-o__name">

                                    <a href="product-detail.html">Nikon DSLR 4K Camera</a></span>
                                <div class="product-o__rating gl-rating-style"><i class="far fa-star"></i><i
                                        class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i
                                        class="far fa-star"></i>

                                    <span class="product-o__review">(0)</span>
                                </div>

                                <span class="product-o__price">$125.00

                                    <span class="product-o__discount">$160.00</span></span>
                            </div>
                        </div>
                        <div class="u-s-m-b-30">
                            <div class="product-o product-o--hover-on">
                                <div class="product-o__wrap">

                                    <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                        href="product-detail.html">

                                        <img class="aspect__img" src="images/product/electronic/product14.jpg"
                                            alt=""></a>
                                    <div class="product-o__action-wrap">
                                        <ul class="product-o__action-list">
                                            <li>

                                                <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip"
                                                    data-placement="top" title="Quick View"><i
                                                        class="fas fa-search-plus"></i></a>
                                            </li>
                                            <li>

                                                <a data-modal="modal" data-modal-id="#add-to-cart"
                                                    data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i
                                                        class="fas fa-plus-circle"></i></a>
                                            </li>
                                            <li>

                                                <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                    title="Add to Wishlist"><i class="fas fa-heart"></i></a>
                                            </li>
                                            <li>

                                                <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                    title="Email me When the price drops"><i
                                                        class="fas fa-envelope"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <span class="product-o__category">

                                    <a href="shop-side-version-2.html">Electronics</a></span>

                                <span class="product-o__name">

                                    <a href="product-detail.html">Nikon DSLR 2K Camera</a></span>
                                <div class="product-o__rating gl-rating-style"><i class="far fa-star"></i><i
                                        class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i
                                        class="far fa-star"></i>

                                    <span class="product-o__review">(0)</span>
                                </div>

                                <span class="product-o__price">$125.00

                                    <span class="product-o__discount">$160.00</span></span>
                            </div>
                        </div>
                        <div class="u-s-m-b-30">
                            <div class="product-o product-o--hover-on">
                                <div class="product-o__wrap">

                                    <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                        href="product-detail.html">

                                        <img class="aspect__img" src="images/product/electronic/product15.jpg"
                                            alt=""></a>
                                    <div class="product-o__action-wrap">
                                        <ul class="product-o__action-list">
                                            <li>

                                                <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip"
                                                    data-placement="top" title="Quick View"><i
                                                        class="fas fa-search-plus"></i></a>
                                            </li>
                                            <li>

                                                <a data-modal="modal" data-modal-id="#add-to-cart"
                                                    data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i
                                                        class="fas fa-plus-circle"></i></a>
                                            </li>
                                            <li>

                                                <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                    title="Add to Wishlist"><i class="fas fa-heart"></i></a>
                                            </li>
                                            <li>

                                                <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                    title="Email me When the price drops"><i
                                                        class="fas fa-envelope"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <span class="product-o__category">

                                    <a href="shop-side-version-2.html">Electronics</a></span>

                                <span class="product-o__name">

                                    <a href="product-detail.html">Sony DSLR 4K Camera</a></span>
                                <div class="product-o__rating gl-rating-style"><i class="far fa-star"></i><i
                                        class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i
                                        class="far fa-star"></i>

                                    <span class="product-o__review">(0)</span>
                                </div>

                                <span class="product-o__price">$125.00

                                    <span class="product-o__discount">$160.00</span></span>
                            </div>
                        </div>
                        <div class="u-s-m-b-30">
                            <div class="product-o product-o--hover-on">
                                <div class="product-o__wrap">

                                    <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                        href="product-detail.html">

                                        <img class="aspect__img" src="images/product/electronic/product16.jpg"
                                            alt=""></a>
                                    <div class="product-o__action-wrap">
                                        <ul class="product-o__action-list">
                                            <li>

                                                <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip"
                                                    data-placement="top" title="Quick View"><i
                                                        class="fas fa-search-plus"></i></a>
                                            </li>
                                            <li>

                                                <a data-modal="modal" data-modal-id="#add-to-cart"
                                                    data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i
                                                        class="fas fa-plus-circle"></i></a>
                                            </li>
                                            <li>

                                                <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                    title="Add to Wishlist"><i class="fas fa-heart"></i></a>
                                            </li>
                                            <li>

                                                <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                    title="Email me When the price drops"><i
                                                        class="fas fa-envelope"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <span class="product-o__category">

                                    <a href="shop-side-version-2.html">Electronics</a></span>

                                <span class="product-o__name">

                                    <a href="{{ route('frontend.product-detail',$product->id) }}">Sony DSLR 2K Camera</a></span>
                                <div class="product-o__rating gl-rating-style"><i class="far fa-star"></i><i
                                        class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i
                                        class="far fa-star"></i>

                                    <span class="product-o__review">(0)</span>
                                </div>

                                <span class="product-o__price">$125.00

                                    <span class="product-o__discount">$160.00</span></span>
                            </div>
                        </div>
                        <div class="u-s-m-b-30">
                            <div class="product-o product-o--hover-on">
                                <div class="product-o__wrap">

                                    <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                        href="product-detail.html">

                                        <img class="aspect__img" src="images/product/electronic/product17.jpg"
                                            alt=""></a>
                                    <div class="product-o__action-wrap">
                                        <ul class="product-o__action-list">
                                            <li>

                                                <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip"
                                                    data-placement="top" title="Quick View"><i
                                                        class="fas fa-search-plus"></i></a>
                                            </li>
                                            <li>

                                                <a data-modal="modal" data-modal-id="#add-to-cart"
                                                    data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i
                                                        class="fas fa-plus-circle"></i></a>
                                            </li>
                                            <li>

                                                <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                    title="Add to Wishlist"><i class="fas fa-heart"></i></a>
                                            </li>
                                            <li>

                                                <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                    title="Email me When the price drops"><i
                                                        class="fas fa-envelope"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <span class="product-o__category">

                                    <a href="shop-side-version-2.html">Electronics</a></span>

                                <span class="product-o__name">

                                    <a href="product-detail.html">Canon DSLR 4K Camera</a></span>
                                <div class="product-o__rating gl-rating-style"><i class="far fa-star"></i><i
                                        class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i
                                        class="far fa-star"></i>

                                    <span class="product-o__review">(0)</span>
                                </div>

                                <span class="product-o__price">$125.00

                                    <span class="product-o__discount">$160.00</span></span>
                            </div>
                        </div>
                        <div class="u-s-m-b-30">
                            <div class="product-o product-o--hover-on">
                                <div class="product-o__wrap">

                                    <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                        href="product-detail.html">

                                        <img class="aspect__img" src="images/product/electronic/product18.jpg"
                                            alt=""></a>
                                    <div class="product-o__action-wrap">
                                        <ul class="product-o__action-list">
                                            <li>

                                                <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip"
                                                    data-placement="top" title="Quick View"><i
                                                        class="fas fa-search-plus"></i></a>
                                            </li>
                                            <li>

                                                <a data-modal="modal" data-modal-id="#add-to-cart"
                                                    data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i
                                                        class="fas fa-plus-circle"></i></a>
                                            </li>
                                            <li>

                                                <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                    title="Add to Wishlist"><i class="fas fa-heart"></i></a>
                                            </li>
                                            <li>

                                                <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                    title="Email me When the price drops"><i
                                                        class="fas fa-envelope"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <span class="product-o__category">

                                    <a href="shop-side-version-2.html">Electronics</a></span>

                                <span class="product-o__name">

                                    <a href="product-detail.html">Canon DSLR 2K Camera</a></span>
                                <div class="product-o__rating gl-rating-style"><i class="far fa-star"></i><i
                                        class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i
                                        class="far fa-star"></i>

                                    <span class="product-o__review">(0)</span>
                                </div>

                                <span class="product-o__price">$125.00

                                    <span class="product-o__discount">$160.00</span></span>
                            </div>
                        </div>
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
                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                        <div class="product-o product-o--hover-on u-h-100">
                            <div class="product-o__wrap">

                                <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                    href="{{ route('frontend.product-detail',$product->id) }}">

                                    <img class="aspect__img" src="images/product/electronic/product19.jpg" alt=""></a>
                                <div class="product-o__action-wrap">
                                    <ul class="product-o__action-list">
                                        <li>

                                            <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip"
                                                data-placement="top" title="Quick View"><i
                                                    class="fas fa-search-plus"></i></a>
                                        </li>
                                        <li>

                                            <a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip"
                                                data-placement="top" title="Add to Cart"><i
                                                    class="fas fa-plus-circle"></i></a>
                                        </li>
                                        <li>

                                            <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                title="Add to Wishlist"><i class="fas fa-heart"></i></a>
                                        </li>
                                        <li>

                                            <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                title="Email me When the price drops"><i
                                                    class="fas fa-envelope"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <span class="product-o__category">

                                <a href="shop-side-version-2.html">Electronics</a></span>

                            <span class="product-o__name">

                                <a href="{{ route('frontend.product-detail',$product->id) }}">Tablet 14inch Screen</a></span>
                            <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i
                                    class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                    class="fas fa-star-half-alt"></i>

                                <span class="product-o__review">(23)</span>
                            </div>

                            <span class="product-o__price">$125.00

                                <span class="product-o__discount">$160.00</span></span>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                        <div class="product-o product-o--hover-on u-h-100">
                            <div class="product-o__wrap">

                                <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                    href="{{ route('frontend.product-detail',$product->id) }}">

                                    <img class="aspect__img" src="images/product/electronic/product20.jpg" alt=""></a>
                                <div class="product-o__action-wrap">
                                    <ul class="product-o__action-list">
                                        <li>

                                            <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip"
                                                data-placement="top" title="Quick View"><i
                                                    class="fas fa-search-plus"></i></a>
                                        </li>
                                        <li>

                                            <a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip"
                                                data-placement="top" title="Add to Cart"><i
                                                    class="fas fa-plus-circle"></i></a>
                                        </li>
                                        <li>

                                            <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                title="Add to Wishlist"><i class="fas fa-heart"></i></a>
                                        </li>
                                        <li>

                                            <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                title="Email me When the price drops"><i
                                                    class="fas fa-envelope"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <span class="product-o__category">

                                <a href="shop-side-version-2.html">Electronics</a></span>

                            <span class="product-o__name">

                                <a href="{{ route('frontend.product-detail',$product->id) }}">Tablet 18inch Screen</a></span>
                            <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i
                                    class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                    class="fas fa-star-half-alt"></i>

                                <span class="product-o__review">(23)</span>
                            </div>

                            <span class="product-o__price">$125.00

                                <span class="product-o__discount">$160.00</span></span>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                        <div class="product-o product-o--hover-on u-h-100">
                            <div class="product-o__wrap">

                                <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                    href="{{ route('frontend.product-detail',$product->id) }}">

                                    <img class="aspect__img" src="images/product/electronic/product21.jpg" alt=""></a>
                                <div class="product-o__action-wrap">
                                    <ul class="product-o__action-list">
                                        <li>

                                            <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip"
                                                data-placement="top" title="Quick View"><i
                                                    class="fas fa-search-plus"></i></a>
                                        </li>
                                        <li>

                                            <a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip"
                                                data-placement="top" title="Add to Cart"><i
                                                    class="fas fa-plus-circle"></i></a>
                                        </li>
                                        <li>

                                            <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                title="Add to Wishlist"><i class="fas fa-heart"></i></a>
                                        </li>
                                        <li>

                                            <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                title="Email me When the price drops"><i
                                                    class="fas fa-envelope"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <span class="product-o__category">

                                <a href="shop-side-version-2.html">Electronics</a></span>

                            <span class="product-o__name">

                                <a href="{{ route('frontend.product-detail',$product->id) }}">Tablet 13inch Screen Ram
                                    16GB</a></span>
                            <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i
                                    class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                    class="fas fa-star-half-alt"></i>

                                <span class="product-o__review">(23)</span>
                            </div>

                            <span class="product-o__price">$125.00

                                <span class="product-o__discount">$160.00</span></span>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                        <div class="product-o product-o--hover-on u-h-100">
                            <div class="product-o__wrap">

                                <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                    href="{{ route('frontend.product-detail',$product->id) }}">

                                    <img class="aspect__img" src="images/product/electronic/product22.jpg" alt=""></a>
                                <div class="product-o__action-wrap">
                                    <ul class="product-o__action-list">
                                        <li>

                                            <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip"
                                                data-placement="top" title="Quick View"><i
                                                    class="fas fa-search-plus"></i></a>
                                        </li>
                                        <li>

                                            <a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip"
                                                data-placement="top" title="Add to Cart"><i
                                                    class="fas fa-plus-circle"></i></a>
                                        </li>
                                        <li>

                                            <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                title="Add to Wishlist"><i class="fas fa-heart"></i></a>
                                        </li>
                                        <li>

                                            <a href="signin.html" data-tooltip="tooltip" data-placement="top"
                                                title="Email me When the price drops"><i
                                                    class="fas fa-envelope"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <span class="product-o__category">

                                <a href="shop-side-version-2.html">Electronics</a></span>

                            <span class="product-o__name">

                                <a href="{{ route('frontend.product-detail',$product->id) }}">Tablet 12inch Screen Ram
                                    16GB</a></span>
                            <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i
                                    class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                    class="fas fa-star-half-alt"></i>

                                <span class="product-o__review">(23)</span>
                            </div>

                            <span class="product-o__price">$125.00

                                <span class="product-o__discount">$160.00</span></span>
                        </div>
                    </div>
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
                    <div class="col-lg-4 col-md-4 col-sm-6 u-s-m-b-30">

                        <a class="promotion" href="{{ route('frontend.explore') }}">
                            <div class="aspect aspect--bg-grey aspect--square">

                                <img class="aspect__img promotion__img" src="images/promo/promo-img-1.jpg" alt="">
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

                                <img class="aspect__img promotion__img" src="images/promo/promo-img-2.jpg" alt="">
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

                                <img class="aspect__img promotion__img" src="images/promo/promo-img-3.jpg" alt="">
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
                            <li class="column-product__item">
                                <div class="product-l">
                                    <div class="product-l__img-wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link"
                                            href="{{ route('frontend.product-detail',$product->id) }}">

                                            <img class="aspect__img" src="images/product/electronic/product23.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="product-l__info-wrap">

                                        <span class="product-l__category">

                                            <a href="shop-side-version-2.html">Electronics</a></span>

                                        <span class="product-l__name">

                                            <a href="{{ route('frontend.product-detail',$product->id) }}">Razor Gear 15 Ram
                                                16GB</a></span>

                                        <span class="product-l__price">$125.00</span>
                                    </div>
                                </div>
                            </li>
                            <li class="column-product__item">
                                <div class="product-l">
                                    <div class="product-l__img-wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link"
                                            href="{{ route('frontend.product-detail',$product->id) }}">

                                            <img class="aspect__img" src="images/product/electronic/product24.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="product-l__info-wrap">

                                        <span class="product-l__category">

                                            <a href="shop-side-version-2.html">Electronics</a></span>

                                        <span class="product-l__name">

                                            <a href="{{ route('frontend.product-detail',$product->id) }}">Razor Gear 13 Ram
                                                16GB</a></span>

                                        <span class="product-l__price">$125.00</span>
                                    </div>
                                </div>
                            </li>
                            <li class="column-product__item">
                                <div class="product-l">
                                    <div class="product-l__img-wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link"
                                            href="{{ route('frontend.product-detail',$product->id) }}">

                                            <img class="aspect__img" src="images/product/electronic/product25.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="product-l__info-wrap">

                                        <span class="product-l__category">

                                            <a href="shop-side-version-2.html">Electronics</a></span>

                                        <span class="product-l__name">

                                            <a href="{{ route('frontend.product-detail',$product->id) }}">Razor Gear 15 Ram
                                                8GB</a></span>

                                        <span class="product-l__price">$125.00</span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                    <div class="column-product">

                        <span class="column-product__title u-c-secondary u-s-m-b-25">WEEKLY PRODUCTS</span>
                        <ul class="column-product__list">
                            <li class="column-product__item">
                                <div class="product-l">
                                    <div class="product-l__img-wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link"
                                            href="{{ route('frontend.product-detail',$product->id) }}">

                                            <img class="aspect__img" src="images/product/electronic/product26.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="product-l__info-wrap">

                                        <span class="product-l__category">

                                            <a href="shop-side-version-2.html">Electronics</a></span>

                                        <span class="product-l__name">

                                            <a href="{{ route('frontend.product-detail',$product->id) }}">Razor Gear 10 Ram
                                                16GB</a></span>

                                        <span class="product-l__price">$125.00

                                            <span class="product-l__discount">$160</span></span>
                                    </div>
                                </div>
                            </li>
                            <li class="column-product__item">
                                <div class="product-l">
                                    <div class="product-l__img-wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link"
                                            href="{{ route('frontend.product-detail',$product->id) }}">

                                            <img class="aspect__img" src="images/product/electronic/product27.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="product-l__info-wrap">

                                        <span class="product-l__category">

                                            <a href="shop-side-version-2.html">Electronics</a></span>

                                        <span class="product-l__name">

                                            <a href="product-detail.html">Razor Gear 15 Ram 8GB</a></span>

                                        <span class="product-l__price">$125.00

                                            <span class="product-l__discount">$160</span></span>
                                    </div>
                                </div>
                            </li>
                            <li class="column-product__item">
                                <div class="product-l">
                                    <div class="product-l__img-wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link"
                                            href="{{ route('frontend.product-detail',$product->id) }}">

                                            <img class="aspect__img" src="images/product/electronic/product28.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="product-l__info-wrap">

                                        <span class="product-l__category">

                                            <a href="shop-side-version-2.html">Electronics</a></span>

                                        <span class="product-l__name">

                                            <a href="{{ route('frontend.product-detail',$product->id) }}">Razor Gear 15 Ultra Ram
                                                16GB</a></span>

                                        <span class="product-l__price">$125.00

                                            <span class="product-l__discount">$160</span></span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                    <div class="column-product">

                        <span class="column-product__title u-c-secondary u-s-m-b-25">FLASH PRODUCTS</span>
                        <ul class="column-product__list">
                            <li class="column-product__item">
                                <div class="product-l">
                                    <div class="product-l__img-wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link"
                                            href="{{ route('frontend.product-detail',$product->id) }}">

                                            <img class="aspect__img" src="images/product/electronic/product29.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="product-l__info-wrap">
                                        <div class="product-l__rating gl-rating-style"><i class="fas fa-star"></i><i
                                                class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                class="far fa-star"></i><i class="far fa-star"></i></div>

                                        <span class="product-l__category">

                                            <a href="shop-side-version-2.html">Electronics</a></span>

                                        <span class="product-l__name">

                                            <a href="{{ route('frontend.product-detail',$product->id) }}">Razor Gear 20 Ultra Ram
                                                16GB</a></span>

                                        <span class="product-l__price">$125.00</span>
                                    </div>
                                </div>
                            </li>
                            <li class="column-product__item">
                                <div class="product-l">
                                    <div class="product-l__img-wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link"
                                            href="{{ route('frontend.product-detail',$product->id) }}">

                                            <img class="aspect__img" src="images/product/electronic/product30.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="product-l__info-wrap">
                                        <div class="product-l__rating gl-rating-style"><i class="fas fa-star"></i><i
                                                class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                class="far fa-star"></i><i class="far fa-star"></i></div>

                                        <span class="product-l__category">

                                            <a href="shop-side-version-2.html">Electronics</a></span>

                                        <span class="product-l__name">

                                            <a href="{{ route('frontend.product-detail',$product->id) }}">Razor Gear 11 Ultra Ram
                                                16GB</a></span>

                                        <span class="product-l__price">$125.00</span>
                                    </div>
                                </div>
                            </li>
                            <li class="column-product__item">
                                <div class="product-l">
                                    <div class="product-l__img-wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link"
                                            href="{{ route('frontend.product-detail',$product->id) }}">

                                            <img class="aspect__img" src="images/product/electronic/product31.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="product-l__info-wrap">
                                        <div class="product-l__rating gl-rating-style"><i class="fas fa-star"></i><i
                                                class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                class="far fa-star"></i><i class="far fa-star"></i></div>

                                        <span class="product-l__category">

                                            <a href="shop-side-version-2.html">Electronics</a></span>

                                        <span class="product-l__name">

                                            <a href="{{ route('frontend.product-detail',$product->id) }}">Razor Gear 10 Ultra Ram
                                                16GB</a></span>

                                        <span class="product-l__price">$125.00</span>
                                    </div>
                                </div>
                            </li>
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
@section('costomJs')
<script>
    $(document).ready(function() {
        $('.quick-view-link').on('click', function() {
        var value = $(this).attr('value');
        alert('Value attribute: ' + value);
        });
    });
    </script>
@endsection