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
                            <h1 class="section__heading u-c-secondary u-s-m-b-12">SEE WHAT"S NEW HERE</h1>

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
                                    data-filter=".{{ $category }}">{{ $category }}</button>
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
                                       <div class="product-o__wrap">

                                           <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                               href="{{ route('frontend.product-detail',$whatsnewproduct->id) }}">

                                               <img class="aspect__img"
                                                   src="data:image/jpeg;base64,{{$whatsnewproduct->primary_image}}" alt=""></a>
                                           <div class="product-o__action-wrap">
                                               <ul class="product-o__action-list">
                                                   <li>

                                                       <a id="quick-view-link" data-modal="modal" data-modal-id="#quick-look{{ $whatsnewproduct->id }}"
                                                           data-tooltip="tooltip" data-placement="top"
                                                           title="Quick View" value="{{ $whatsnewproduct->id }}"><i class="fas fa-search-plus"></i></a>
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

                                           <a href="shop-side-version-2.html">{{ $whatsnewproduct->product_name }}</a></span>

                                       <span class="product-o__name">

                                           <a
                                               href="{{ route('frontend.product-detail',$whatsnewproduct->id) }}">{{ $whatsnewproduct->product_name }}</a></span>
                                       <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i
                                               class="fas fa-star"></i><i class="fas fa-star"></i><i
                                               class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>

                                           <span class="product-o__review">(23)</span>
                                       </div>

                                       <span class="product-o__price">{{ $whatsnewproduct->actual_price }}

                                           <span class="product-o__discount">{{ $whatsnewproduct->sell_price }}</span></span>
                                   </div>
                               </div>                                       
<!--====== Quick Look Modal ======-->
<div class="modal fade" id="quick-look{{ $whatsnewproduct->id }}">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal--shadow">

            <button class="btn dismiss-button fas fa-times" type="button" data-dismiss="modal"></button>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-5">
                        <!--====== Product Detail ======-->
                        <div class="pd u-s-m-b-30">
                            <div class="pd-wrap">
                                <div id="js-product-detail-modal">
                                    <div>

                                        <img class="u-img-fluid" src="data:image/jpeg;base64,{{ $whatsnewproduct->primary_image }}" alt="">
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

                                <span class="pd-detail__name">{{ $whatsnewproduct->product_name }}</span>
                            </div>
                            <div>
                                <div class="pd-detail__inline">

                                    <span class="pd-detail__price">{{ $whatsnewproduct->sell_price }}</span>
                                    @php
                                $actualPrice = $whatsnewproduct->actual_price;
                                $sellPrice = $whatsnewproduct->sell_price;
                            
                               
                                $discountPercentage = $actualPrice > 0 
                                    ? round(((($actualPrice - $sellPrice) / $actualPrice) * 100), 2) 
                                    : 0;
                                   @endphp
                                    <span class="pd-detail__discount">({{  $discountPercentage }}% OFF)</span><del
                                        class="pd-detail__del">{{ $whatsnewproduct->actual_price }}</del>
                                </div>
                            </div>
                            <div class="u-s-m-b-15">
                                <div class="pd-detail__inline">
                                    <span class="pd-detail__stock">{{ $whatsnewproduct->stock_quantity }} in stock</span>
                                </div>
                            </div>
                            <div class="u-s-m-b-15">
                                <form class="pd-detail__form">
                                    <div class="pd-detail-inline-2">
                                        <div class="u-s-m-b-15">

                                            <!--====== Input Counter ======-->
                                            <div class="input-counter">

                                                <span class="input-counter__minus fas fa-minus"></span>

                                                <input class="input-counter__text input-counter--text-primary-style"
                                                    type="text" value="1" data-min="1" data-max="1000">

                                                <span class="input-counter__plus fas fa-plus"></span>
                                            </div>
                                            <!--====== End - Input Counter ======-->
                                        </div>
                                        <div class="u-s-m-b-15">

                                            <button class="btn btn--e-brand-b-2" type="submit">Add to Cart</button>
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



</div>
<!--====== End - App Content ======-->
@endsection