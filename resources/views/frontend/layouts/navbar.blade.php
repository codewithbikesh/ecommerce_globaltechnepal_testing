<div class="preloader is-active">
    <div class="preloader__wrap">
        <img class="preloader__img" src="{{ asset('client-side/images/preloader.png') }}" alt="">
    </div>
</div>

<!--====== Main App ======-->
<div id="app">

    <!-- Header section start -->
    <header class="ecomNav-header" >
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

            <div class="iconParent">
                <div class="ecomNav-icons">
                <div class="fas fa-bars" id="ecomNav-menu-btn"></div>
                <div class="ri-heart-3-fill fas" id="" title="WishList"><span class="cartNum wishList">3</span></div>
                <div class="fas fa-shopping-cart" id="ecomNav-cart-btn" title="Cart"> <span class="cartNum">{{ $cartItemCount }}</span> </div>
                       
                <!-- if user is logged in then show user's dashboard otherwise show loging icon -->
                @auth('customer')
                    <div>
                        <a href="{{ route('frontend.account') }}" style="display:flex;">         <!-- show dashboard if logged in  -->
                            <div class="fas fa-tachometer-alt" id="ecomNav-cart-btn"></div>
                        </a>
                        <a href="javascript:void(0)" class="loggedInUserIcon">      
                            <div class="navAccountName moreOptionUser fas fa-user morebtn" ></div>
                        </a>
                        </div>
                 @else          
                        <a href="{{ route('frontend.account') }}">         <!-- show login icon if not logged in  -->
                    <a href="javascript:void(0)">       
                        <div class="fas fa-user morebtn"  title="Be Member"></div>
                    </a>
                @endauth


</div>
    @auth('customer')        <!-- Show user's name if logged in  -->
        <a href="javascript:void(0)" class="userNameWelcome">
           <p class="navAccountName morebtn"> <i class="ri-flower-fill"></i> Hi, {{ explode(' ', Auth::guard('customer')->user()->full_name)[0] }}<i class="ri-arrow-down-s-line"></i></p> 
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
    if (auth('customer')->check()) {
        // For authenticated users
        $cartItem = $cart->items()->where('product_code', $product->product_code)->first();
        $quantity = $cartItem ? $cartItem->quantity : 0;
        $subtotal = $product->sell_price * $quantity;
        $total += $subtotal;
    } else {
        // For guest users
        $quantity = $cart[$product->product_code];
        $subtotal = $product->sell_price * $quantity;
        $total += $subtotal;
    }
                                        @endphp

                                            <span class="ecomNav-price">{{ $product->sell_price }}</span>
                                            <span class="ecomNav-quantity">Qty: {{ $quantity }}</span>
                                        </div>
                                    </div>
                                </div>
                                
                @endforeach

                <div class="ecomNav-total">Total: {{ number_format($total, 2)}}</div>
                <a href="{{ route('frontend.checkout') }}" class="ecomNav-btn">Checkout</a>
            </div>

            
            @auth('customer')

                <form action="" style="display:inline;" class="ecomNav-login-form ecomNav-profile-options">

                  <a href="{{ route('frontend.account') }}"><i class="ri-dashboard-line"></i>Manage Account</a>


                                <a href="{{ route('frontend.account') }}"><i class="ri-list-ordered"></i>My Orders</a>


                                <a href="{{ route('frontend.account') }}"><i class="ri-heart-fill"></i> My Wishlist</a>



                                <a href="{{ route('frontend.account') }}"><i class="ri-discuss-fill"></i>My Reviews</a>



                                <a href="{{ route('frontend.account') }}"><i class="ri-arrow-go-back-fill"></i>My Return and Cancellation</a>         

                                <a href="{{ route('frontend.logout')}}" type="submit" class="">
                                    <i class="ri-logout-box-line"></i>Logout</a>

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
            <form action="{{ route('frontend.shop-list-full') }}" method="get">
            <div class="input-group">
                <div class="input-group serchParent">
                    <input type="search" class="form-control searchBar rounded"
                        placeholder="Feel Free to Search here..." aria-label="Search" name="keyword" value="{{ Request::get('keyword') }}" aria-describedby="search-addon" />
                       <button type="submit" class="input-group-text border-0 searchBarIcin" id="search-addon">
    <i class="fas fa-search"></i>
  </button>
                </div>
            </div>
        </form>
        </div>

    </header>
    <!-- Header section end -->