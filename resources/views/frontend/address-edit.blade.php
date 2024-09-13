@extends('frontend.layouts.app')

@section('contents')

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--====== Section 2 ======-->
<div class="u-s-p-b-60">
    <!--====== Section Content ======-->
    <div class="section__content">
        <div class="dash">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-md-12">
                        <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white">
                            <div class="dash__pad-2">
                                <h1 class="dash__h1 u-s-m-b-14">Edit Address</h1>

                                <!-- Form Start -->
                                <form action="{{ route('frontend.address.update', $address->id) }}" method="POST">
                                    @csrf

                                    <!-- Row 1 -->
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="full_name">Full Name</label>
                                            <input type="text" name="full_name" value="{{ old('full_name', $address->full_name) }}" class="form-control" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="phone">Phone</label>
                                            <input type="text" name="phone" value="{{ old('phone', $address->phone) }}" class="form-control" required>
                                        </div>
                                    </div>

                                    <!-- Row 2 -->
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="province">Province</label>
                                            <select class="select-box select-box--primary-style" id="province" name="province">

                                                <option selected value="" disabled>Choose Province</option>
                                                @foreach($provinces as $id => $province_name)
                                                    <option value="{{ $id }}" {{ $id == $address->province_id ? 'selected' : '' }}>
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
                                            <input type="text" name="landmark" value="{{ old('address', $address->landmark) }}" class="form-control">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="address">Address</label>
                                            <input type="text" name="address" value="{{ old('address', $address->address) }}" class="form-control" required>
                                        </div>
                                    </div>
                                    
                                    <!-- Row 3 -->
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="default_shipping">Address Type</label>
                                            <select class="select-box select-box--primary-style" name="address_type">

                                                <option selected value="" disabled>Choose Address Type</option>
                                                <option value="H" {{ $address->address_type === 'H' ? 'selected' : '' }}>Home</option>
                                                <option value="O" {{ $address->address_type === 'O' ? 'selected' : '' }}>Office</option>
                                                
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <!-- Submit Button -->
                                    <button type="submit" class="btn btn-primary mt-3">Update Address</button>
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
        var selectedCity = @json($selectedCity); // Get the selected city from Blade

        // Function to update city options based on province
        $('select[name="province"]').on('change', function() {
            var province_id = $(this).val();
            if (province_id) {
                $.ajax({
                    url: "/getCity/" + province_id, // Use relative URL
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
