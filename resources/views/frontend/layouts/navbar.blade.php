<div class="preloader is-active">
    <div class="preloader__wrap">
        <img class="preloader__img" src="{{ asset('client-side/images/preloader.png') }}" alt="">
    </div>
</div>

<!--====== Main App ======-->
<div id="app">

    <!-- Header section start -->
    <header class="ecomNav-header">
        <div class="upperOptionsNav">
            <a href="/" class="ecomNav-logo"><img
                    src="{{ asset('storage/backend/company_logo/' . $websitedata->company_logo_header) }}"
              alt="{{ $websitedata->company_name }}"></a>
            <nav class="ecomNav-navbar">
                <a href="/">HOME</a>
                <a href="{{ route('frontend.newarrival') }}">NEW ARRIVAL</a>
                <a href="{{ route('frontend.explore') }}">EXPLORE</a>
                <a href="{{ route('frontend.whatsnew') }}">WHAT'S NEW?</a>
            </nav>

            <div class="ecomNav-icons">
                <div class="fas fa-bars" id="ecomNav-menu-btn"></div>
                <div class="fas fa-shopping-cart" id="ecomNav-cart-btn"> <span class="cartNum">1</span> </div>
                <div class="fas fa-user" id="ecomNav-login-btn"></div>
                
            @auth('customer')
                <a href="{{ route('frontend.account') }}">
                    <div class="fas fa-tachometer-alt" id="ecomNav-cart-btn"></div>
                </a>
            @endauth

            </div>

            <div class="ecomNav-shopping-cart">
                @php
                    $total = 0;
                @endphp

                @foreach($cartproducts as $product)
                                <div class="ecomNav-box">
                                    <form action="{{ route('cart.remove', ['product_code' => $product->product_code]) }}" method="POST" class="remove-form">
                                        @csrf
                                        <button type="submit" class="remove-btn">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                    
                                    <img src="{{ asset('client-side/photos/cart-img-1.png') }}" alt="">
                                    <div class="ecomNav-content">
                                        <div class="cartImgHeading">
                                            <img src="data:image/jpeg;base64,{{ $product->primary_image }}" class="cartImg" alt="">
                                            <h3>{{ $product->product_name }}</h3>
                                        </div>
                                        <div class="cartItemDets">

                                            @php
                                                $subtotal = $product->sell_price * $cart[$product->product_code];
                                                $total += $subtotal;
                                            @endphp
                                            <span class="ecomNav-price">{{ $product->sell_price }}</span>
                                            <span class="ecomNav-quantity">Qty: {{ $cart[$product->product_code] }}</span>
                                        </div>
                                    </div>
                                </div>
                                
                @endforeach

                <div class="ecomNav-total">Total: {{ number_format($total, 2)}}</div>
                <a href="{{ route('frontend.cart') }}" class="ecomNav-btn">Cart Page</a>
            </div>

            
            @auth('customer')
            
            <form action="{{ route('frontend.logout') }}" method="POST" style="display:inline;" class="ecomNav-login-form">
                @csrf
                <a href="{{ route('frontend.account') }}">My Account</a>
                <button type="submit">Logout</button>
            </form>
        
            @else

            <form action="" class="ecomNav-login-form">
                <h3>Be Our Member</h3>
                <a href="{{ route('frontend.signin') }}" class="ecomNav-btn">Signin</a>
                <a href="{{ route('frontend.signup') }}" class="ecomNav-btn">Signup</a>
            </form>

            @endauth
        </div>
        <div class="">
            <div class="input-group">
                <div class="input-group serchParent">
                    <input type="search" class="form-control searchBar rounded"
                        placeholder="Feel Free to Search here..." aria-label="Search" aria-describedby="search-addon" />
                       <span class="input-group-text border-0 searchBarIcin" id="search-addon">
    <i class="fas fa-search"></i>
  </span>
                </div>
            </div>
        </div>

    </header>
    <!-- Header section end -->