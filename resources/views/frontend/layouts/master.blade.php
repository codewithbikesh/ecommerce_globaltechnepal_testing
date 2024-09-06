<!DOCTYPE html>
<html lang="en">

@include('frontend.layouts.head')

<body class="config">


    @include('frontend.layouts.navbar')
    <div class="content-page">

        @if(session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        @if(session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif

        <div class="content">
            @yield('content')
        </div> <!-- content -->

    </div>
    </main>
    @include('frontend.layouts.footer')
</body>

</html>