@extends('frontend.layouts.app')
@section('contents')


    <!--====== Section 2 ======-->
    <div class="u-s-p-b-60 editOptionParetn">
        <!--====== Section Content ======-->
        <div class="section__content">
            <div class="dash">
                <div class="container">
                    <div class="row rowParentProfileEdit">
                        <div class="col-lg-9 col-md-12">
                            <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white">
                                <div class="dash__pad-2">
                                    <h1 class="dash__h1 u-s-m-b-14 centerBlockText fa">Edit Profile</h1>

                                    <form class="l-f-o__form" method="POST" action="{{ route('frontend.profile.update') }}">
                                        @csrf
                                        <div class="formParentExceptBtn d-flex justify-content-center flex-wrap">



                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="reg-fname">FULL NAME *</label>
                                            <input class="input-text input-text--primary-style" value="{{ $customer_user->full_name }}" name="full_name" type="text"
                                                 placeholder="Full Name" required>
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="reg-lname">PHONE *</label>
                                            <input class="input-text input-text--primary-style" value="{{ $customer_user->phone }}" name="phone" type="text"
                                                 placeholder="Phone" required>
                                        </div>

                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="reg-email">EMAIL *</label>
                                            <input class="input-text input-text--primary-style" value="{{ $customer_user->email }}" name="email" type="text"
                                                 placeholder="Enter Email" required>
                                        </div>
                                        
                                        <div class="u-s-m-b-15">
                                            <input type="hidden" value="{{ $customer_user->id }}" name="customer_id">

                                        </div>
                                        </div>

                                        <div class="btnUpdateProfile d-flex justify-content-around">
                                                                                        <button class="btn btn--e-transparent-brand-b-2" type="submit">UPDATE PROFILE</button>

                                                            <button class="btn btn-primary moreActionBtnButton" type="button">Account Menu</button>

                                        </div>

                                    </form>


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
@endsection