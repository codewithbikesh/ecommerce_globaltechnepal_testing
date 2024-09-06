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
                        <div class="filter-category-container">
                            <div class="filter__category-wrapper">

                                <button class="btn filter__btn filter__btn--style-2 js-checked" type="button"
                                    data-filter="*">ALL</button>
                            </div>
                            <div class="filter__category-wrapper">

                                <button class="btn filter__btn filter__btn--style-2" type="button"
                                    data-filter=".outwear">OUTWEAR</button>
                            </div>
                            <div class="filter__category-wrapper">

                                <button class="btn filter__btn filter__btn--style-2" type="button"
                                    data-filter=".bottom">BOTTOM</button>
                            </div>
                            <div class="filter__category-wrapper">

                                <button class="btn filter__btn filter__btn--style-2" type="button"
                                    data-filter=".footwear">FOOTWEAR</button>
                            </div>
                            <div class="filter__category-wrapper">

                                <button class="btn filter__btn filter__btn--style-2" type="button"
                                    data-filter=".accessories">ACCESSORIES</button>
                            </div>
                        </div>
                        <div class="filter__grid-wrapper u-s-m-t-30">
                            <div class="row">
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item outwear">
                                    <div class="product-bs">
                                        <div class="product-bs__container">
                                            <div class="product-bs__wrap">

                                                <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                                    href="product-detail.html">

                                                    <img class="aspect__img" src="images/product/men/product11.jpg"
                                                        alt=""></a>
                                                <div class="product-bs__action-wrap">
                                                    <ul class="product-bs__action-list">
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#quick-look"><i
                                                                    class="fas fa-search-plus"></i></a>
                                                        </li>
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#add-to-cart"><i
                                                                    class="fas fa-plus-circle"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-heart"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-envelope"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <span class="product-bs__category">

                                                <a href="shop-side-version-2.html">Men Clothing</a></span>

                                            <span class="product-bs__name">

                                                <a href="product-detail.html">Black &amp; White Sweater</a></span>
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

                                                <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                                    href="product-detail.html">

                                                    <img class="aspect__img" src="images/product/women/product15.jpg"
                                                        alt=""></a>
                                                <div class="product-bs__action-wrap">
                                                    <ul class="product-bs__action-list">
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#quick-look"><i
                                                                    class="fas fa-search-plus"></i></a>
                                                        </li>
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#add-to-cart"><i
                                                                    class="fas fa-plus-circle"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-heart"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-envelope"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <span class="product-bs__category">

                                                <a href="shop-side-version-2.html">Women Clothing</a></span>

                                            <span class="product-bs__name">

                                                <a href="product-detail.html">Color Yellow Modest A Fashion</a></span>
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
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item bottom">
                                    <div class="product-bs">
                                        <div class="product-bs__container">
                                            <div class="product-bs__wrap">

                                                <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                                    href="product-detail.html">

                                                    <img class="aspect__img" src="images/product/men/product2.jpg"
                                                        alt=""></a>
                                                <div class="product-bs__action-wrap">
                                                    <ul class="product-bs__action-list">
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#quick-look"><i
                                                                    class="fas fa-search-plus"></i></a>
                                                        </li>
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#add-to-cart"><i
                                                                    class="fas fa-plus-circle"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-heart"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-envelope"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <span class="product-bs__category">

                                                <a href="shop-side-version-2.html">Men Clothing</a></span>

                                            <span class="product-bs__name">

                                                <a href="product-detail.html">White Full Men Underwear</a></span>
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
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item bottom">
                                    <div class="product-bs">
                                        <div class="product-bs__container">
                                            <div class="product-bs__wrap">

                                                <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                                    href="product-detail.html">

                                                    <img class="aspect__img" src="images/product/women/product3.jpg"
                                                        alt=""></a>
                                                <div class="product-bs__action-wrap">
                                                    <ul class="product-bs__action-list">
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#quick-look"><i
                                                                    class="fas fa-search-plus"></i></a>
                                                        </li>
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#add-to-cart"><i
                                                                    class="fas fa-plus-circle"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-heart"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-envelope"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <span class="product-bs__category">

                                                <a href="shop-side-version-2.html">Women Clothing</a></span>

                                            <span class="product-bs__name">

                                                <a href="product-detail.html">Color Yellow Modest B Fashion</a></span>
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
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item accessories">
                                    <div class="product-bs">
                                        <div class="product-bs__container">
                                            <div class="product-bs__wrap">

                                                <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                                    href="product-detail.html">

                                                    <img class="aspect__img" src="images/product/men/product3.jpg"
                                                        alt=""></a>
                                                <div class="product-bs__action-wrap">
                                                    <ul class="product-bs__action-list">
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#quick-look"><i
                                                                    class="fas fa-search-plus"></i></a>
                                                        </li>
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#add-to-cart"><i
                                                                    class="fas fa-plus-circle"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-heart"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-envelope"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <span class="product-bs__category">

                                                <a href="shop-side-version-2.html">Men Clothing</a></span>

                                            <span class="product-bs__name">

                                                <a href="product-detail.html">Blown Sunglasses For Deux</a></span>
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
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item accessories">
                                    <div class="product-bs">
                                        <div class="product-bs__container">
                                            <div class="product-bs__wrap">

                                                <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                                    href="product-detail.html">

                                                    <img class="aspect__img" src="images/product/women/product4.jpg"
                                                        alt=""></a>
                                                <div class="product-bs__action-wrap">
                                                    <ul class="product-bs__action-list">
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#quick-look"><i
                                                                    class="fas fa-search-plus"></i></a>
                                                        </li>
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#add-to-cart"><i
                                                                    class="fas fa-plus-circle"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-heart"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-envelope"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <span class="product-bs__category">

                                                <a href="shop-side-version-2.html">Women Clothing</a></span>

                                            <span class="product-bs__name">

                                                <a href="product-detail.html">Ladies Black Bag</a></span>
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
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item footwear">
                                    <div class="product-bs">
                                        <div class="product-bs__container">
                                            <div class="product-bs__wrap">

                                                <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                                    href="product-detail.html">

                                                    <img class="aspect__img" src="images/product/men/product13.jpg"
                                                        alt=""></a>
                                                <div class="product-bs__action-wrap">
                                                    <ul class="product-bs__action-list">
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#quick-look"><i
                                                                    class="fas fa-search-plus"></i></a>
                                                        </li>
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#add-to-cart"><i
                                                                    class="fas fa-plus-circle"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-heart"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-envelope"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <span class="product-bs__category">

                                                <a href="shop-side-version-2.html">Men Clothing</a></span>

                                            <span class="product-bs__name">

                                                <a href="product-detail.html">Casual Shoes Independence</a></span>
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
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item footwear">
                                    <div class="product-bs">
                                        <div class="product-bs__container">
                                            <div class="product-bs__wrap">

                                                <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                                    href="product-detail.html">

                                                    <img class="aspect__img" src="images/product/men/product14.jpg"
                                                        alt=""></a>
                                                <div class="product-bs__action-wrap">
                                                    <ul class="product-bs__action-list">
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#quick-look"><i
                                                                    class="fas fa-search-plus"></i></a>
                                                        </li>
                                                        <li>

                                                            <a data-modal="modal" data-modal-id="#add-to-cart"><i
                                                                    class="fas fa-plus-circle"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-heart"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html"><i class="fas fa-envelope"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <span class="product-bs__category">

                                                <a href="shop-side-version-2.html">Men Clothing</a></span>

                                            <span class="product-bs__name">

                                                <a href="product-detail.html">Men Casual Shoes Charcoal</a></span>
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