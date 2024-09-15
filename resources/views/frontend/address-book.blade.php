@extends('frontend.layouts.app')
@section('contents')


    <!--====== Section 2 ======-->
    <div class="u-s-p-b-60">
        <!--====== Section Content ======-->
        <!-- <div class="section__content">
            <div class="dash">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white">
                                <div class="dash__pad-2"> -->
                <h1 class="dash__h1 u-s-m-b-14 fa text-center d-block">My Addresses</h1>
                
                <div class="table-wrapper">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Address</th>
                                <th>Post Code</th>
                                <th>Phone Number</th>
                                <th>Default</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if($addresses->isNotEmpty())
                                @foreach ($addresses as $address)
                                    <tr>
                                        <td>{{ $address->full_name }}</td>
                                        <td>{{ $address->address }}</td>
                                        <td>{{ $address->city->city }}<br>{{ $address->province->province_name }}</td>
                                        <td>{{ $address->phone }}</td>
                                        <td>
                                            @if ($address->default_shipping === 'Y')
                                                Default shipping address
                                            @endif
                                            @if ($address->default_billing === 'Y')
                                                <br> Default billing address
                                            @endif
                                        </td>
                                        <td>
                                            <form action="{{ route('frontend.address.edit', $address->id) }}" method="POST"
                                                style="display: inline;">
                                                @csrf
                                                @method('POST')
                                                <button type="submit" class="btn btn-link">EDIT</button><br>
                                            </form>

                                            @if ($address->default_shipping !== 'Y')
                                                <a href="{{ route('frontend.address.setDefaultShipping', $address->id) }}">Make default shipping
                                                    address</a><br>
                                            @endif
                                            @if ($address->default_billing !== 'Y')
                                                <a href="{{ route('frontend.address.setDefaultBilling', $address->id) }}">Make default billing
                                                    address</a>
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                            @else
                                <tr>
                                    <td colspan="6">You have not added any address yet.</td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                </div>
                <div class="d-flex justify-content-around">
                <a href="{{ route('frontend.address.add') }}" class="btn btn-primary">Add New Address</a>
                                                            <button class="btn btn-primary moreActionBtnButton">Account Menu</button>

</div>
                                <!-- </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> --> 
    <!--====== End - Section Content ======-->
    <!--====== End - Section 2 ======-->
@endsection