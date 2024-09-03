@extends('backend.layout.master')
@section('content')

      <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-10 col-md-6 d-flex flex-column align-items-center justify-content-center">


          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center><strong>Website Data</strong></center></h5>
                    
                    
              <!-- Multi Columns Form -->
              <form class="row g-3" method="post" action="{{ route('backend.website.update', $websitedata->id) }}" enctype="multipart/form-data">
              @csrf
                    
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Company Name <span style="color:red;">*</span></label>
                  <input type="text" class="form-control" name="company_name" value="{{ $websitedata->company_name }}" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Company Logo Header</label>
                          <img src="{{ asset('storage/backend/company_logo/' . $websitedata->company_logo_header) }}" alt="Logo Header" width="100">
                          <div class="pt-2">
			                    <input type="file" id="upload" name="company_logo_header"  accept="image/png, image/gif, image/jpeg" />
                          </div>
                </div>
                
                <div class="col-md-6>
                  <label for="inputName5" class="form-label">Company Logo Footer</label>
                          <img src="{{ asset('storage/backend/company_logo/' . $websitedata->company_logo_footer) }}" alt="Logo Footer" width="100">
                          <div class="pt-2">
			                    <input type="file" id="upload" name="company_logo_footer"  accept="image/png, image/gif, image/jpeg" />
                          </div>
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">Primary Email <span style="color:red;">*</span></label>
                  <input type="email" class="form-control" name="primary_email" value="{{ $websitedata->primary_email }}" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">Secondary Email</label>
                  <input type="email" class="form-control" name="secondary_email" value="{{ $websitedata->secondary_email }}">
                </div>
                
                <div class="col-md-6">
                  <label for="inputPassword5" class="form-label">Primary Phone <span style="color:red;">*</span></label>
                  <input type="phone" class="form-control" value="{{ $websitedata->primary_phone }}" name="primary_phone" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputPassword5" class="form-label">Secondary Phone</label>
                  <input type="phone" class="form-control" value="{{ $websitedata->secondary_phone }}" name="secondary_phone">
                </div>
                
                <div class="col-md-6">
                  <label for="inputZip" class="form-label">Company Address <span style="color:red;">*</span></label>
                  <input type="text" class="form-control" value="{{ $websitedata->address }}" name="address" required>
                </div> 
                
                <div class="col-md-6">
                  <label for="inputZip" class="form-label">Website Link <span style="color:red;">*</span></label>
                  <input type="text" class="form-control" value="{{ $websitedata->website_link }}" name="website_link" required>
                </div> 

                <table>
                <tr>
                <th>
                    
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Update Website Details</button>
                
              </form><!-- End Multi Columns Form -->
              </th>
              <th>
              <form method="get" action="{{ route('backend.website.setting') }}">
                <div class="text-center">
                  <button type="submit" class="btn btn-secondary">Cancel </button>
                </div>
              </form>
              </div>
              
              </th>
              </tr>
              </table>
              
            </div>
          </div>

        </div>


            </div>
          </div>
        </div>
    </section>

@endsection