@extends('backend.layout.master')
@section('content')

    <div class="pagetitle">
      <h1>Profile</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}"><i class="fa fa-dashboard"></i><span> Dashboard</span></a>
          </li>
          <li class="breadcrumb-item active">Profile</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

              <img src="{{ asset('storage/backend/profile_photo/' . $user->profile_photo_path) }}" alt="Profile" class="rounded-circle">
              
              <h2>{{ Auth::user()->name }}</h2>
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link @if (session('tab', 'profile-overview') == 'profile-overview') active @endif" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link @if (session('tab') == 'profile-edit') active @endif" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link @if (session('tab') == 'profile-change-password') active @endif" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change Password</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade  @if (session('tab', 'profile-overview') == 'profile-overview') show active @endif profile-overview" id="profile-overview">

                  <h5 class="card-title">Profile Details</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">Full Name</div>
                    <div class="col-lg-9 col-md-8">{{ Auth::user()->name }}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Country</div>
                    <div class="col-lg-9 col-md-8">{{ Auth::user()->country }}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Address</div>
                    <div class="col-lg-9 col-md-8">{{ Auth::user()->address }}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Phone</div>
                    <div class="col-lg-9 col-md-8">{{ Auth::user()->phone }}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Email</div>
                    <div class="col-lg-9 col-md-8">{{ Auth::user()->email }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Account Type</div>
                    <div class="col-lg-9 col-md-8">{{ Auth::user()->account_type }}</div>
                  </div>
                  
                </div>

                <div class="tab-pane fade @if (session('tab') == 'profile-edit') show active @endif" id="profile-edit">

                <form method="post" action="{{ route('backend.profile.update') }}" enctype="multipart/form-data">
                   @csrf                
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>

                      
                        <div class="col-md-8 col-lg-9">
                          <img src="{{ asset('storage/backend/profile_photo/' . $user->profile_photo_path) }}" alt="Profile" width="100">
                          <div class="pt-2">
			                    <input type="file" id="upload" name="profile_photo_path"  accept="image/png, image/gif, image/jpeg" />
                          </div>
                        </div>
                    </div>
                    
                    <input type="hidden" name="id" value="{{ Auth::user()->id }}">
                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="name" type="text" class="form-control" id="fullName" value="{{ $user->name }}">
                      </div>
                    </div>

                    
                    <div class="row mb-3">
                      <label for="Country" class="col-md-4 col-lg-3 col-form-label">Country</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="country" type="text" class="form-control" id="Country" value="{{ $user->country }}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Address" class="col-md-4 col-lg-3 col-form-label">Address</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="address" type="text" class="form-control" id="Address" value="{{ $user->address }}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="phone" type="text" class="form-control" id="Phone" value="{{ $user->phone }}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="email" type="email" class="form-control" id="Email" value="{{ $user->email }}">
                      </div>
                    </div>

                    <div class="row mb-3">
                    <label for="inputCity" class="col-md-4 col-lg-3 form-label">Account Type</label>
                    <div class="col-md-8 col-lg-9">
                      <select class="form-select" name="account_type" aria-label="State">
                        <option value="A">Admin</option>
                        <option value="U">Normal User</option>
                      </select>
                    </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>

                  </form><!-- End Profile Edit Form -->

                </div>


                <div class="tab-pane fade @if (session('tab') == 'profile-change-password') show active @endif" id="profile-change-password">
                  <!-- Change Password Form -->
                  <form method="post" action="{{ route('backend.profile.change-password') }}">
                    @csrf

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="password" type="password" class="form-control" id="currentpassword" required>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newpassword" type="password" class="form-control" id="newPassword" onkeyup="passcheck();" required>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="renewpassword" type="password" class="form-control" id="confirmPassword" onkeyup="passcheck();" required>
                      </div>
                    </div>

                    <h5 id="passcheck"></h5>

                    <div class="text-center">
                      <button type="submit" id="submitButton" class="btn btn-primary" disabled>Change Password</button>
                    </div>
                  </form><!-- End Change Password Form -->

                </div>

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>

<script type="text/javascript">
function passcheck(){
  if ($('#newPassword').val() !== '' && $('#confirmPassword').val() !== '') {
    if ($('#newPassword').val() === $('#confirmPassword').val()) {
      $('#passcheck').html("Password Matched.");
      $('#submitButton').prop('disabled', false); // Enable the button
    } else {
      $('#passcheck').html("Password didn't match!!!");
      $('#submitButton').prop('disabled', true); // Disable the button
    }
  }
}
</script>
    
    @endsection