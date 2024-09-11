@extends('frontend.layouts.master')
@section('content')
<!--====== App Content ======-->
<div class="app-content">
    <div class="section__text-wrap">
        <h1 class="section__heading u-c-secondary u-s-m-b-12">Let's Explore</h1>

        <span class="section__span u-c-silver">CHOOSE CATEGORY</span>
    </div>
    <!-- FILTER | CATEGORY  -->
    <div class="filter-container flex justify-between">
        <div class="filter-group">
            <select id="price-filter" class="filter-title">
                <option value="" disabled selected>Price Filter</option>
                <option value="500 to 1K">500 to 1K</option>
                <option value="2K to 5K">2K to 5K</option>
                <option value="5K to 10K">5K to 10K</option>
                <option value="10K and Above">10K and Above</option>
            </select>
        </div>
        <div class="filter-group">
            <select id="" class="filter-title">
                <option value="" disabled selected>Brand</option>
                <option value="Brand A">Brand A</option>
                <option value="Brand">Brand B</option>
                <option value="Brand">Brand C</option>
                <option value="Brand">Brand D</option>
            </select>
        </div>
        <div class="filter-group">
            <select id="" class="filter-title">
                <option value="" disabled selected>Discount</option>
                <option value="">10% Off</option>
                <option value="">20% Off</option>
                <option value="">35% Off</option>
                <option value="">50% Off</option>
            </select>
        </div>
        <div class="filter-group">
            <select id="" class="filter-title">
                <option value="" disabled selected>Gender</option>
                <option value="">For Men</option>
                <option value="">For Women</option>
                <option value="">For Babies</option>
                <option value="">For Teenage</option>
            </select>
        </div>
        <div class="filter-group">
            <select id="" class="filter-title">
                <option value="" disabled selected>Occasion</option>
                <option value="">Cocktail</option>
                <option value="">Diwali</option>
                <option value="">Haldi</option>
                <option value="">Tihar</option>
                <option value="">Birthday</option>
            </select>
        </div>
        <div class="filter-group">
            <select id="" class="filter-title">
                <option value="" disabled selected>Sale According</option>
                <option value="">More Sold</option>
                <option value="">Less Sale</option>
                <option value="">Not Sold Yet</option>
            </select>
        </div>
    </div>

    <div class="filter__grid-wrapper u-s-m-t-30" style="position: relative; height: 1173.75px;">
        <div class="row">
        @if ($explores->isNotEmpty())
            @foreach ($explores as $explore)
            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item" id="product-list-filter"
                style="position: absolute; left: 0px; top: 0px;">
                <div class="product-o product-o--hover-on product-o--radius">
                    <a class="product-o__wrap" href="{{ route('frontend.product-detail', $explore->product_code) }}">

                        <div class="aspect aspect--bg-grey aspect--square u-d-block">

                            <img class="aspect__img" src="data:image/jpeg;base64,{{$explore->primary_image}}" alt=""></div>
                    </a>

                    <span class="product-o__category">

                        <a href="shop-side-version-2.html">{{ $explore->category_id }}</a></span>

                    <span class="product-o__name">

                        <a href="product-detail.html">{{ $explore->product_name }}</a></span>
                    <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i
                            class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                            class="fas fa-star-half-alt"></i>

                        <span class="product-o__review">(23)</span>
                    </div>

                    <span class="product-o__price">Rs.{{ $explore->actual_price }}

                        <span class="product-o__discount">Rs.{{ $explore->sell_price }}</span></span>
                        <div class="quickvewandAddtocart">
                            <!-- quick view button    -->
                            <button id="quick-view-link" class="Productoption quickViewBtnHompepage"
                                data-modal="modal" data-modal-id="#quick-look{{ $explore->product_code }}"
                                data-tooltip="tooltip" data-placement="top" title="Quick View"
                                value="{{ $explore->product_code }}"><i class="fas fa-search-plus">Quick
                                    View</i>
                            </button>

                            <button data-modal="modal" class="Productoption addtoCartBtnHompepage"
                                data-modal-id="#add-to-cart{{ $explore->product_code }}"
                                data-tooltip="tooltip" data-placement="top"
                                value="{{ $explore->product_code }}" title="Add to Cart"><i
                                    class="fas fa-shopping-cart">Add to Cart</i>
                                </button>
                        </div>
                </div>
            </div>
            
                            <!-- ---------------------------------------- -->
                            <!--====== Quick Look Modal ======-->
                            <div class="modal fade" id="quick-look{{ $explore->product_code }}">
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
                                                                        src="data:image/jpeg;base64,{{ $explore->primary_image }}"
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

                                                <span class="pd-detail__name">{{ $explore->product_name }}</span>
                                            </div>
                                            <div>
                                                <div class="pd-detail__inline">

                                                    <span class="pd-detail__price">{{
                                                                    $explore->sell_price }}</span>
                                                    @php
                                                    $actualPrice = $explore->actual_price;
                                                    $sellPrice = $explore->sell_price;


                                                    $discountPercentage = $actualPrice > 0
                                                    ? round(((($actualPrice - $sellPrice) /
                                                    $actualPrice) * 100), 2)
                                                    : 0;
                                                    @endphp
                                                    <span class="pd-detail__discount">({{
                                                                    $discountPercentage }}% OFF)</span><del
                                                        class="pd-detail__del">{{ $explore->actual_price
                                                                                                                                }}</del>
                                                </div>
                                            </div>
                                            <div class="u-s-m-b-15">
                                                <div class="pd-detail__inline">

                                                    <span class="pd-detail__stock">{{
                                                                    $explore->stock_quantity }} in stock</span>
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

                                                                <span class="input-counter__minus fas fa-minus"></span>

                                                                <input
                                                                    class="input-counter__text input-counter--text-primary-style"
                                                                    type="text" value="1" name="quantity" data-min="1"
                                                                    data-max="1000">

                                                                <span class="input-counter__plus fas fa-plus"></span>
                                                            </div>
                                                            <!--====== End - Input Counter ======-->
                                                        </div>
                                                        <div class="u-s-m-b-15 ">

                                                            <input type="hidden" name="product_code"
                                                                value="{{ $explore->product_code }}">
                                                            <button class="btn btn--e-brand-b-2" type="submit">Add to
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
                <div class="modal fade" id="add-to-cart{{ $explore->product_code }}">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content modal-radius modal-shadow">

                            <button class="btn dismiss-button fas" type="button" data-dismiss="modal">X</button>
                            <div class="modal-body">

                                <form class="pd-detail__form" method="POST" action="{{ route('cart.add') }}">
                                    @csrf
                                    <div class="row">
                                        <div class="col-lg-6 col-md-12">
                                            <div class="success u-s-m-b-30">
                                                <div class="success__img-wrap">
                                                    <img class="u-img-fluid"
                                                        src="data:image/jpeg;base64,{{ $explore->primary_image }}"
                                                        alt="">
                                                </div>

                                                <div class="success__info-wrap">

                                                    <span class="success__name">{{
                                                                    $explore->product_name }}</span>

                                                    <div class="input-counter">
                                                        <span class="input-counter__minus fas fa-minus"></span>
                                                        <input
                                                            class="input-counter__text input-counter--text-primary-style"
                                                            type="text" value="1" name="quantity" data-min="1"
                                                            data-max="1000">
                                                        <span class="input-counter__plus fas fa-plus"></span>
                                                    </div>

                                                    <span
                                                        class="success__price">{{ $explore->sell_price
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
                                                        href="{{ route('frontend.cart') }}">GO TO CART PAGE</a>

                                                    <input type="hidden" name="product_code"
                                                        value="{{ $explore->product_code }}">
                                                    <button class="s-option__link btn--e-brand-shadow" type="submit">ADD
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
            <p>No products found in this price range.</p>
            @endif
        </div>
    </div>
    @endsection
    @section('costomJs')
    <script>
        $('#price-filter').on('change', function() {
    var selectedValue = $(this).val();
    $.ajax({
        url: "{{ route('frontend.explore') }}",
        type: 'GET',
        data: { price_range: selectedValue },
        success: function(response) {
            $('#product-list-filter').html(response);
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);  
        }
        
    });
});
        </script>
    @endsection