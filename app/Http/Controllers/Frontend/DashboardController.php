<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Carousel;
use App\Models\Product;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
  public  function index(){
        // $categories = Product::distinct()->pluck('category_id');
        $categories = Product::select('category_id')->groupBy('category_id')->havingRaw('COUNT(*) > 7')->pluck('category_id');
        $products = Product::all();
        $carousel = Carousel::all();
        // dd($products);
         return view("frontend.index",compact("categories","products","carousel"));
    }


    // 404
    public function unexpectedError(){
         return view("frontend.404");
    }

    // about 
    public function about(){
         return view("frontend.about");
    }

    // Best Sale 
    public function bestSale(){
         return view("frontend.bestSale");
    }
 
    // cart
    public function cart(){
         return view("frontend.cart");
    }

    // checkout 
    public function checkout(){
        return view("frontend.checkout");
    }

    // contact 
    public function contact(){
         return view("frontend.contact");
    }

    // dash-cancellation 
        public function dashCancellation(){
            return  view("frontend.dash-cancellation");
        }

    //  dash-my-order 
    public function dashMyOrder(){
        return view("frontend.dash-my-order");
    }

    // dashboard 
    public function dashboard(){
        return view("frontend.dashboard");
    }

    // explore 
    public function explore(){
        return view("frontend.explore");
    }

    // lost-password 
    public function lostPassword(){
        return view("frontend.lost-password");
    }

    // newarrival
    public function newarrival(){
         return view("frontend.newarrival");
    }

    // product-detail 
    public function productDetails(){
        return view("frontend.product-detail");
    }

    // shop list full 
    public function shopListFull(){
        return view("frontend.shop-list-full");
    }

    //  signin
    public function signin(){
         return view("frontend.signin");
    }

    // signup 
    public function signup(){
        return view("frontend.signup");
    }

    // whatsnew 
    public function whatsnew(){
         return view("frontend.whatsnew");
    }
}
