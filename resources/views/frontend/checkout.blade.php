@extends('frontend.layouts.master')
@section('content')
<!--====== App Content ======-->
<div class="app-content">

    <!--====== Section 1 ======-->
    <div class="u-s-p-y-60">

        <!--====== Section Content ======-->
        <div class="section__content">
            <div class="container">
                <div class="breadcrumb">
                    <div class="breadcrumb__wrap">
                        <ul class="breadcrumb__list">
                            <li class="has-separator">

                                <a href="{{ route('frontend.index') }}">Home</a>
                            </li>
                            <li class="is-marked">

                                <a href="{{ route('frontend.checkout') }}">Checkout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Section 1 ======-->



    <!--====== Section 3 ======-->
    <div class="u-s-p-b-60">

        <!--====== Section Content ======-->
        <div class="section__content">
            <div class="container">
                <div class="checkout-f">
                    <div class="row">
                        <div class="col-lg-6">
                            <h1 class="checkout-f__h1">DELIVERY INFORMATION</h1>
                            <form class="checkout-f__delivery" method="POST" action="{{ route('frontend.delivery.information') }}">
                                @csrf
                                <div class="u-s-m-b-30">
                                    <div class="u-s-m-b-15">
                                    
                                    @auth('customer')
                                        <!--====== Check Box ======-->
                                        <div class="check-box">

                                            <input type="checkbox" id="get-address" name="default_address">
                                            <div class="check-box__state check-box__state--primary">

                                                <label class="check-box__label" for="get-address">Use default shipping
                                                    and billing address from account</label>
                                            </div>
                                        </div>
                                        <!--====== End - Check Box ======-->
                                    @endauth

                                    </div>

                                    <!--====== First Name, Last Name ======-->
                                    <div class="gl-inline">

                                        <div class="u-s-m-b-15">
                                            <label class="gl-label" for="billing-fname">YOUR FULL NAME *</label>

                                            <input class="input-text input-text--primary-style" name="full_name" type="text"
                                                id="billing-fname" data-bill="" required>
                                        </div>
                                    </div>
                                    <!--====== End - First Name, Last Name ======-->


                                    <!--====== E-MAIL ======-->
                                    <div class="u-s-m-b-15">

                                        <label class="gl-label" for="billing-email">E-MAIL *</label>

                                        <input class="input-text input-text--primary-style" name="email" type="text"
                                            id="billing-email" data-bill="" required>
                                    </div>
                                    <!--====== End - E-MAIL ======-->


                                    <!--====== PHONE ======-->
                                    <div class="u-s-m-b-15">

                                        <label class="gl-label" for="billing-phone">PHONE *</label>

                                        <input class="input-text input-text--primary-style" name="phone" type="text"
                                            id="billing-phone" data-bill="" required>
                                    </div>
                                    <!--====== End - PHONE ======-->


                                    <!--====== Street Address ======-->
                                    <div class="u-s-m-b-15">

                                        <label class="gl-label" for="billing-street">STREET ADDRESS *</label>

                                        <input class="input-text input-text--primary-style" type="text"
                                            id="billing-street" name="street_address" placeholder="House name and street name" data-bill="" required>
                                    </div>
                                    <!--====== End - Street Address ======-->


                                    <!--====== Town / City ======-->
                                    <div class="u-s-m-b-15">

                                        <label class="gl-label" for="billing-town-city">TOWN/CITY *</label>

                                        <input class="input-text input-text--primary-style" name="city" type="text"
                                            id="billing-town-city" data-bill="" required>
                                    </div>
                                    <!--====== End - Town / City ======-->


                                    <!--====== STATE/PROVINCE ======-->
                                    <div class="u-s-m-b-15">

                                        <!--====== Select Box ======-->

                                        <label class="gl-label" for="billing-state">STATE/PROVINCE *</label><select
                                            class="select-box select-box--primary-style" name="province" id="billing-state"
                                            data-bill="" required>
                                            <option selected value="" disabled>Choose Province</option>
                                            <option value="1">Province 1</option>
                                            <option value="2">Madhesh</option>
                                            <option value="3">Bagmati</option>
                                            <option value="4">Gandaki</option>
                                            <option value="5">Lumbini</option>
                                            <option value="6">Karnali</option>
                                            <option value="7">Sudurpaschim</option>
                                        </select>
                                        <!--====== End - Select Box ======-->
                                    </div>
                                    <!--====== End - STATE/PROVINCE ======-->


                                    <!--====== ZIP/POSTAL ======-->
                                    <div class="u-s-m-b-15">

                                        <label class="gl-label" for="billing-zip">ZIP/POSTAL CODE *</label>

                                        <input class="input-text input-text--primary-style" type="text" name="postal_code" id="billing-zip"
                                            placeholder="Zip/Postal Code" data-bill="">
                                    </div>
                                    <!--====== End - ZIP/POSTAL ======-->

                                    <div class="u-s-m-b-10">

                                        <label class="gl-label" for="order-note">ORDER NOTE</label><textarea
                                            class="text-area text-area--primary-style" name="order_note" id="order-note"></textarea>
                                    </div>
                                    <div>

                                        <button class="btn btn--e-transparent-brand-b-2" type="submit">SAVE</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-6">
                            <h1 class="checkout-f__h1">ORDER SUMMARY</h1>

                            <!--====== Order Summary ======-->
                            <div class="o-summary">
                                <div class="o-summary__section u-s-m-b-30">
                                    <div class="o-summary__item-wrap gl-scroll">
                                        
                                        @php
                                            $subtotal = 0;
                                            $total = 0;
                                        @endphp
                                        @foreach($cartproducts as $product)

                                        <div class="o-card">
                                            <div class="o-card__flex">
                                                <div class="o-card__img-wrap">

                                                    <img class="u-img-fluid"
                                                        src="data:image/jpeg;base64,{{ $product->primary_image }}" alt="">
                                                </div>
                                                <div class="o-card__info-wrap">

                                                    <span class="o-card__name">

                                                        <a href="product-detail.html">Y{{ $product->product_name }}</a></span>

                                                        @php
                                                        if (auth('customer')->check()) {
                                                            // For authenticated users
                                                            $cartItem = $cart->items()->where('product_code', $product->product_code)->first();
                                                            $quantity = $cartItem ? $cartItem->quantity : 0;
                                                            $subtotal = $product->sell_price * $quantity;
                                                        } else {
                                                            // For guest users
                                                            $quantity = $cart[$product->product_code];
                                                            $subtotal = $product->sell_price * $quantity;
                                                            $total += $subtotal;
                                                        }
                                                    @endphp

                                                    <span class="o-card__quantity">Quantity x {{ $quantity }}</span>

                                                    <span class="o-card__price">{{ number_format($subtotal, 2) }}</span>
                                                </div>
                                            </div>

                                            <a class="o-card__del far fa-trash-alt"></a>
                                        </div>
                                        @endforeach
                                        
                                    </div>
                                </div>
                                <div class="o-summary__section u-s-m-b-30">
                                    <div class="o-summary__box">
                                        <h1 class="checkout-f__h1">SHIPPING & BILLING</h1>
                                        <div class="ship-b">

                                            <span class="ship-b__text">Ship to:</span>
                                            <div class="ship-b__box u-s-m-b-10">
                                                <p class="ship-b__p">4247 Ashford Drive Virginia VA-20006 USA (+0)
                                                    900901904</p>
                                            </div>
                                            <div class="ship-b__box">

                                                <span class="ship-b__text">Bill to default billing address</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                
