@extends('frontend.layouts.master')
@section('content')
<!--====== App Content ======-->
<div class="app-content">

    <!--====== Section 1 ======-->
    <div class="u-s-p-t-90">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <!--====== Product Detail Zoom ======-->
                    <div class="pd u-s-m-b-30">
                        <div class="slider-fouc pd-wrap">
                            <div id="pd-o-initiate">

                            @if($productDetails && $productDetails->images->isNotEmpty())
                                @foreach($productDetails->images as $image)
                                    <div class="pd-o-img-wrap" data-src="{{ asset($image->image_path) }}">
                                        <img class="u-img-fluid" src="{{ asset($image->image_path) }}"
                                             data-zoom-image="{{ asset($image->image_path) }}" alt="">
                                    </div>
                                @endforeach
                            @else
                            <div class="pd-o-img-wrap" data-src="{{ asset('client-side/images/no-image.png') }}">
                                <img class="u-img-fluid" src="{{ asset('client-side/images/no-image.png') }}"
                                     data-zoom-image="{{ asset('client-side/images/no-image.png') }}" alt="">
                            </div>
                            @endif


                            </div>

                            {{-- <span class="pd-text">Click for larger zoom</span> --}}
                        </div>
                        <div class="u-s-m-t-15">
                            <div class="slider-fouc">
                                <div id="pd-o-thumbnail">

                                    @foreach($productDetails->images as $image)
                                    <div>
                                        <img class="u-img-fluid" src="{{ asset($image->image_path) }}" alt="">
                                    </div>
                                    @endforeach


                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Product Detail Zoom ======-->
                </div>
                <div class="col-lg-7">

                    <!--====== Product Right Side Details ======-->
                    <div class="pd-detail">
                        <div>

                            <span class="pd-detail__name">{{ $productDetails->product_name }}</span>
                        </div>
                        <div>
                            <div class="pd-detail__inline">

                                <span class="pd-detail__price">{{ $productDetails->sell_price }}</span>
                                @php
                                $actualPrice = $productDetails->actual_price;
                                $sellPrice = $productDetails->sell_price;
                            
                                // Avoid division by zero and negative percentages
                                $discountPercentage = $actualPrice > 0 
                                    ? round(((($actualPrice - $sellPrice) / $actualPrice) * 100), 2) 
                                    : 0;
                            @endphp
                                <span class="pd-detail__discount">({{ $discountPercentage }}% OFF)</span><del
                                    class="pd-detail__del">{{ $productDetails->actual_price }}</del>
                            </div>
                        </div>
                        <div class="u-s-m-b-15">
                            <div class="pd-detail__rating gl-rating-style"><i class="fas fa-star"></i><i
                                    class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                    class="fas fa-star-half-alt"></i>

                                <span class="pd-detail__review u-s-m-l-4">

                                    <a data-click-scroll="#view-review">23 Reviews</a></span>
                            </div>
                        </div>
                        <div class="u-s-m-b-15">
                            <div class="pd-detail__inline">

                                <span class="pd-detail__stock">{{ $productDetails->stock_quantity }} in stock</span>

                                {{-- <span class="pd-detail__left">Only 2 left</span> --}}
                            </div>
                        </div>
                        <div class="u-s-m-b-15">

                            <span class="pd-detail__preview-desc">{{ $productDetails->product_description }}</span>
                        </div>
                        <div class="u-s-m-b-15">
                                <form class="pd-detail__form" method="POST" action="{{ route('cart.add') }}">
                                    @csrf
                                <div class="pd-detail-inline-2">
                                    <div class="u-s-m-b-15">

                                        <!--====== Input Counter ======-->
                                        <div class="input-counter">

                                            <span class="input-counter__minus fas fa-minus"></span>

                                            <input class="input-counter__text input-counter--text-primary-style"
                                                type="text" value="1" name="quantity" data-min="1" data-max="1000">

                                            <span class="input-counter__plus fas fa-plus"></span>
                                        </div>
                                        <!--====== End - Input Counter ======-->
                                    </div>
                                    <div class="u-s-m-b-15">
                                        <input type="hidden" name="product_code"
                                        value="{{ $productDetails->product_code }}">
                                        <button class="btn btn--e-brand-b-2" type="submit">Add to Cart</button>

                                        {{-- <button class="btn btn--e-brand-b-2" type="submit">Buy Now</button> --}}
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="u-s-m-b-15">

                            <span class="pd-detail__label u-s-m-b-8">Product Policy:</span>
                            <ul class="pd-detail__policy-list">
                                <li><i class="fas fa-check-circle u-s-m-r-8"></i>

                                    <span>Buyer Protection.</span>
                                </li>
                                <li><i class="fas fa-check-circle u-s-m-r-8"></i>

                                    <span>Full Refund if you don't receive your order.</span>
                                </li>
                                <li><i class="fas fa-check-circle u-s-m-r-8"></i>

                                    <span>Returns accepted if product not as described.</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--====== End - Product Right Side Details ======-->
                </div>
            </div>
        </div>
    </div>

    <!--====== Product Detail Tab ======-->
    <div class="u-s-p-y-90">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="pd-tab">
                        <div class="u-s-m-b-30">
                            <ul class="nav pd-tab__list">
                                <li class="nav-item">

                                    <a class="nav-link active" data-toggle="tab" href="#pd-desc">DESCRIPTION</a>
                                </li>
                                <li class="nav-item">

                                    <a class="nav-link " id="view-review" data-toggle="tab" href="#pd-rev">REVIEWS

                                        <span>(23)</span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content">

                            <!--====== Tab 1 ======-->
                            <div class="tab-pane active" id="pd-desc">
                                <div class="pd-tab__desc">
                                    <div class="u-s-m-b-15">
                                        <p>{{ $productDetails->product_description }}</p>
                                    </div>

                                    <div class="u-s-m-b-30">
                                        <ul>
                                            <li><i class="fas fa-check u-s-m-r-8"></i>

                                                <span>Buyer Protection.</span>
                                            </li>
                                            <li><i class="fas fa-check u-s-m-r-8"></i>

                                                <span>Full Refund if you don't receive your order.</span>
                                            </li>
                                            <li><i class="fas fa-check u-s-m-r-8"></i>

                                                <span>Returns accepted if product not as described.</span>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="u-s-m-b-15">
                                        <h4>PRODUCT INFORMATION</h4>
                                    </div>
                                    <div class="u-s-m-b-15">
                                        <div class="pd-table gl-scroll">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>Main Material</td>
                                                        <td>Cotton</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Color</td>
                                                        <td>Green, Blue, Red</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Sleeves</td>
                                                        <td>Long Sleeve</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Top Fit</td>
                                                        <td>Regular</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Print</td>
                                                        <td>Not Printed</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Neck</td>
                                                        <td>Round Neck</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Pieces Count</td>
                                                        <td>1 Piece</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Occasion</td>
                                                        <td>Casual</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Shipping Weight (kg)</td>
                                                        <td>0.5</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--====== End - Tab 1 ======-->



                            <!--====== Tab 3 ======-->
                            <div class="tab-pane fade show" id="pd-rev">
                                <div class="pd-tab__rev">
                                    <div class="u-s-m-b-30">
                                        <div class="pd-tab__rev-score">
                                            <div class="u-s-m-b-8">
                                                <h2>23 Reviews - 4.6 (Overall)</h2>
                                            </div>
                                            <div class="gl-rating-style-2 u-s-m-b-8"><i class="fas fa-star"></i><i
                                                    class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                    class="fas fa-star"></i><i class="fas fa-star-half-alt"></i></div>
                                            <div class="u-s-m-b-8">
                                                <h4>We want to hear from you!</h4>
                                            </div>

                                            <span class="gl-text">Tell us what you think about this item</span>
                                        </div>
                                    </div>
                                    <div class="u-s-m-b-30">
                                        <form class="pd-tab__rev-f1">
                                            <div class="rev-f1__group">
                                                <div class="u-s-m-b-15">
                                                    <h2>23 Review(s) for Man Ruched Floral Applique Tee</h2>
                                                </div>
                                                <div class="u-s-m-b-15">

                                                    <label for="sort-review"></label><select
                                                        class="select-box select-box--primary-style" id="sort-review">
                                                        <option selected>Sort by: Best Rating</option>
                                                        <option>Sort by: Worst Rating</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="rev-f1__review">
                                                <div class="review-o u-s-m-b-15">
                                                    <div class="review-o__info u-s-m-b-8">

                                                        <span class="review-o__name">John Doe</span>

                                                        <span class="review-o__date">27 Feb 2018 10:57:43</span>
                                                    </div>
                                                    <div class="review-o__rating gl-rating-style u-s-m-b-8"><i
                                                            class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                            class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                            class="far fa-star"></i>

                                                        <span>(4)</span>
                                                    </div>
                                                    <p class="review-o__text">{{ $productDetails->product_description }}</p>
                                                </div>


                                            </div>
                                        </form>
                                    </div>
                                    <div class="u-s-m-b-30">
                                        <form class="pd-tab__rev-f2">
                                            <h2 class="u-s-m-b-15">Add a Review</h2>

                                            <span class="gl-text u-s-m-b-15">Your email address will not be published.
                                                Required fields are marked *</span>

                                            <div class="rev-f2__group">
                                                <div class="u-s-m-b-15">

                                                    <label class="gl-label" for="reviewer-text">YOUR REVIEW
                                                        *</label><textarea class="text-area text-area--primary-style"
                                                        id="reviewer-text"></textarea>
                                                </div>
                                                <div>
                                                    <p class="u-s-m-b-30">

                                                        <label class="gl-label" for="reviewer-name">NAME *</label>

                                                        <input class="input-text input-text--primary-style" type="text"
                                                            id="reviewer-name">
                                                    </p>
                                                    <p class="u-s-m-b-30">

                                                        <label class="gl-label" for="reviewer-email">EMAIL *</label>

                                                        <input class="input-text input-text--primary-style" type="text"
                                                            id="reviewer-email">
                                                    </p>
                                                </div>
                                            </div>
                                            <div>

                                                <button class="btn btn--e-brand-shadow" type="submit">SUBMIT</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--====== End - Tab 3 ======-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--====== End - Section 1 ======-->
</div>
<!--====== End - App Content ======-->
@endsection