@extends('backend.layout.master')
@section('content')


<div class="pagetitle">
  <h1>Set Shipping Cost</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Set Shipping Cost</li>
    </ol>
  </nav>
</div><!-- End Page Title --> 

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Set Shipping Cost
      <form method="get" action="{{ route('backend.setshipping.add') }}" enctype="multipart/form-data" style="display: inline-block;">
          <button class="btn btn-primary"><span style="color:white;">Add Cost</span></button>
      </form>
    </h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th scope="col">S.N.</th>
            <th scope="col">Province</th>
            <th scope="col">City</th>
            <th scope="col">Shipping Cost</th>
            <th scope="col">Remarks</th>
            <th scope="col">Date</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
          @foreach ($shippings as $index => $shipping)
          <tr>
            <th scope="row">{{ $index + 1 }}</th>
            <td>
              {{ $provinceName = $provinces[$shipping->province] ?? 'Unknown'; }}
            </td>
            <td>{{ $shipping->city }}</td>
            <td>{{ $shipping->shipping_cost }}</td>
            <td>{{ $shipping->remarks }}</td>
            <td>{{ $shipping->created_at->format('Y-m-d') }}</td>
            <td>
              <div style="display: flex; align-items: center;">
                <form method="post" action="{{ route('backend.setshipping.view') }}" style="margin-right: 10px;">
                @csrf
                  <input type="hidden" name="id" value="{{ $shipping->id }}"></button>
                  <button style="background-color: transparent; border: none;">
                    <i title="View Details" class="fa fa-info-circle" style="font-size:35px;color:#24a0ed"></i>
                  </button>
                </form>
                &nbsp;
                        
                <form method="post" action="{{ route('backend.setshipping.edit') }}" style="margin-right: 10px;">
                @csrf
                <input type="hidden" name="id" value="{{ $shipping->id }}">
                <button style="background-color: transparent; border: none;">
                    <i title="Edit Details" class="fa fa-edit" style="font-size:35px;color:blue"></i>
                </button>
                </form>
                &nbsp;

                <button data-bs-toggle="modal" data-bs-target="#deleteModal{{ $shipping->id }}" style="background-color: transparent; border: none;">
                  <i title="Delete" class="fa fa-trash" style="font-size:35px;color:red"></i>
                </button>
              </div>
            </td>
          </tr>

          <!-- Delete Modal -->
          <div class="modal fade" id="deleteModal{{ $shipping->id }}" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Delete Shipping</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <b>Are you sure you want to delete this Shipping?</b>
                </div>
                <div class="modal-footer">
                  <form method="post" action="{{ route('backend.setshipping.delete', $shipping->id) }}">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-danger">Delete</button>
                  </form>
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div><!-- End Delete Modal -->
          @endforeach
        </tbody>
      </table>
    </div>
  </div>
</div>

@endsection
