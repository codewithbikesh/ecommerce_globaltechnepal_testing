@extends('frontend.layouts.app')

@section('contents')

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--====== Section 2 ======-->
<div class="u-s-p-b-60">
    <!--====== Section Content ======-->
    <div class="section__content">
        <div class="dash">
            <div class="container">
                <div class="row addres-add-parentrow">
                    <div class="col-lg-9 col-md-12">
                        <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white">
                            <div class="dash__pad-2">
                                <h1 class="dash__h1 u-s-m-b-14 fa d-block text-center">Add New Address</h1>

                                <!-- Form Start -->
                                <form action="{{ route('frontend.address.create') }}" method="POST">
                                    @csrf

                                    <!-- Row 1 -->
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="full_name">Full Name</label>
                                            <input type="text" name="full_name" value="{{ $hasDefaultAddress ? '' : $customer_user->full_name }}" class="form-control" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="phone">Phone</label>
                                            <input type="text" name="phone" value="{{ $hasDefaultAddress ? '' : $customer_user->phone }}" class="form-control" required>
                                        </div>
                                    </div>

                                    <!-- Row 2 -->
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="province">Province</label>
                                            <select class="select-box select-box--primary-style" id="province" name="province">

                                                <option selected value="" disabled>Choose Province</option>
                                                @foreach($provinces as $id => $province_name)
                                                <option value="{{ $id }}">
                                                    {{ $province_name }}
                                                </option>
                                                @endforeach
                                                
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="address">City</label>
                                            <select class="select-box select-box--primary-style" id="city" name="city">
                                                <option selected value="" disabled>Choose City</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <!-- Row 2 -->
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="province">Landmark (Optional)</label>
                                            <input type="text" name="landmark" class="form-control">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="address">Address</label>
                                            <input type="text" name="address" class="form-control" required>
                                        </div>
                                    </div>
                                    
                                    <!-- Row 3 -->
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="default_shipping">Address Type</label>
                                            <select class="select-box select-box--primary-style" name="address_type">

                                                <option selected value="" disabled>Choose Address Type</option>
                                                <option value="H">Home</option>
                                                <option value="O">Office</option>
                                                
                                            </select>
                                        </div>
                                    </div>

                                    @if (!$hasDefaultAddress)
                                    <!-- Row 3 -->
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="default_shipping">Default Shipping</label>
                                            <input type="hidden" name="default_shipping" value="Y">
                                            <input type="checkbox" name="default_shipping" checked disabled>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="default_billing">Default Billing</label>
                                            <input type="hidden" name="default_billing" value="Y">
                                            <input type="checkbox" name="default_billing" checked disabled>
                                        </div>
                                    </div>
                                    @endif
                                    
                                    <!-- Submit Button -->
                                     <div class="d-flex justify-evenly align-items-center">
                                    <button type="submit" class="btn btn-primary mt-3">Add Address</button>
                                                                    <button class="btn btn-primary moreActionBtnButton" type="button">Account Menu</button>

                                                                    </div>
                                </form>
                                <!-- Form End -->

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

<script>
    $(document).ready(function() {
        $('select[name="province"]').on('change', function() {
            var province_id = $(this).val();
            if (province_id) {
                $.ajax({
                    url: "/getCity/" + province_id, // URL should match the route
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        console.log("Cities data:", data); // Debugging output
                        var $citySelect = $('#city'); // Select city dropdown
                        $citySelect.empty(); // Clear existing options
                        $citySelect.append('<option value="" disabled selected>Choose City</option>'); // Default option

                        // Populate city options
                        $.each(data, function(key, value) {
                            $citySelect.append('<option value="' + key + '">' + value + '</option>');
                        });
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error("AJAX Error: ", textStatus, errorThrown);
                    }
                });
            } else {
                $('#city').empty().append('<option value="" disabled selected>Choose City</option>');
            }
        });

        // Trigger change event on load if there's an initial province selected
        var initialProvince = $('select[name="province"]').val();
        if (initialProvince) {
            $('select[name="province"]').trigger('change');
        }
    });
</script>





@endsection
