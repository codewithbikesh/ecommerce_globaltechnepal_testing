@extends('backend.layout.master')
@section('content')


<div class="pagetitle">
  <h1>Customers</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Customers</li>
    </ol>
  </nav>
</div><!-- End Page Title --> 

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Customers</h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th scope="col">S.N.</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Phone</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
          @foreach ($customers as $index => $customers)
          <tr>
            <th scope="row">{{ $index + 1 }}</th>
            <td>{{ $customers->full_name }}</td>
            <td>{{ $customers->email }}</td>
            <td>{{ $customers->phone }}</td>
            <td>
              <div style="display: flex; align-items: center;">
                <form method="post" action="{{ route('backend.customers.view') }}" style="margin-right: 10px;">
                @csrf
                  <input type="hidden" name="id" value="{{ $customers->id }}"></button>
                  <button style="background-color: transparent; border: none;">
                    <i title="View Details" class="fa fa-info-circle" style="font-size:35px;color:#24a0ed"></i>
                  </button>
                </form>
                &nbsp;

              </div>
            </td>
          </tr>

          @endforeach
        </tbody>
      </table>
    </div>
  </div>
</div>

@endsection