@php
// Initialize variables for authenticated users
if (auth('customer')->check()) {
    $customerId = auth('customer')->id();
    $cart = \App\Models\Cart::where('customer_id', auth('customer')->id())->first();

    if ($cart) {
        $shipping = $cart->shipping_cost;
        $total = $cart->subtotal;
        $amount_before_tax = $shipping + $total;
        $tax = 13/100 * $amount_before_tax;
        $grand_total = $amount_before_tax + $tax;
    } else {
        // Default values if cart does not exist
        $shipping = 0;
        $total = 0;
        $amount_before_tax = $shipping + $total;
        $tax = 13/100 * $amount_before_tax;
        $grand_total = $amount_before_tax + $tax;
    }
} else {
    // For guest users, use session values
    $cart = session()->get('cart', []);
    $total = 0;
    foreach ($cart as $productCode => $quantity) {
        $product = \App\Models\Product::where('product_code', $productCode)->first();
        if ($product) {
            $total += $product->sell_price * $quantity;
        }
    }

    if (isset($shippingCost) && isset($shippingCost->shipping_cost)) {
        $shipping = $shippingCost->shipping_cost;
    } else {
        $shipping = 0;
    }
    
    $amount_before_tax = $shipping + $total;
    $tax = 13/100 * $amount_before_tax;
    $grand_total = $amount_before_tax + $tax;
}
@endphp

                                <div class="o-summary__section u-s-m-b-30">
                                    <div class="o-summary__box">
                                        <table class="o-summary__table">
                                            <tbody>
                                                <tr>
                                                    <td>SHIPPING</td>
                                                    <td>{{ number_format($shipping, 2) }}</td>
                                                </tr>
                                                <tr>
                                                    <td>SUBTOTAL</td>
                                                    <td>{{ number_format($total, 2)}}</td>
                                                </tr>
                                                <tr>
                                                    <td>TAX</td>
                                                    <td>{{ number_format($tax, 2) }}</td>
                                                </tr>
                                                <tr>
                                                    <td>GRAND TOTAL</td>
                                                    <td>{{ number_format($grand_total, 2)}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="o-summary__section u-s-m-b-30">
                                    <div class="o-summary__box">
                                        <h1 class="checkout-f__h1">PAYMENT INFORMATION</h1>
                                        <form class="checkout-f__payment">
                                            <div class="u-s-m-b-10">

                                                <!--====== Radio Box ======-->
                                                <div class="radio-box">

                                                    <input type="radio" id="cash-on-delivery" name="payment">
                                                    <div class="radio-box__state radio-box__state--primary">

                                                        <label class="radio-box__label" for="cash-on-delivery">Cash on
                                                            Delivery</label>
                                                    </div>
                                                </div>
                                                <!--====== End - Radio Box ======-->

                                                <span class="gl-text u-s-m-t-6">Pay Upon Cash on delivery. (This service
                                                    is only available for some countries)</span>
                                            </div>
                                            <div class="u-s-m-b-10">

                                                <!--====== Radio Box ======-->
                                                <div class="radio-box">

                                                    <input type="radio" id="direct-bank-transfer" name="payment">
                                                    <div class="radio-box__state radio-box__state--primary">

                                                        <label class="radio-box__label"
                                                            for="direct-bank-transfer">Direct Bank Transfer</label>
                                                    </div>
                                                </div>
                                                <!--====== End - Radio Box ======-->

                                                <span class="gl-text u-s-m-t-6">Make your payment directly into our bank
                                                    account. Please use your Order ID as the payment reference. Your
                                                    order will not be shipped until the funds have cleared in our
                                                    account.</span>
                                            </div>
                                            <div class="u-s-m-b-10">

                                                <!--====== Radio Box ======-->
                                                <div class="radio-box">

                                                    <input type="radio" id="pay-with-check" name="payment">
                                                    <div class="radio-box__state radio-box__state--primary">

                                                        <label class="radio-box__label" for="pay-with-check">Pay With
                                                            Check</label>
                                                    </div>
                                                </div>
                                                <!--====== End - Radio Box ======-->

                                                <span class="gl-text u-s-m-t-6">Please send a check to Store Name, Store
                                                    Street, Store Town, Store State / County, Store Postcode.</span>
                                            </div>
                                            <div class="u-s-m-b-10">

                                                <!--====== Radio Box ======-->
                                                <div class="radio-box">

                                                    <input type="radio" id="pay-with-card" name="payment">
                                                    <div class="radio-box__state radio-box__state--primary">

                                                        <label class="radio-box__label" for="pay-with-card">Pay With
                                                            Credit / Debit Card</label>
                                                    </div>
                                                </div>
                                                <!--====== End - Radio Box ======-->

                                                <span class="gl-text u-s-m-t-6">International Credit Cards must be
                                                    eligible for use within the United States.</span>
                                            </div>
                                            <div class="u-s-m-b-10">

                                                <!--====== Radio Box ======-->
                                                <div class="radio-box">

                                                    <input type="radio" id="pay-pal" name="payment">
                                                    <div class="radio-box__state radio-box__state--primary">

                                                        <label class="radio-box__label" for="pay-pal">Pay Pal</label>
                                                    </div>
                                                </div>
                                                <!--====== End - Radio Box ======-->

                                                <span class="gl-text u-s-m-t-6">When you click "Place Order" below we'll
                                                    take you to Paypal's site to set up your billing information.</span>
                                            </div>
                                            <div class="u-s-m-b-15">

                                                <!--====== Check Box ======-->
                                                <div class="check-box">

                                                    <input type="checkbox" id="term-and-condition">
                                                    <div class="check-box__state check-box__state--primary">

                                                        <label class="check-box__label" for="term-and-condition">I
                                                            consent to the</label>
                                                    </div>
                                                </div>
                                                <!--====== End - Check Box ======-->

                                                <a class="gl-link">Terms of Service.</a>
                                            </div>
                                            <div>

                                                <button class="btn btn--e-brand-b-2" type="submit">PLACE ORDER</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--====== End - Order Summary ======-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section Content ======-->
    </div>
    <!--====== End - Section 3 ======-->
</div>
<!--====== End - App Content ======-->
@endsection