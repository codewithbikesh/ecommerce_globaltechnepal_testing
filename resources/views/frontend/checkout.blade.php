@extends('frontend.layouts.master')
@section('content')


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                    <div class="row checkoutROw width100vw">

                        <!-- For Non-Authenticated Users -->
                        <div class="col-lg-10">
                            <h1 class="checkout-f__h1 text-center fa d-block">ORDER SUMMARY</h1>

                            <!--====== Order Summary ======-->
                            <div class="o-summary checkoutSubContainerParent">
                                    <div class="shippingAndCartItemParent ">
                                                             <!-- SHIPPING ADDRESS  -->

                                                                    <div class="o-summary__section u-s-m-b-30">
                                                                        <div class="o-summary__box">
                                                                            <h1 class="checkout-f__h1">SHIPPING ADDRESS</h1>
                                                                            <div class="ship-b">
                                                                                <span class="ship-b__text">Ship to:</span>
                                                                                <div class="ship-b__box u-s-m-b-10">
                                                                                    @auth('customer')
                                                                                        @if($default_shipping_addresses)
                                                                                            <p><span class="ri-map-pin-line material-symbols-outlined"></span>
                                                                                                {{ $default_shipping_addresses->address }}, {{ $default_shipping_addresses->city->city }},
                                                                                                {{ $default_shipping_addresses->province->province_name }}</p>
                                                                                        @else
                                                                                            <p class="ship-b__p">No Shipping Address available.</p>
                                                                                        @endif
                                                                                    @else
                                                                                                                                                                    @if($deliveryInformation)
                                                                                                                                                                                                                                                    @php
        // Extract variables for easier readability
        $address = $deliveryInformation['address'] ?? '';
        $cityName = $deliveryInformation['city_name'] ?? '';
        $provinceName = $deliveryInformation['province_name'] ?? '';

        // Check if any of the values are missing
        $hasMissingValues = empty($address) || empty($cityName) || empty($provinceName);
                                                                                                                                                                                                                                                    @endphp

                                                                                                                                                                                                                                                    @if($hasMissingValues)
                                                                                                                                                                                                                                                        <p class="ship-b__p">Incomplete delivery information. Please provide all required details.</p>
                                                                                                                                                                                                                                                    @else
                                                                                                                                                                                                                                                        <p class="ship-b__p">
                                                                                                                                                                                                                                                            {{ $address }},
                                                                                                                                                                                                                                                            {{ $cityName->city }},
                                                                                                                                                                                                                                                            {{ $provinceName->province_name }}
                                                                                                                                                                                                                                                        </p>
                                                                                                                                                                                                                                                    @endif
                                                                                                                                                                    @else
                                                                                                                                                                        <p class="ship-b__p">No delivery information available.</p>
                                                                                                                                                                    @endif

                                                                                    @endauth
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- CART ITEMS  -->
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
                                                                                                                                                                    <img class="u-img-fluid" src="data:image/jpeg;base64,{{ $product->primary_image }}" alt="">
                                                                                                                                                                </div>
                                                                                                                                                                <div class="o-card__info-wrap">
                                                                                                                                                                    <span class="o-card__name">
                                                                                                                                                                        <a href="product-detail.html">{{ $product->product_name }}</a>
                                                                                                                                                                    </span>
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

                                                                                                                                                            <form action="{{ route('cart.remove', ['product_code' => $product->product_code]) }}" method="POST"
                                                                                                                                                                class="remove-form">
                                                                                                                                                                @csrf
                                                                                                                                                                <button type="submit" class="remove-btn">
                                                                                                                                                                    <a class="o-card__del far fa-trash-alt"></a>
                                                                                                                                                                </button>
                                                                                                                                                            </form>
                                                                                                                                                        </div>
                                                                            @endforeach
                                                                    
                                                                        </div>
                                                                    </div>

                                                                                        
                        @auth('customer')
                        @else
                        <!-- For Authenticated Users -->
                        <div class="col-lg-12">
                            <h1 class="checkout-f__h1">DELIVERY INFORMATION</h1>
                            <form class="checkout-f__delivery" method="POST" action="{{ route('frontend.delivery.information') }}">
                                @csrf
                                <div class="u-s-m-b-30">

                                    <!--====== First Name, Last Name ======-->
                                    <div class="gl-inline">
                                        <div class="u-s-m-b-15">
                                            <label class="gl-label" for="billing-fname">YOUR FULL NAME *</label>
                                            <input class="input-text input-text--primary-style" name="full_name" value="{{ $deliveryInformation['full_name'] ?? '' }}" type="text" id="billing-fname" required>
                                        </div>
                                    </div>
                                    <!--====== End - First Name, Last Name ======-->

                                    <!--====== E-MAIL ======-->
                                    <div class="u-s-m-b-15">
                                        <label class="gl-label" for="billing-email">E-MAIL *</label>
                                        <input class="input-text input-text--primary-style" name="invoice_email" value="{{ $deliveryInformation['invoice_email'] ?? '' }}" type="text" id="billing-email" required>
                                    </div>
                                    <!--====== End - E-MAIL ======-->

                                    <!--====== PHONE ======-->
                                    <div class="u-s-m-b-15">
                                        <label class="gl-label" for="billing-phone">PHONE *</label>
                                        <input class="input-text input-text--primary-style" name="phone" value="{{ $deliveryInformation['phone'] ?? '' }}" type="text" id="billing-phone" required>
                                    </div>
                                    <!--====== End - PHONE ======-->

                                    <!--====== STATE/PROVINCE ======-->
                                    <div class="u-s-m-b-15">
                                        <label class="gl-label" for="billing-state">STATE/PROVINCE *</label>
                                        <select class="select-box select-box--primary-style" name="province" id="billing-state" required>
                                            <option selected value="" disabled>Choose Province</option>
                                            @foreach($provinces as $id => $province_name)
                                                <option value="{{ $id }}" {{ $selectedProvince == $id ? 'selected' : '' }}>
                                                    {{ $province_name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <!--====== End - STATE/PROVINCE ======-->

                                    <!--====== Town / City ======-->
                                    <div class="u-s-m-b-15">
                                        <label class="gl-label" for="billing-town-city">TOWN/CITY *</label>
                                        <select class="select-box select-box--primary-style" id="city" name="city">
                                            <option selected value="" disabled>Choose City</option>
                                        </select>
                                    </div>
                                    <!--====== End - Town / City ======-->

                                    <div class="u-s-m-b-15">
                                        <label class="gl-label" for="billing-street">LANDMARK (OPTIONAL) *</label>
                                        <input class="input-text input-text--primary-style" type="text" id="landmark" name="landmark" value="{{ $deliveryInformation['landmark'] ?? '' }}" placeholder="Famous Place near you">
                                    </div>

                                    <!--====== Street Address ======-->
                                    <div class="u-s-m-b-15">
                                        <label class="gl-label" for="billing-street">STREET ADDRESS/ LOCAL AREA *</label>
                                        <input class="input-text input-text--primary-style" type="text" id="billing-street" name="street_address" value="{{ $deliveryInformation['address'] ?? '' }}" placeholder="House name and street name" required>
                                    </div>
                                    <!--====== End - Street Address ======-->

                                    {{-- <div class="u-s-m-b-10">
                                        <label class="gl-label" for="order-note">ORDER NOTE</label>
                                        <textarea class="text-area text-area--primary-style" name="order_note" id="order-note"></textarea>
                                    </div> --}}

                                    <div>
                                        <button class="btn btn--e-transparent-brand-b-2" type="submit">SAVE</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        @endauth
                                               
                                    </div>

                                    <div class="invoicingandOther">
                                        <!-- invoice and billing  -->
                                <div class="o-summary__section u-s-m-b-30">
                                    <div class="o-summary__box">
                                        <h1 class="checkout-f__h1">INVOICE & BILLING</h1>
                                        
                                        <div class="ship-b">
                                            <span class="ship-b__text">Invoice Email</span>
                                            <div class="ship-b__box">
                                                @auth('customer')
                                                        <p><span class="ri-mail-line material-symbols-outlined"></span> {{ $customerEmail }}</p>
                                                @else             
                                                    @if($deliveryInformation['invoice_email'])
                                                        <span class="ship-b__p">{{ $deliveryInformation['invoice_email'] ?? '' }}</span>
                                                    @else
                                                        <p class="ship-b__p">No invoice email available.</d>
                                                    @endif
                                                @endauth
                                            </div>
                                        </div>

                                        <div class="ship-b">
                                            <span class="ship-b__text">Billing Address</span>
                                            <div class="ship-b__box">
                                                @auth('customer')
                                                    @if($default_billing_addresses)
                                                        <p><span class="ri-map-pin-line material-symbols-outlined"></span> {{ $default_billing_addresses->address }}, {{ $default_billing_addresses->city->city }}, {{ $default_billing_addresses->province->province_name }}</p>
                                                    @else
                                                        <p class="ship-b__p">No Billing Address available.</p>
                                                    @endif
                                                @else             
                                                    @if($deliveryInformation)
                                                        <span class="ship-b__p">Bill to shipping address</span>
                                                    @else
                                                        <p class="ship-b__p">No billing address available.</d>
                                                    @endif
                                                @endauth
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
        $shipping = $cart->shipping_cost_total;
        $total = $cart->subtotal;
    } else {
        $shipping = 0;
        $total = 0;
    }
    $amount_before_tax = $shipping + $total;
    $tax = 0;
    $grand_total = $amount_before_tax + $tax;

} else {
    // For guest users, use session values
    $cart = session()->get('cart', []);
    $itemCount = count($cart); // Count the number of unique items in the cart
    $total = 0;
    foreach ($cart as $productCode => $quantity) {
        $product = \App\Models\Product::where('product_code', $productCode)->first();
        if ($product) {
            $total += $product->sell_price * $quantity;
        }
    }

    $shipping = isset($shippingCost) && isset($shippingCost->shipping_cost) ? $shippingCost->shipping_cost : 0;
    $shipping = $shipping * $itemCount;
    $amount_before_tax = $shipping + $total;
    //$tax = 13 / 100 * $amount_before_tax;
    $tax = 0;
    $grand_total = $amount_before_tax + $tax;
}
                                @endphp
