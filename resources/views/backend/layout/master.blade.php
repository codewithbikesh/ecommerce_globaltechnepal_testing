<!DOCTYPE html>
<html lang="en">

@include('backend.inc.head')
<body>
    
<main id="main" class="main">

@include('backend.inc.menu')
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
@include('backend.inc.footer')
</body>
</html>