<div class="preloader is-active">
    <div class="preloader__wrap">
        <img class="preloader__img" src="{{ asset('client-side/images/preloader.png') }}" alt=""></div>
</div>

<!--====== Main App ======-->
<div id="app">

<!-- Header section start -->
<header class="ecomNav-header">
<div class="upperOptionsNav">
<a href="/" class="ecomNav-logo"><img src="{{ asset('client-side/images/logo/logo-1.png') }}" style="width: 150px;" alt="" ></a>
<nav class="ecomNav-navbar">
    <a href="/">HOME</a>  
    <a href="./newarrival.html">NEW ARRIVAL</a>  
    <a href="./explore.html">EXPLORE</a>  
    <a href="./whatsnew.html">WHAT'S NEW?</a>  
</nav>

<div class="ecomNav-icons">
    <div class="fas fa-bars" id="ecomNav-menu-btn"></div>
    <div class="fas fa-shopping-cart" id="ecomNav-cart-btn"></div>
    <div class="fas fa-user" id="ecomNav-login-btn"></div>
<a href="./dashboard.html">    <div class="fas fa-tachometer-alt" id="ecomNav-cart-btn"></div></a>

</div>

<div class="ecomNav-shopping-cart">
    <div class="ecomNav-box">
        <i class="fas fa-trash"></i>
        <img src="photos/cart-img-1.png" alt="">
        <div class="ecomNav-content">
<div class="cartImgHeading">
 <img src="{{ asset('client-side/images/brand/b1.png') }}" class="cartImg" alt="">
                 <h3>watermelon</h3>
</div>
<div class="cartItemDets">
            <span class="ecomNav-price">$4.99/-</span>
            <span class="ecomNav-quantity">qty : 1</span>
            </div>
        </div>
    </div>

     <div class="ecomNav-box">
        <i class="fas fa-trash"></i>
        <img src="photos/cart-img-1.png" alt="">
        <div class="ecomNav-content">
<div class="cartImgHeading">
 <img src="{{ asset('client-side/images/brand/b1.png') }}" class="cartImg" alt="">
                 <h3>watermelon</h3>
                 
</div>
<div class="cartItemDets">
            <span class="ecomNav-price">$4.99/-</span>
            <span class="ecomNav-quantity">qty : 1</span>
            </div>
        </div>
    </div>
    <div class="ecomNav-box">
        <i class="fas fa-trash"></i>
        <img src="photos/cart-img-1.png" alt="">
        <div class="ecomNav-content">
<div class="cartImgHeading">
 <img src="{{ asset('client-side/images/brand/b1.png') }}" class="cartImg" alt="">
                 <h3>watermelon</h3>
</div>
<div class="cartItemDets">
            <span class="ecomNav-price">$4.99/-</span>
            <span class="ecomNav-quantity">qty : 1</span>
            </div>
        </div>
    </div>
    <div class="ecomNav-total">total : $19.69/-</div>
    <a href="./checkout.html" class="ecomNav-btn">checkout</a>
</div>

<form action="" class="ecomNav-login-form">
    <h3>Be Our Member</h3>
  <a href="./signin.html" class="ecomNav-btn"> <button>Login</button></a> 
  <a href="./signup.html" class="ecomNav-btn"> <button>I am New</button></a> 
</form>
   </div>   
<div class="">
<div class="input-group">
<div class="input-group serchParent">
<input type="search" class="form-control searchBar rounded" placeholder="Feel Free to Search here..." aria-label="Search" aria-describedby="search-addon" />
<button type="button" class="btn btn-outline-primary serchbtn" data-mdb-ripple-init>search</button>
</div>
</div>
</div>

</header>
<!-- Header section end -->