<!-- shipping -->
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
                                                    <td>TAX (Incl)</td>
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
                                        <form class="checkout-f__payment" method="POST" action="{{ route('frontend.place.order') }}">
                                            @csrf
                                            <div class="u-s-m-b-10">
                                                <!--====== Radio Box ======-->
                                                <div class="radio-box">
                                                    <input type="radio" id="cash-on-delivery" value="C" name="payment_method">
                                                    <div class="radio-box__state radio-box__state--primary">
                                                        <label class="radio-box__label" for="cash-on-delivery">Cash on Delivery</label>
                                                    </div>
                                                </div>
                                                <!--====== End - Radio Box ======-->
                                                <span class="gl-text u-s-m-t-6">Pay Upon Cash on delivery.</span>
                                            </div>
                                            <div>
                                                <button class="btn btn--e-brand-b-2" type="submit" {{ $isCartEmpty ? 'disabled' : '' }}>PLACE ORDER</button>
                                            </div>
                                        </form>
                                    </div>
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


<script>
    $(document).ready(function() {
        var selectedCity = @json($selectedCity); // Get the selected city from Blade

        // Function to update city options based on province
        $('select[name="province"]').on('change', function() {
            var province_id = $(this).val();
            if (province_id) {
                $.ajax({
                    url: "/getCities/" + province_id, // Use relative URL
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        console.log("Cities data:", data);
                        var $citySelect = $('select[name="city"]');
                        $citySelect.empty();

                        // Populate city options
                        $.each(data, function(key, value) {
                            var isSelected = (key === selectedCity) ? ' selected' : ''; // Check if this city should be selected
                            $citySelect.append('<option value="' + key + '"' + isSelected + '>' + value + '</option>');
                        });
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log("AJAX Error: ", textStatus, errorThrown);
                    }
                });
            } else {
                $('select[name="city"]').empty();
            }
        });

        // Trigger change event on load to populate cities based on initially selected province
        var initialProvince = $('select[name="province"]').val();
        if (initialProvince) {
            $('select[name="province"]').trigger('change');
        }
    });
</script>

@endsection
