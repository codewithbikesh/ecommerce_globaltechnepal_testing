@extends('backend.layout.master')
@section('content')

      <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-10 col-md-6 d-flex flex-column align-items-center justify-content-center">


          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center><strong>Carousel Images</strong></center></h5>
                    
                    
              <!-- Multi Columns Form -->
              <form class="row g-3" method="post" action="{{ route('backend.website.carousel_update', $carouseldata->id) }}" enctype="multipart/form-data">
              @csrf
                
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Carousel Image 1</label>
                          <img src="{{ asset('storage/backend/carousel_images/' . $carouseldata->image_1) }}" alt="Carousel Image 1" width="100">
                          <div class="pt-2">
			                    <input type="file" id="upload" name="carousel_image_1"  accept="image/png, image/gif, image/jpeg" />
                          </div>
                </div>
                
                <div class="col-md-6>
                  <label for="inputName5" class="form-label">Carousel Image 2</label>
                          <img src="{{ asset('storage/backend/carousel_images/' . $carouseldata->image_2) }}" alt="Carousel Image 2" width="100">
                          <div class="pt-2">
			                    <input type="file" id="upload" name="carousel_image_2"  accept="image/png, image/gif, image/jpeg" />
                          </div>
                </div>
                
                
                <div class="col-md-6>
                  <label for="inputName5" class="form-label">Carousel Image 3</label>
                          <img src="{{ asset('storage/backend/carousel_images/' . $carouseldata->image_3) }}" alt="Carousel Image 3" width="100">
                          <div class="pt-2">
			                    <input type="file" id="upload" name="carousel_image_3"  accept="image/png, image/gif, image/jpeg" />
                          </div>
                </div>
                
                <table>
                <tr>
                <th>
                    
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Update Carousel Images</button>
                
              </form><!-- End Multi Columns Form -->
              </th>
              <th>
              <form method="get" action="{{ route('backend.website.carousel') }}">
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