@extends('frontend.layouts.master')
@section('content')
<!--====== App Content ======-->
<div class="app-content">

    <div class="u-s-p-b-60">

        <!--====== Section Intro ======-->
        <div class="section__intro u-s-m-b-16">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section__text-wrap">
                            <h1 class="section__heading u-c-secondary u-s-m-b-12">SEE WHAT"S NEW HERE </h1>

                            <span class="section__span u-c-silver u-s-m-b-16">FIND PRODUCTS THAT ARE UPLOADED
                                RECENLY</span>
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
                        @if ($newcategories->isNotEmpty())
                        <div class="filter-category-container">
                            <div class="filter__category-wrapper">

                                <button class="btn filter__btn filter__btn--style-2 js-checked" type="button"
                                    data-filter="*">ALL</button>
                            </div>
                            @foreach ($newcategories as $category)
                            <div class="filter__category-wrapper">

                                <button class="btn filter__btn filter__btn--style-2" type="button"
                                    data-filter=".{{ $category->category_id }}">{{ $category->category_name }}</button>
                            </div>
                            @endforeach
                        </div>
                        @endif
                        <div class="filter__grid-wrapper u-s-m-t-30">
                            <div class="row">
                                @if ($whatsnewproducts->isNotEmpty())
                                @foreach ($whatsnewproducts as $whatsnewproduct)
                                <div
                                    class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item {{ $whatsnewproduct->category_id }}">
                                    <div class="product-o product-o--hover-on product-o--radius">
                                        <a class="product-o__wrap"
                                            href="{{ route('frontend.product-detail',$whatsnewproduct->product_code) }}">

                                            <div class="aspect aspect--bg-grey aspect--square u-d-block">

                                                <img class="aspect__img"
                                                    src="data:image/jpeg;base64,{{$whatsnewproduct->primary_image}}"
                                                    alt="">
                                            </div>
                                        </a>
                                        <span class="product-o__category">

                                            <a href="{{ route('frontend.product-detail',$whatsnewproduct->product_code) }}">{{ $whatsnewproduct->category_name
                                                }}</a></span>

                                        <span class="product-o__name">

                                            <a
                                                href="{{ route('frontend.product-detail',$whatsnewproduct->product_code) }}">{{
                                               Str::limit($whatsnewproduct->product_name, 29, '...') }}</a></span>
                                        <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i
                                                class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>

                                            <span class="product-o__review">(23)</span>
                                        </div>

                                        <span class="product-o__price">{{ $whatsnewproduct->sell_price }}

                                            <span class="product-o__discount">{{ $whatsnewproduct->actual_price
                                                }}</span></span>
                                        <div class="quickvewandAddtocart">
                                            <!-- quick view button    -->
                                            <button id="quick-view-link" class="Productoption quickViewBtnHompepage"
                                                data-modal="modal"
                                                data-modal-id="#quick-look{{ $whatsnewproduct->product_code }}"
                                                data-tooltip="tooltip" data-placement="top" title="Quick View"
                                                value="{{ $whatsnewproduct->product_code }}"><i
                                                    class="fas fa-search-plus">Quick
                                                    View</i>
                                            </button>

                                            <button data-modal="modal" class="Productoption addtoCartBtnHompepage"
                                                data-modal-id="#add-to-cart{{ $whatsnewproduct->product_code }}"
                                                data-tooltip="tooltip" data-placement="top"
                                                value="{{ $whatsnewproduct->product_code }}" title="Add to Cart"><i
                                                    class="fas fa-shopping-cart">Add to Cart</i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!--====== Quick Look Modal ======-->
                                <div class="modal fade" id="quick-look{{ $whatsnewproduct->product_code }}">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content modal--shadow">

                                            <button class="btn dismiss-button fas fa-times" type="button"
                                                data-dismiss="modal"></button>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-lg-5">
                                                        <!--====== Product Detail ======-->
                                                        <div class="pd u-s-m-b-30">
                                                            <div class="pd-wrap">
                                                                <div id="js-product-detail-modal">
                                                                    <div>

                                                                        <img class="u-img-fluid"
                                                                            src="data:image/jpeg;base64,{{ $whatsnewproduct->primary_image }}"
                                                                            alt="">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--====== End - Product Detail ======-->
                                                    </div>
                                                    <div class="col-lg-7">

                                                        <!--====== Product Right Side Details ======-->
                                                        <div class="pd-detail">
                                                            <div>

                                                                <span class="pd-detail__name">{{
                                                                    $whatsnewproduct->product_name }}</span>
                                                            </div>
                                                            <div>
                                                                <div class="pd-detail__inline">

                                                                    <span class="pd-detail__price">{{
                                                                        $whatsnewproduct->sell_price }}</span>
                                                                    @php
                                                                    $actualPrice = $whatsnewproduct->actual_price;
                                                                    $sellPrice = $whatsnewproduct->sell_price;


                                                                    $discountPercentage = $actualPrice > 0
                                                                    ? round(((($actualPrice - $sellPrice) /
                                                                    $actualPrice) * 100), 2)
                                                                    : 0;
                                                                    @endphp
                                                                    <span class="pd-detail__discount">({{
                                                                        $discountPercentage }}% OFF)</span><del
                                                                        class="pd-detail__del">{{
                                                                        $whatsnewproduct->actual_price }}</del>
                                                                </div>
                                                            </div>
                                                            <div class="u-s-m-b-15">
                                                                <div class="pd-detail__inline">
                                                                    <span class="pd-detail__stock">{{
                                                                        $whatsnewproduct->stock_quantity }} in
                                                                        stock</span>
                                                                </div>
                                                            </div>
                                                            <div class="u-s-m-b-15">
                                                                <form class="pd-detail__form">
                                                                    <div class="pd-detail-inline-2">
                                                                        <div class="u-s-m-b-15">

                                                                            <!--====== Input Counter ======-->
                                                                            <div class="input-counter">

                                                                                <span
                                                                                    class="input-counter__minus fas fa-minus"></span>

                                                                                <input
                                                                                    class="input-counter__text input-counter--text-primary-style"
                                                                                    type="text" value="1" data-min="1"
                                                                                    data-max="1000">

                                                                                <span
                                                                                    class="input-counter__plus fas fa-plus"></span>
                                                                            </div>
                                                                            <!--====== End - Input Counter ======-->
                                                                        </div>
                                                                        <div class="u-s-m-b-15">

                                                                            <button class="btn btn--e-brand-b-2"
                                                                                type="submit">Add to Cart</button>
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
                                <div class="modal fade" id="add-to-cart{{ $whatsnewproduct->product_code }}">
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
                                                                        src="data:image/jpeg;base64,{{ $whatsnewproduct->primary_image }}"
                                                                        alt="">
                                                                </div>

                                                                <div class="success__info-wrap">

                                                                    <span class="success__name">{{
                                                                        $whatsnewproduct->product_name }}</span>

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
                                                                    <span class="success__price">{{ $whatsnewproduct->sell_price
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
                                                                        value="{{ $whatsnewproduct->product_code }}">
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
                    {{-- <div class="col-lg-12">
                        <div class="load-more">

                            <button class="btn btn--e-brand" type="button">Load More</button>
                        </div>
                    </div> --}}
                    <div style="padding: 10px">
                        {{ $whatsnewproducts->links('pagination::bootstrap-5') }}
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section Content ======-->
    </div>



</div>
<!--====== End - App Content ======-->
@endsection