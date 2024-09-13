@extends('frontend.layouts.master')
@section('content')
<!--====== App Content ======-->
<div class="app-content">

    <!--====== Section 1 ======-->
    <div class="u-s-p-y-60">

        <!--====== Section 2 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary">CREATE AN ACCOUNT</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Intro ======-->


            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row row--center">
                        <div class="col-lg-6 col-md-8 u-s-m-b-30">
                            <div class="l-f-o">
                                <div class="l-f-o__pad-box">
                                    <h1 class="gl-h1">PERSONAL INFORMATION</h1>
                                    <form class="l-f-o__form" method="POST" action="{{ route('frontend.customer.signup') }}">
                                        @csrf

                                        <div class="u-s-m-b-30">

                                            <label class="gl-label" for="reg-fname">FULL NAME *</label>
                                            <input class="input-text input-text--primary-style" name="full_name" type="text"
                                                 placeholder="Full Name" required>
                                        </div>
                                        <div class="u-s-m-b-30">

                                            <label class="gl-label" for="reg-lname">PHONE *</label>
                                            <input class="input-text input-text--primary-style" name="phone" type="text"
                                                 placeholder="Phone" required>
                                        </div>

                                        <div class="u-s-m-b-30">

                                            <label class="gl-label" for="reg-email">EMAIL *</label>
                                            <input class="input-text input-text--primary-style" name="email" type="text"
                                                 placeholder="Enter Email" required>
                                        </div>
                                        <div class="u-s-m-b-30">

                                            <label class="gl-label" for="reg-password">PASSWORD *</label>
                                            <input class="input-text input-text--primary-style" name="password" type="password"
                                                 placeholder="Enter Password" required>
                                        </div>
                                        
                                        <div class="u-s-m-b-15">

                                            <button class="btn btn--e-transparent-brand-b-2"
                                                type="submit">CREATE ACCOUNT</button>
                                                <p>By clicking "CREATE ACCOUNT" I agree to <a href="">Terms of Use</a> and <a href="">Privacy Policy</a></p>
                                        </div>

                                    </form>
                                                                    <strong class="gl-text u-s-m-b-30 signwithgoogleText">OR</strong>

                                    <div class="gl-s-api">
                                        <div class="u-s-m-b-15">

                                            <button class="gl-s-api__btn gl-s-api__btn--fb" type="button"><i
                                                    class="fab fa-facebook-f"></i>

                                                <span>Sign up with Facebook</span></button>
                                        </div>
                                        <div class="u-s-m-b-15">

                                            <button class="gl-s-api__btn gl-s-api__btn--gplus" type="button"><i
                                                    class="fab fa-google"></i>

                                                <span>Sign up with Google</span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 2 ======-->
    </div>
    <!--====== End - App Content ======-->

    @endsection