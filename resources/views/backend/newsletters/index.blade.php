@extends('backend.layout.master')
@section('content')


<div class="pagetitle">
  <h1>Newsletter Subscribers</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Newsletters Subscribers</li>
    </ol>
  </nav>
</div><!-- End Page Title --> 

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Newsletter Subscribers</h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th scope="col">S.N.</th>
            <th scope="col">Gender</th>
            <th scope="col">Email</th>
            <th scope="col">Date</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
          @foreach ($newsletters as $index => $newsletter)
          <tr>
            <th scope="row">{{ $index + 1 }}</th>
            <td>
              @if ($newsletter->gender == 'M')
                  Male
              @elseif ($newsletter->gender == 'F')
                  Female
              @else
                  Unknown
              @endif
            </td>
            <td>{{ $newsletter->email }}</td>
            <td>{{ $newsletter->created_at->format('Y-m-d') }}</td>
            <td>
              <div style="display: flex; align-items: center;">
                <form method="post" action="{{ route('backend.newsletters.view') }}" style="margin-right: 10px;">
                @csrf
                  <input type="hidden" name="id" value="{{ $newsletter->id }}"></button>
                  <button style="background-color: transparent; border: none;">
                    <i title="View Details" class="fa fa-info-circle" style="font-size:35px;color:#24a0ed"></i>
                  </button>
                </form>
                &nbsp;

                <button data-bs-toggle="modal" data-bs-target="#deleteModal{{ $newsletter->id }}" style="background-color: transparent; border: none;">
                  <i title="Delete" class="fa fa-trash" style="font-size:35px;color:red"></i>
                </button>
              </div>
            </td>
          </tr>

          <!-- Delete Modal -->
          <div class="modal fade" id="deleteModal{{ $newsletter->id }}" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Delete Newsletter</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <b>Are you sure you want to delete this Newsletter?</b>
                </div>
                <div class="modal-footer">
                  <form method="post" action="{{ route('backend.newsletters.delete', $newsletter->id) }}">
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
