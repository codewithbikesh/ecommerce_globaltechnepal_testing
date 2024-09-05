<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Backend\InquiryController;
use App\Http\Controllers\Backend\UserController;
use App\Http\Controllers\Frontend\DashboardController;
use App\Http\Controllers\ProfileController; 
use App\Http\Controllers\Backend\WebsiteController;
use App\Http\Controllers\Backend\ProductController;
use App\Http\Controllers\Backend\CustomerController;
use App\Http\Controllers\Backend\LoadProductsAPIController;
use Illuminate\Support\Facades\Route;


Route::get('login', [AuthenticatedSessionController::class, 'create'])
->name('login');

Route::middleware('auth')->group(function () {
    
    Route::get('/dashboard', function () {
    return view('backend.dashboard');
    })->middleware(['auth', 'verified'])->name('backend.dashboard');

    //Profile
    Route::get('/profile', [ProfileController::class, 'edit'])->name('backend.profile.profile');
    Route::post('/profile/update', [ProfileController::class, 'update'])->name('backend.profile.update');
    Route::post('/profile/change-password', [ProfileController::class, 'changepassword'])->name('backend.profile.change-password');
    
    //Products
    Route::get('/products', [ProductController::class, 'index'])->name('backend.products.index');
    
    //Customers
    Route::get('/customers', [CustomerController::class, 'index'])->name('backend.customers.index');
    
    //Load Prodicts from OMS API
    Route::get('/load-products-api', [LoadProductsAPIController::class, 'index'])->name('backend.loadproductsapi.index');

    //Inquiries
    Route::get('/inquiries', [InquiryController::class, 'index'])->name('backend.inquiries.index');
    Route::post('/inquiries/view', [InquiryController::class, 'view'])->name('backend.inquiries.view');
    Route::post('/inquiries/edit', [InquiryController::class, 'edit'])->name('backend.inquiries.edit');
    Route::post('/inquiries/{id}', [InquiryController::class, 'update'])->name('backend.inquiries.update');
    Route::delete('/inquiries/{id}', [InquiryController::class, 'delete'])->name('backend.inquiries.delete');

    //Users
    Route::get('/users', [UserController::class, 'index'])->name('backend.users.index');
    Route::get('/users/add', [UserController::class, 'add'])->name('backend.users.add');
    Route::post('/users', [UserController::class, 'store'])->name('backend.users.store');
    Route::post('/users/view', [UserController::class, 'view'])->name('backend.users.view');
    Route::post('/users/edit', [UserController::class, 'edit'])->name('backend.users.edit');
    Route::post('/users/{id}', [UserController::class, 'update'])->name('backend.users.update');
    Route::delete('/users/{id}', [UserController::class, 'delete'])->name('backend.users.delete');
        
    //Website Data
    Route::get('/website', [WebsiteController::class, 'data'])->name('backend.website.setting');
    Route::post('/website/{id}', [WebsiteController::class, 'update'])->name('backend.website.update');

});

    // Frontend section 
    Route::get('/', [DashboardController::class,'index'])->name('frontend.index');  

require __DIR__.'/auth.php';
    