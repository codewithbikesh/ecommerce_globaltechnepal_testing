<!--====== Main Footer ======-->
<footer>
    <div class="outer-footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="outer-footer__content u-s-m-b-40">

                        <span class="outer-footer__content-title">Contact Us</span>
                        <div class="outer-footer__text-wrap"><i class="fas fa-home"></i>

                            <span>{{ $websitedata->address }}</span>
                        </div>
                        <div class="outer-footer__text-wrap"><i class="fas fa-phone-volume"></i>

                            <span>{{ $websitedata->primary_phone }}</span>
                        </div>
                        <div class="outer-footer__text-wrap"><i class="far fa-envelope"></i>

                            <span>{{ $websitedata->primary_email }}</span>
                        </div>
                        <div class="outer-footer__social">
                            <ul>
                                <li>

                                    <a class="s-fb--color-hover" href="#"><i class="fab fa-facebook-f"></i></a>
                                </li>
                                <li>

                                    <a class="s-tw--color-hover" href="#"><i class="fab fa-twitter"></i></a>
                                </li>
                                <li>

                                    <a class="s-youtube--color-hover" href="#"><i class="fab fa-youtube"></i></a>
                                </li>
                                <li>

                                    <a class="s-insta--color-hover" href="#"><i class="fab fa-instagram"></i></a>
                                </li>
                                <li>

                                    <a class="s-gplus--color-hover" href="#"><i class="fab fa-google-plus-g"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="outer-footer__content u-s-m-b-40">

                                <span class="outer-footer__content-title">Information</span>
                                <div class="outer-footer__list-wrap">
                                    <ul>
                                        <li>
                                            <a href="{{ route('frontend.cart') }}">Cart</a>
                                        </li>
                                        <li>

                                            <a href="{{ route('frontend.account') }}">Account</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="outer-footer__content u-s-m-b-40">
                                <div class="outer-footer__list-wrap">

                                    <span class="outer-footer__content-title">Our Company</span>
                                    <ul>
                                        <li>
                                            <a href="{{ route('frontend.about') }}">About us</a>
                                        </li>
                                        <li>

                                            <a href="{{ route('frontend.contact') }}">Contact Us</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="outer-footer__content">

                        <span class="outer-footer__content-title">Join our Newsletter</span>
                        <form class="newsletter" method="POST" action="{{ route('frontend.newsletter.store') }}">
                            @csrf
                            <div class="u-s-m-b-15">
                                <div class="radio-box newsletter__radio">

                                    <input type="radio" value="M" id="male" name="gender">
                                    <div class="radio-box__state radio-box__state--primary">
                                        <label class="radio-box__label" for="male">Male</label>
                                    </div>
                                </div>
                                <div class="radio-box newsletter__radio">

                                    <input type="radio" value="F" id="female" name="gender"> 
                                    <div class="radio-box__state radio-box__state--primary">
                                        <label class="radio-box__label" for="female">Female</label>
                                    </div>
                                </div>
                            </div>
                            <div class="newsletter__group">

                                <label for="newsletter"></label>

                                <input class="input-text input-text--only-white" type="text" id="newsletter"
                                    placeholder="Enter your Email" name="email">

                                <button class="btn btn--e-brand newsletter__btn" type="submit">SUBSCRIBE</button>
                            </div>

                            <span class="newsletter__text">Subscribe to the mailing list to receive updates on
                                promotions, new arrivals, discount and coupons.</span>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="lower-footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="lower-footer__content">
                        <div class="lower-footer__copyright">

                            <span>Copyright &copy; {{ now()->year }}</span>

                            <a href="index.html">{{ $websitedata->company_name }}</a>

                            <span>All Right Reserved</span>
                        </div>
                        <div class="lower-footer__payment">
                            <ul>
                                <li><i class="fab fa-cc-stripe"></i></li>
                                <li><i class="fab fa-cc-paypal"></i></li>
                                <li><i class="fab fa-cc-mastercard"></i></li>
                                <li><i class="fab fa-cc-visa"></i></li>
                                <li><i class="fab fa-cc-discover"></i></li>
                                <li><i class="fab fa-cc-amex"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<!--====== Modal Section ======-->


