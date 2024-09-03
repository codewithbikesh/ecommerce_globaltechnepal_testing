@extends('backend.layout.master')
@section('content')


<div class="pagetitle">
  <h1>Inquiries</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Inquiries</li>
    </ol>
  </nav>
</div><!-- End Page Title --> 

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Inquiries</h4>
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
            <th scope="col">Messages</th>
            <th scope="col">Date</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
          @foreach ($contacts as $index => $contact)
          <tr>
            <th scope="row">{{ $index + 1 }}</th>
            <td>{{ $contact->name }}</td>
            <td>{{ $contact->email }}</td>
            <td>{{ $contact->phone }}</td>
            <td>{{ $contact->message }}</td>
            <td>{{ $contact->created_at->format('Y-m-d') }}</td>
            <td>
              <div style="display: flex; align-items: center;">
                <form method="post" action="{{ route('backend.inquiries.view') }}" style="margin-right: 10px;">
                @csrf
                  <input type="hidden" name="id" value="{{ $contact->id }}"></button>
                  <button style="background-color: transparent; border: none;">
                    <i title="View Details" class="fa fa-info-circle" style="font-size:35px;color:#24a0ed"></i>
                  </button>
                </form>
                &nbsp;

                <form method="post" action="{{ route('backend.inquiries.edit') }}" style="margin-right: 10px;">
                @csrf
                <input type="hidden" name="id" value="{{ $contact->id }}">
                  <button style="background-color: transparent; border: none;">
                    <i title="Edit Details" class="fa fa-edit" style="font-size:35px;color:blue"></i>
                  </button>
                </form>
                &nbsp;

                <button data-bs-toggle="modal" data-bs-target="#deleteModal{{ $contact->id }}" style="background-color: transparent; border: none;">
                  <i title="Delete" class="fa fa-trash" style="font-size:35px;color:red"></i>
                </button>
              </div>
            </td>
          </tr>

          <!-- Delete Modal -->
          <div class="modal fade" id="deleteModal{{ $contact->id }}" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Delete Inquiry</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <b>Are you sure you want to delete this inquiry of {{ $contact->name }}?</b>
                </div>
                <div class="modal-footer">
                  <form method="post" action="{{ route('backend.inquiries.delete', $contact->id) }}">
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
