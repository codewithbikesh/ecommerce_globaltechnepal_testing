<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Models\Carousel;
use App\Models\Product;
use App\Models\WebsiteData;
use App\Models\Newsletter;
use App\Models\Customer;
use App\Models\Inquiry;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
  public  function index(){
        // $categories = Product::distinct()->pluck('category_id');
        $categories = Product::select('category_id')->groupBy('category_id')->havingRaw('COUNT(*) > 7')->pluck('category_id');
        $products = Product::limit(25)->get();
        $carousel = Carousel::all();
        $websitedata = WebsiteData::first();
        // dd($products);
        return view("frontend.index", compact("categories","products","carousel", "websitedata"));
    }


    // 404
    public function unexpectedError(){
        $websitedata = WebsiteData::first();
        return view("frontend.404", compact("websitedata"));
    }

    // about 
    public function about(){
        $websitedata = WebsiteData::first();
        return view("frontend.about", compact("websitedata"));
    }

    // Best Sale 
    public function bestSale(){
        $websitedata = WebsiteData::first();
        return view("frontend.bestSale", compact("websitedata"));
    }
 
    // cart
    public function cart(){
        $websitedata = WebsiteData::first();
        return view("frontend.cart", compact("websitedata"));
    }

    // checkout 
    public function checkout(){
        $websitedata = WebsiteData::first();
        return view("frontend.checkout", compact("websitedata"));
    }

    // contact 
    public function contact(){
        $websitedata = WebsiteData::first();
        return view("frontend.contact", compact("websitedata"));
    }

    // dash-cancellation 
        public function dashCancellation(){
            $websitedata = WebsiteData::first();
            return  view("frontend.dash-cancellation", compact("websitedata"));
        }

    //  dash-my-order 
    public function dashMyOrder(){
        $websitedata = WebsiteData::first();
        return view("frontend.dash-my-order", compact("websitedata"));
    }

    // dashboard 
    public function account(){
        $websitedata = WebsiteData::first();
        return view("frontend.account", compact("websitedata"));
    }

    // explore 
    public function explore(){
        $websitedata = WebsiteData::first();
        return view("frontend.explore", compact("websitedata"));
    }

    // lost-password 
    public function lostPassword(){
        $websitedata = WebsiteData::first();
        return view("frontend.lost-password", compact("websitedata"));
    }

    // newarrival
    public function newarrival(){
        $websitedata = WebsiteData::first();
        return view("frontend.newarrival", compact("websitedata"));
    }

    // product-detail 
    public function productDetails($id){
        $productDetails = Product::find($id);
        $websitedata = WebsiteData::first();
        return view("frontend.product-detail", compact("websitedata","productDetails"));
    }

    // shop list full 
    public function shopListFull(){
        $websitedata = WebsiteData::first();
        return view("frontend.shop-list-full", compact("websitedata"));
    }

    //  signin
    public function signin(){
        $websitedata = WebsiteData::first();
        return view("frontend.signin", compact("websitedata"));
    }

    // signup 
    public function signup(){
        $websitedata = WebsiteData::first();
        return view("frontend.signup", compact("websitedata"));
    }

    // whatsnew 
    public function whatsnew(){
        $websitedata = WebsiteData::first();
         return view("frontend.whatsnew", compact("websitedata"));
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
            return redirect()->back()->with('success', 'Thank you for subscription.');
        } else {
            return redirect()->back()->with('error', 'Error occured while subscribing newsletter. Please try again later.');
        }
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
            return redirect()->route('frontend.signup')->with('success', 'Your Account have been successfully created. Please check your mail for verification.');
        } else {
            return redirect()->route('frontend.signup')->with('error', 'Error occured while creating account. Try again later.');
        }
    }
    
    public function inquiry_store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'subject' => 'required',
            'message' => 'required'
        ]);
        $inquiry = new Inquiry();
        $inquiry->name = $request->name;
        $inquiry->email = $request->email;
        $inquiry->subject = $request->subject;
        $inquiry->message = $request->message;
        if ($inquiry->save()) {
            return redirect()->route('frontend.contact')->with('success', 'Thank you for contacting with us. We will connect with you shortly.');
        } else {
            return redirect()->route('frontend.contact')->with('error', 'Error in submitting Form. Please try again later.');
        }
    }

}
