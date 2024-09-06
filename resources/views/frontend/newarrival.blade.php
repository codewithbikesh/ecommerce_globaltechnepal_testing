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
                            <h1 class="section__heading u-c-secondary u-s-m-b-12">New Arrival</h1>

                            <span class="section__span u-c-silver u-s-m-b-16">FIND PRODUCTS THAT ARE MOST SELLING</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section Intro ======-->


        <!-- ====== Section Content ======            | ALL NEW ARRIVAL PTODUCT APPEARS HERE -->
        <div class="section__content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="filter__grid-wrapper u-s-m-t-30">
                            <div class="row">
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item outwear">
                                    <div class="product-bs">
                                        <div class="product-bs__container">
                                            <div class="product-bs__wrap">

                                                <div class="aspect aspect--bg-grey aspect--square u-d-block">

                                                    <img class="aspect__img" src="images/product/men/product11.jpg"
                                                        alt="">
                                                </div>
                                            </div>

                                            <span class="product-bs__category">

                                                <a href="shop-side-version-2.html">Men Clothing</a></span>

                                            <span class="product-bs__name">

                                                <div>Black &amp; White Sweater</div>
                                            </span>
                                            <div class="product-bs__rating gl-rating-style"><i
                                                    class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                    class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                    class="far fa-star"></i>

                                                <span class="product-bs__review">(23)</span>
                                            </div>

                                            <span class="product-bs__price">$125.00

                                                <span class="product-bs__discount">$160.00</span></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item outwear">
                                    <div class="product-bs">
                                        <div class="product-bs__container">
                                            <div class="product-bs__wrap">

                                                <div class="aspect aspect--bg-grey aspect--square u-d-block">

                                                    <img class="aspect__img" src="images/product/women/product15.jpg"
                                                        alt="">
                                                </div>
                                            </div>

                                            <span class="product-bs__category">

                                                <a href="shop-side-version-2.html">Women Clothing</a></span>

                                            <span class="product-bs__name">

                                                <div>Color Yellow Modest A Fashion</div>
                                            </span>
                                            <div class="product-bs__rating gl-rating-style"><i
                                                    class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                    class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                    class="far fa-star"></i>

                                                <span class="product-bs__review">(23)</span>
                                            </div>

                                            <span class="product-bs__price">$125.00

                                                <span class="product-bs__discount">$160.00</span></span>
                                        </div>
                                    </div>
                                </div>
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