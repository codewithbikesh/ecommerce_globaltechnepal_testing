<!DOCTYPE html>
<html lang="en">

@include('frontend.layouts.head')

<body class="config"  id="filterWise">
    @include('frontend.layouts.navbar')
    @include('frontend.layouts.message')
    <div class="content-page">
        <div class="content">
            @yield('content')
        </div> <!-- content -->
    </div>
    </main>
    @include('frontend.layouts.footer')
</body>

</html>