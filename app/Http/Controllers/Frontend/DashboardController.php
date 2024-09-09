<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Models\Carousel;
use App\Models\Product;
use App\Models\WebsiteData;
use App\Models\Newsletter;
use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
  public  function index(){
        // $categories = Product::distinct()->pluck('category_id');
        // $newarriveproducts = Product::orderBy('created_at', 'desc')->limit(9)->get();
        $categories = Product::select('category_id')->groupBy('category_id')->havingRaw('COUNT(*) > 7')->pluck('category_id');
        $products = Product::limit(25)->get();
        $newarriveproducts = Product::orderBy('created_at', 'desc')->whereNotNull('primary_image')->limit(9)->get();
        $featureproducts = Product::limit(4)->get();
        $specialproducts = Product::limit(3)->get();
        $weeklyproducts = Product::orderBy('created_at', 'desc')->whereNotNull('primary_image')->limit(3)->get();
        $flashproducts = Product::whereNotNull('primary_image')->inRandomOrder()->limit(3)->get();
        $carousel = Carousel::all();
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        // dd($products);
        return view("frontend.index", compact("categories","products","carousel", "websitedata", "cart", "cartproducts","newarriveproducts","featureproducts","specialproducts","weeklyproducts","flashproducts"));
    }


    // account
    public function account(){
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.account", compact("websitedata", "cart", "cartproducts"));
    }

    // about 
    public function about(){
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.about", compact("websitedata", "cart", "cartproducts"));
    }

    // Best Sale 
    public function bestSale(){
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.bestSale", compact("websitedata", "cart", "cartproducts"));
    }
 

    // checkout 
    public function checkout(){
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.checkout", compact("websitedata", "cart", "cartproducts"));
    }

    // contact 
    public function contact(){
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.contact", compact("websitedata", "cart", "cartproducts"));
    }

    // dash-cancellation 
        public function dashCancellation(){
            $websitedata = WebsiteData::first();
            $cart = session()->get('cart', []);
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            return  view("frontend.dash-cancellation", compact("websitedata", "cart", "cartproducts"));
        }

    //  dash-my-order 
    public function dashMyOrder(){
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.dash-my-order", compact("websitedata", "cart", "cartproducts"));
    }

    // dashboard 
    public function dashboard(){
        $websitedata = WebsiteData::first();
        return view("frontend.account", compact("websitedata"));
    }

    // explore 
    public function explore(){
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.explore", compact("websitedata", "cart", "cartproducts"));
    }

    // lost-password 
    public function lostPassword(){
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.lost-password", compact("websitedata", "cart", "cartproducts"));
    }

    // newarrival
    public function newarrival(){
        // $newarriveproducts = Product::orderBy('created_at', 'desc')->limit(9)->get();
        $newarriveproducts = Product::limit(25)->get();
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.newarrival", compact("websitedata", "cart", "cartproducts","newarriveproducts"));
    }

    // product-detail 
    public function productDetails($id){
        $productDetails = Product::find($id);
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.product-detail", compact("websitedata","productDetails", "cart", "cartproducts"));
    }

    // shop list full 
    public function shopListFull(){
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.shop-list-full", compact("websitedata", "cart", "cartproducts"));
    }

    //  signin
    public function signin(){
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.signin", compact("websitedata", "cart", "cartproducts"));
    }

    // signup 
    public function signup(){
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.signup", compact("websitedata", "cart", "cartproducts"));
    }

    // whatsnew 
    public function whatsnew(){
        $newcategories = Product::select('category_id')->groupBy('category_id')->havingRaw('COUNT(*) > 5')->pluck('category_id');
        $whatsnewproducts = Product::orderBy('created_at', 'desc')->limit(9)->get();
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
         return view("frontend.whatsnew", compact("websitedata", "cart", "cartproducts","newcategories","whatsnewproducts"));
    }

    
    public function newsletter_store(Request $request)
    {
        $request->validate([
            'email' => 'required'
        ]);
        $newsletter = new Newsletter();
        $newsletter->gender = $request->gender;
        $newsletter->email = $request->email;
        if ($newsletter->save()) {
            session()->flash('success', 'Thank you for Subscription.');
        } else {
            session()->flash('error', 'Error !');
        }
        return redirect()->back();
    }
    
    public function customer_signup(Request $request)
    {
        $request->validate([
            'full_name' => 'required',
            'email' => 'required|email|unique:customers',
            'phone' => 'required',
            'password' => 'required',
            'province' => 'required',
            'city' => 'required',
            'street_address' => 'required'
        ]);
        $customer = new Customer();
        $customer->full_name = $request->full_name;
        $customer->email = $request->email;
        $customer->phone = $request->phone;
        $customer->password = Hash::make($request->password);
        $customer->province = $request->province;
        $customer->city = $request->city;
        $customer->street_address = $request->street_address;
        if ($customer->save()) {
            session()->flash('success', 'Your Account have been successfully created.');
        } else {
            session()->flash('error', 'Error !');
        }
        return redirect()->back();
    }

}
