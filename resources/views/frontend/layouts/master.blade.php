<!DOCTYPE html>
<html lang="en">

@include('frontend.layouts.head')

<body class="config">


    @include('frontend.layouts.navbar')
    <div class="content-page">

        <div class="content">
            @yield('content')
        </div> <!-- content -->

    </div>
    </main>
    @include('frontend.layouts.footer')
</body>

</html>