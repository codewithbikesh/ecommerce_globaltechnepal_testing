@extends('backend.layout.master')
@section('content')


<div class="pagetitle">
  <h1>Load Products API</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Load Products API</li>
    </ol>
  </nav>
</div><!-- End Page Title --> 

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Load Products API</h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      <form class="row g-3" method="post" action="{{ route('backend.loadproductsapi.index') }}" enctype="multipart/form-data">
      @csrf
      <button type="submit" class="btn btn-success">Load Products</button>
      </form>
    </div>
  </div>
</div>

@endsection