<!--====== Add to Cart Modal ======-->
<div class="modal fade" id="add-to-cart">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-radius modal-shadow">

            <button class="btn dismiss-button fas fa-times" type="button" data-dismiss="modal"></button>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="success u-s-m-b-30">
                            <div class="success__text-wrap"><i class="fas fa-check"></i>

                                <span>Item is added successfully!</span>
                            </div>
                            <div class="success__img-wrap">

                                <img class="u-img-fluid" src="images/product/electronic/product1.jpg" alt="">
                            </div>
                            <div class="success__info-wrap">

                                <span class="success__name">Beats Bomb Wireless Headphone</span>

                                <span class="success__quantity">Quantity: 1</span>

                                <span class="success__price">$170.00</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="s-option">

                            <span class="s-option__text">1 item (s) in your cart</span>
                            <div class="s-option__link-box">

                                <a class="s-option__link btn--e-white-brand-shadow" data-dismiss="modal">CONTINUE
                                    SHOPPING</a>

                                <a class="s-option__link btn--e-white-brand-shadow" href="cart.html">VIEW CART</a>

                                <a class="s-option__link btn--e-brand-shadow" href="checkout.html">PROCEED TO
                                    CHECKOUT</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--====== End - Add to Cart Modal ======-->


<!--====== Newsletter Subscribe Modal ======-->
<div class="modal fade new-l" id="newsletter-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal--shadow">

            <button class="btn new-l__dismiss fas fa-times" type="button" data-dismiss="modal">X</button>
            <div class="modal-body popup">
                <div class="row u-s-m-x-0">
                    <div class="col-lg-6 new-l__col-1 u-s-p-x-0">

                        <a class="new-l__img-wrap u-d-block" href="shop-side-version-2.html">

                            <img class="u-img-fluid u-d-block" src="images/newsletter/newsletter.jpg" alt=""></a>
                    </div>
                    <div class="col-lg-6 new-l__col-2">
                        <div class="new-l__section u-s-m-t-30">
                            <div class="u-s-m-b-8 new-l--center">
                                <h3 class="new-l__h3">Explore More Product</h3>
                            </div>
                            <div class="u-s-m-b-30 new-l--center">
                                <p class="new-l__p1">Be Our Member by Signing In righ now. </p>
                            </div>
                            <form class="new-l__form">
                                <div class="u-s-m-b-15">
                                    <div class="u-s-m-b-15">
                                        <a href="signin.html">
                                            <button class="btn btn--e-brand-b-2" type="button">Sign In!</button>
                                        </a>
                                    </div>
                            </form>
                            <div class="u-s-m-b-15 new-l--center">
                                <p class="new-l__p2">By Signing up, you agree to receive Reshop offers,<br />promotions
                                    and other commercial messages. You may unsubscribe at any time.</p>
                            </div>
                            <div class="u-s-m-b-15 new-l--center">

                                <a class="new-l__link" data-dismiss="modal">No Thanks</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--====== End - Newsletter Subscribe Modal ======-->
<!--====== End - Modal Section ======-->
</div>
<!--====== End - Main App ======-->
{{--
<script src="https://cdn.jsdelivr.net/npm/locomotive-scroll@beta/bundled/locomotive-scroll.min.js"></script>
<script>
    (function () {
        const locomotiveScroll = new LocomotiveScroll();
    })();
</script> --}}

<script src="{{ asset('client-side/js/navbar.js') }}"></script>

<!--====== Vendor Js ======-->
<script src="{{ asset('client-side/js/vendor.js') }}"></script>

<!--====== jQuery Shopnav plugin ======-->
<script src="{{ asset('client-side/js/jquery.shopnav.js') }}"></script>
<script src="{{ asset('client-side/js/crousal.js') }}"></script>
<!--====== App ======-->
<script src="{{ asset('client-side/js/app.js') }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    function toggleDropdown(id) {
        const dropdown = document.getElementById(id);
        const isVisible = dropdown.style.display === 'block';

        // Hide all dropdowns
        const dropdowns = document.querySelectorAll('.filter-dropdown');
        dropdowns.forEach(dd => dd.style.display = 'none');

        // Toggle the clicked dropdown
        dropdown.style.display = isVisible ? 'none' : 'block';
    }
</script>
    @yield('costomJs')
</body>

</html>