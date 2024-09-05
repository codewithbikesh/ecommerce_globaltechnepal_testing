
<header id="header" class="header fixed-top d-flex align-items-center">

        <div class="d-flex align-items-center justify-content-between">
    
            <form method="get" action='{{ route('backend.dashboard') }}'>
            <button type="submit" class="logo d-flex align-items-center" style="border:none; background:transparent;"><img src="{{ asset('backend/images/logo/logo.png') }}" alt=""></button>
            </form>
            
            <i class="bi bi-list toggle-sidebar-btn"></i>
        </div><!-- End Logo -->


<nav class="header-nav ms-auto">
  <ul class="d-flex align-items-center">


    <li class="nav-item dropdown pe-3">

      <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
        <img src="{{ asset('storage/backend/profile_photo/' . Auth::user()->profile_photo_path) }}" alt="Profile" class="rounded-circle">
        <span class="d-none d-md-block dropdown-toggle ps-2">{{ Auth::user()->name }}</span>
      </a><!-- End Profile Iamge Icon -->

      <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
        <li class="dropdown-header">
          <h6>{{ Auth::user()->name }}</h6>
        </li>
        <li>
          <hr class="dropdown-divider">
        </li>

        <li>
        <form method="get" action="{{ route('backend.profile.profile') }}">
        @csrf
        <button type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.profile.profile') ? 'active' : '' }}" ><i class="fa fa-user"></i>My profile</></button>
        </form>
        </li>

        <li>
          <hr class="dropdown-divider">
        </li>
        
        <li>
          <a type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.loadproductsapi.index') ? 'active' : '' }}" href="{{ route('backend.loadproductsapi.index') }}"><i class="fa fa-cog"></i>Load Products</a>
          </li>
  
          <li>
            <hr class="dropdown-divider">
          </li>
        
        <li>
        <a type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.website.setting') ? 'active' : '' }}" href="{{ route('backend.website.setting') }}"><i class="fa fa-cog"></i>Ecommerce Settings</a>
        </li>

        <li>
          <hr class="dropdown-divider">
        </li>
        
        <li>
          <a type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.website.carousel') ? 'active' : '' }}" href="{{ route('backend.website.carousel') }}"><i class="fa fa-cog"></i>Carousel</a>
          </li>
  
          <li>
            <hr class="dropdown-divider">
          </li>

        
        <li>
        <a class="dropdown-item d-flex align-items-center" href="#" data-bs-toggle="modal" data-bs-target="#logoutmodal"><i class="fa fa-sign-out"></i>Logout</a>                    
        </li>          
              
        

      </ul><!-- End Profile Dropdown Items -->
    </li><!-- End Profile Nav -->

  </ul>
</nav><!-- End Icons Navigation -->

</header><!-- End Header -->


                <!--Users Logout Modal-->
                <div class="modal fade" id="logoutmodal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Logout</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        
                        <b>Are you sure you want to Logout?</b>
                  
                    </div>
                    
                    <div class="modal-footer">
                      <form id="frm-logout" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                      </form>
                      <button type="button" class="btn btn-primary" onclick="event.preventDefault(); document.getElementById('frm-logout').submit();">Logout</button>

                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                    
                  </div>
                </div>
              </div><!-- End User Logout Modal-->


<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

<ul class="sidebar-nav" id="sidebar-nav">

  <li class="nav-item">
      <a class="nav-link {{ request()->routeIs('backend.dashboard') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.dashboard') }}"><i class="fa fa-dashboard"></i><span>Dashboard</span></a>
  </li>
  
  <li>
        <a class="nav-link {{ request()->routeIs('backend.products.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.products.index') }}"><i class="fa fa-list-alt"></i><span>Products</span></a>
  </li>
  
  <li>
    <a class="nav-link {{ request()->routeIs('backend.customers.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.customers.index') }}"><i class="fa fa-users"></i><span>Customers</span></a>
  </li>
  
  <li>
    <a class="nav-link {{ request()->routeIs('backend.orders.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.orders.index') }}"><i class="fa fa-shopping-cart"></i><span>Orders</span></a>
  </li>
  
  <li>
    <a class="nav-link {{ request()->routeIs('backend.faqs.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.faqs.index') }}"><i class="fa fa-question-circle"></i><span>Faqs</span></a>
  </li>
  
  <li>
    <a class="nav-link {{ request()->routeIs('backend.ratings.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.ratings.index') }}"><i class="fa fa-star"></i><span>Reviews and Ratings</span></a>
  </li>
  
  <li>
    <a class="nav-link {{ request()->routeIs('backend.inquiries.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.inquiries.index') }}"><i class="fa fa-question-circle"></i><span>Inquiries</span></a>
  </li>
  
  <li>
    <a class="nav-link {{ request()->routeIs('backend.newsletters.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.newsletters.index') }}"><i class="fa fa-question-circle"></i><span>Newsletter Subscribers</span></a>
  </li>
  
  <li>
    <a class="nav-link {{ request()->routeIs('backend.users.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.users.index') }}"><i class="fa fa-users"></i><span>System Users</span></a>
  </li>

</ul>

</aside>


