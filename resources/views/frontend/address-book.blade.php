@extends('frontend.layouts.app')
@section('contents')


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
                                    <h1 class="dash__h1 u-s-m-b-14">My Addresses</h1>


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
                                                <td>{{ $address->province }}</td>
                                                <td>{{ $address->phone }}</td>
                                                <td>{{ $address->default_shipping }} <br> {{ $address->default_billing }}</td>
                                                <td>EDIT</td>
                                            </tr>
                                            @endforeach
                                            @else
                                            <tr>
                                                <td colspan="6">You have not added any address yet.</td>
                                            </tr>
                                            @endif
                                        </tbody>
                                    </table>

                                    <a href="{{ route('frontend.address.add') }}" class="btn btn-primary">Add New Address</a>


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