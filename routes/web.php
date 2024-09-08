<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Backend\InquiryController;
use App\Http\Controllers\Backend\UserController;
use App\Http\Controllers\Frontend\DashboardController;
use App\Http\Controllers\Backend\ProfileController; 
use App\Http\Controllers\Backend\WebsiteController;
use App\Http\Controllers\Backend\ProductController;
use App\Http\Controllers\Backend\CustomerController;
use App\Http\Controllers\Backend\LoadProductsAPIController;
use App\Http\Controllers\Backend\OrderController;
use App\Http\Controllers\Backend\FAQSController;
use App\Http\Controllers\Backend\ReviewRatingController;
use App\Http\Controllers\Backend\NewsletterController;
use App\Http\Controllers\Backend\SetAPIController;
use Illuminate\Support\Facades\Route;


Route::get('admin-login', [AuthenticatedSessionController::class, 'create'])
->name('admin-login');

Route::middleware('auth')->group(function () {
    
    Route::get('/admin-dashboard', function () {
    return view('backend.dashboard');
    })->middleware(['auth', 'verified'])->name('backend.dashboard');

    //Profile
    Route::get('/profile', [ProfileController::class, 'edit'])->name('backend.profile.profile');
    Route::post('/profile/update', [ProfileController::class, 'update'])->name('backend.profile.update');
    Route::post('/profile/change-password', [ProfileController::class, 'changepassword'])->name('backend.profile.change-password');
    
    //SET API
    Route::get('/set-api', [SetAPIController::class, 'index'])->name('backend.setapi.index');
    Route::get('/set-api/add', [SetAPIController::class, 'add'])->name('backend.setapi.add');
    Route::post('/set-api', [SetAPIController::class, 'store'])->name('backend.setapi.store');
    Route::post('/set-api/edit', [SetAPIController::class, 'edit'])->name('backend.setapi.edit');
    Route::post('/set-api/{id}', [SetAPIController::class, 'update'])->name('backend.setapi.update');
    Route::delete('/set-api/{id}', [SetAPIController::class, 'delete'])->name('backend.setapi.delete');

    //Products
    Route::get('/products', [ProductController::class, 'index'])->name('backend.products.index');
    
    //Customers
    Route::get('/customers', [CustomerController::class, 'index'])->name('backend.customers.index');
    
    //Orders
    Route::get('/orders', [OrderController::class, 'index'])->name('backend.orders.index');
    
    //Reviews and Ratings
    Route::get('/reviews-ratings', [ReviewRatingController::class, 'index'])->name('backend.ratings.index');
    
    //FAQS
    Route::get('/faqs', [FAQSController::class, 'index'])->name('backend.faqs.index');
    
    //Load Prodicts from OMS API
    Route::get('/load-products-api', [LoadProductsAPIController::class, 'index'])->name('backend.loadproductsapi.index');

    //Inquiries
    Route::get('/inquiries', [InquiryController::class, 'index'])->name('backend.inquiries.index');
    Route::post('/inquiries/view', [InquiryController::class, 'view'])->name('backend.inquiries.view');
    Route::delete('/inquiries/{id}', [InquiryController::class, 'delete'])->name('backend.inquiries.delete');
    
    //Newsletter Subscribers
    Route::get('/newsletter-subscribers', [NewsletterController::class, 'index'])->name('backend.newsletters.index');
    Route::post('/newsletter-subscriber/view', [NewsletterController::class, 'view'])->name('backend.newsletters.view');
    Route::delete('/newsletter-subscriber/{id}', [NewsletterController::class, 'delete'])->name('backend.newsletters.delete');

    //Users
    Route::get('/users', [UserController::class, 'index'])->name('backend.users.index');
    Route::get('/users/add', [UserController::class, 'add'])->name('backend.users.add');
    Route::post('/users', [UserController::class, 'store'])->name('backend.users.store');
    Route::post('/users/view', [UserController::class, 'view'])->name('backend.users.view');
    Route::post('/users/edit', [UserController::class, 'edit'])->name('backend.users.edit');
    Route::post('/users/{id}', [UserController::class, 'update'])->name('backend.users.update');
    Route::delete('/users/{id}', [UserController::class, 'delete'])->name('backend.users.delete');
        
    //Website and Carousel Images Data
    Route::get('/website', [WebsiteController::class, 'data'])->name('backend.website.setting');
    Route::post('/website/{id}', [WebsiteController::class, 'update'])->name('backend.website.update');
    Route::get('/website-carousel', [WebsiteController::class, 'carousel_data'])->name('backend.website.carousel');
    Route::post('/website-carousel/{id}', [WebsiteController::class, 'carousel_update'])->name('backend.website.carousel_update');

});

    // Frontend section 
    Route::get('/', [DashboardController::class,'index'])->name('frontend.index');  
    Route::get('/404', [DashboardController::class,'unexpectedError'])->name('frontend.404');  
    Route::get('/about', [DashboardController::class,'about'])->name('frontend.about');  
    Route::get('/best-sale', [DashboardController::class,'bestSale'])->name('frontend.bestSale');  
    Route::get('/cart', [DashboardController::class,'cart'])->name('frontend.cart');  
    Route::get('/checkout', [DashboardController::class,'checkout'])->name('frontend.checkout');   
    Route::get('/contact', [DashboardController::class,'contact'])->name('frontend.contact');   
    Route::get('/dash-cancellation', [DashboardController::class,'dashCancellation'])->name('frontend.dash-cancellation');   
    Route::get('/dash-my-order', [DashboardController::class,'dashMyOrder'])->name('frontend.dash-my-order');   
    Route::get('/dashboard', [DashboardController::class,'dashboard'])->name('frontend.dashboard');   
    Route::get('/explore', [DashboardController::class,'explore'])->name('frontend.explore');   
    Route::get('/lost-password', [DashboardController::class,'lostPassword'])->name('frontend.lost-password');   
    Route::get('/newarrival', [DashboardController::class,'newarrival'])->name('frontend.newarrival');   
    Route::get('/product-details', [DashboardController::class,'productDetails'])->name('frontend.product-detail');   
    Route::get('/shop-list-full', [DashboardController::class,'shopListFull'])->name('frontend.shop-list-full');   
    Route::get('/signin', [DashboardController::class,'signin'])->name('frontend.signin');   
    Route::get('/signup', [DashboardController::class,'signup'])->name('frontend.signup');   
    Route::get('/whatsnew', [DashboardController::class,'whatsnew'])->name('frontend.whatsnew'); 
    
    Route::post('/', [DashboardController::class, 'newsletter_store'])->name('frontend.newsletter.store');  
    Route::post('/signup', [DashboardController::class, 'customer_signup'])->name('frontend.customer.signup');


require __DIR__.'/auth.php';
    