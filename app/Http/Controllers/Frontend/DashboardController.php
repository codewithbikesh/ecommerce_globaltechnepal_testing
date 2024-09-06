<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Carousel;
use App\Models\Product;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    function index(){
        // $categories = Product::distinct()->pluck('category_id');
        $categories = Product::select('category_id')->groupBy('category_id')->havingRaw('COUNT(*) > 5')->pluck('category_id');
        $products = Product::all();
        $carousel = Carousel::all();
        // dd($products);
         return view("frontend.index",compact("categories","products","carousel"));
    }
}
