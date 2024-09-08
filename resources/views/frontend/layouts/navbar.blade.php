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
            <a href="/" class="ecomNav-logo"><img src="{{ asset('storage/backend/company_logo/' . $websitedata->company_logo_header) }}"
                    style="width: 150px;" alt="{{ $websitedata->company_name }}"></a>
            <nav class="ecomNav-navbar">
                <a href="/">HOME</a>
                <a href="{{ route('frontend.newarrival') }}">NEW ARRIVAL</a>
                <a href="{{ route('frontend.explore') }}">EXPLORE</a>
                <a href="{{ route('frontend.whatsnew') }}">WHAT'S NEW?</a>
            </nav>

            <div class="ecomNav-icons">
                <div class="fas fa-bars" id="ecomNav-menu-btn"></div>
                <div class="fas fa-shopping-cart" id="ecomNav-cart-btn"></div>
                <div class="fas fa-user" id="ecomNav-login-btn"></div>
                <a href="{{ route('frontend.account') }}">
                    <div class="fas fa-tachometer-alt" id="ecomNav-cart-btn"></div>
                </a>

            </div>

            <div class="ecomNav-shopping-cart">
                
                @foreach($cartproducts as $product)
                <div class="ecomNav-box">
                    <i class="fas fa-trash"></i>
                    <img src="{{ asset('client-side/photos/cart-img-1.png') }}" alt="">
                    <div class="ecomNav-content">
                        <div class="cartImgHeading">
                            <img src="data:image/jpeg;base64,{{ $product->primary_image }}" class="cartImg" alt="">
                            <h3>{{ $product->product_name }}</h3>
                        </div>
                        <div class="cartItemDets">
                            <span class="ecomNav-price">{{ ($product->sell_price * $cart[$product->product_code]) }}</span>
                            <span class="ecomNav-quantity">Qty: {{ $cart[$product->product_code] }}</span>
                        </div>
                    </div>
                </div>
                @endforeach

                <div class="ecomNav-total">total : $19.69/-</div>
                <a href="{{ route('frontend.cart') }}" class="ecomNav-btn">Cart Page</a>
            </div>

            <form action="" class="ecomNav-login-form">
                <h3>Be Our Member</h3>
                <a href="{{ route('frontend.signin') }}" class="ecomNav-btn">Login</a>
                <a href="{{ route('frontend.signup') }}" class="ecomNav-btn">I am New</a>
            </form>
        </div>
        <div class="">
            <div class="input-group">
                <div class="input-group serchParent">
                    <input type="search" class="form-control searchBar rounded"
                        placeholder="Feel Free to Search here..." aria-label="Search" aria-describedby="search-addon" />
                    <button type="button" class="btn btn-outline-primary serchbtn" data-mdb-ripple-init>search</button>
                </div>
            </div>
        </div>

    </header>
    <!-- Header section end -->