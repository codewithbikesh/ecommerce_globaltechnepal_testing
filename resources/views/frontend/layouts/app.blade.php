@extends('frontend.layouts.master')
@section('content')
<!--====== App Content ======-->
<div class="app-content">
    <!--====== Section 2 ======-->
    <div class="u-s-p-b-60">



        <!--====== Section Content ======-->
        <div class="section__content">
            <div class="dash">
                <div class="container">
                    <div class="row" style="justify-content: center;">
                        <div class="dashboardpageLink">

                            <style>
                                /* Ensure horizontal alignment for heading and button */
                                .card-body .d-flex {
                                    display: flex;
                                    align-items: center;
                                    /* Center items vertically */
                                    justify-content: space-between;
                                    /* Space out the heading and button */
                                    width: 100%;
                                }

                                /* Optional: Add margin for better spacing */
                                .card-body h2 {
                                    margin-bottom: 0;
                                    /* Remove default margin for better alignment */
                                }

                                .card-body .btn {
                                    margin-left: auto;
                                    /* Push the button to the right */
                                }

                                /* Add spacing between address sections */
                                .address-section {
                                    margin-bottom: 1rem;
                                    /* Adjust as needed */
                                }
                            </style>
                    



                    <div class="gridParent">
                        @include('frontend.layouts.sidebar')
                                 
                        @yield('contents')
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