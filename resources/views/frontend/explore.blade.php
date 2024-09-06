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

            <select id="" class="filter-title">
  <option value="" disabled selected>Price Filter</option>
  <option value="500 to 1K">500 to 1K</option>
  <option value="2K to 5K">2K to 5K</option>
  <option value="5K to 10 K">5K to 10 K</option>
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
                                        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item headphone" style="position: absolute; left: 0px; top: 0px;">
                                            <div class="product-o product-o--hover-on product-o--radius">
                                                <div class="product-o__wrap">

                                                    <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                                        <img class="aspect__img" src="images/product/electronic/product2.jpg" alt=""></a>
                                                    <div class="product-o__action-wrap">
                                                        <ul class="product-o__action-list">
                                                            <li>

                                                                <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="" data-original-title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                            <li>

                                                                <a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="" data-original-title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                           
                                                        </ul>
                                                    </div>
                                                </div>

                                                <span class="product-o__category">

                                                    <a href="shop-side-version-2.html">Electronics</a></span>

                                                <span class="product-o__name">

                                                    <a href="product-detail.html">Red Wireless Headphone</a></span>
                                                <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>

                                                    <span class="product-o__review">(23)</span></div>

                                                <span class="product-o__price">$125.00

                                                    <span class="product-o__discount">$160.00</span></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
              @endsection