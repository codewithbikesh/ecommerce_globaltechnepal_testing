<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Models\Carousel;
use App\Models\Product;
use App\Models\WebsiteData;
use App\Models\Newsletter;
use App\Models\Customer;
use App\Models\Cart;
use App\Models\DeliveryInformation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
  public  function index(){
    $cartItemCount = 0;
    $cartproducts = collect(); // Initialize as an empty collection
        // $categories = Product::distinct()->pluck('category_id');
        // $newarriveproducts = Product::orderBy('created_at', 'desc')->limit(9)->get();
        $categories = Product::select('category_id')->groupBy('category_id')->havingRaw('COUNT(*) > 7')->pluck('category_id');
        $products = Product::limit(40)->get();
        $newarriveproducts = Product::orderBy('created_at', 'desc')->whereNotNull('primary_image')->limit(9)->get();
        $featureproducts = Product::limit(4)->get();
        $specialproducts = Product::limit(3)->get();
        $weeklyproducts = Product::orderBy('created_at', 'desc')->whereNotNull('primary_image')->limit(3)->get();
        $flashproducts = Product::whereNotNull('primary_image')->inRandomOrder()->limit(3)->get();
        $carousel = Carousel::all();
        $websitedata = WebsiteData::first();
        
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
        // dd($products);
        return view("frontend.index", compact("categories","products","carousel", "websitedata", "cart", "cartproducts", "cartItemCount","newarriveproducts","featureproducts","specialproducts","weeklyproducts","flashproducts"));
    }


    // account
    public function account(){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection

        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }

        return view("frontend.account", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }

    // about 
    public function about(){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
        return view("frontend.about", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }

    // Best Sale 
    public function bestSale(){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
        return view("frontend.bestSale", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }
 

    // checkout 
    public function checkout(Request $request){
        $websitedata = WebsiteData::first();
        $deliveryInfoId = $request->session()->get('delivery_information_id');
        $deliveryInformation = DeliveryInformation::where('id', $deliveryInfoId)->first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        $shippingCost = 0;
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
            $checkoutData = session()->get('checkout', [
                'shipping_cost' => 0
            ]);
            $shippingCost = $checkoutData['shipping_cost'];
        }
        return view("frontend.checkout", compact("websitedata", "cart", "cartproducts", "cartItemCount", "shippingCost", "deliveryInfoId", "deliveryInformation"));
    }

    // contact 
    public function contact(){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
        return view("frontend.contact", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }

    // dash-cancellation 
        public function dashCancellation(){
            $websitedata = WebsiteData::first();
            $cartItemCount = 0;
            $cartproducts = collect(); // Initialize as an empty collection
            if (auth('customer')->check()) {
                $customerId = auth('customer')->id();
                $cart = Cart::where('customer_id', $customerId)->first();
                
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
            }
            return  view("frontend.dash-cancellation", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
        }

    //  dash-my-order 
    public function dashMyOrder(){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
        return view("frontend.dash-my-order", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }

    // explore 
    public function explore(Request $request){
     
    $priceRange = $request->input('price_range');

    $productsQuery = Product::query();

    if ($priceRange) {
        switch ($priceRange) {
            case '500 to 1K':
                $productsQuery->whereBetween('sell_price', [500, 1000]);
                break;
            case '2K to 5K':
                $productsQuery->whereBetween('sell_price', [2000, 5000]);
                break;
            case '5K to 10K':
                $productsQuery->whereBetween('sell_price', [5000, 10000]);
                break;
            case '10K and Above':
                $productsQuery->where('sell_price', '>=', 10000);
                break;
            default:
                // Handle default case or no filtering
                break;
        }
    }

    // Fetch the filtered products
    $explores = $productsQuery->get();
    // $explores = Product::get();
    $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
        return view("frontend.explore", compact("websitedata", "cart", "cartproducts", "cartItemCount","explores"));
    }

    // lost-password 
    public function lostPassword(){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
        return view("frontend.lost-password", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }

    // newarrival
    public function newarrival(){
        // $newarriveproducts = Product::orderBy('created_at', 'desc')->limit(9)->get();
        $newarriveproducts = Product::limit(25)->get();
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
        return view("frontend.newarrival", compact("websitedata", "cart", "cartproducts","newarriveproducts", "cartItemCount"));
    }

    // product-detail 
    public function productDetails($product_code){
        $productDetails = Product::where('product_code', $product_code)->first();
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
        return view("frontend.product-detail", compact("websitedata","productDetails", "cart", "cartproducts", "cartItemCount"));
    }

    // shop list full 
    public function shopListFull(){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
        return view("frontend.shop-list-full", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }

    //  signin
    public function signin(){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
        return view("frontend.signin", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }

    // signup 
    public function signup(){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
        return view("frontend.signup", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }

    // whatsnew 
    public function whatsnew(){
        $newcategories = Product::select('category_id')->groupBy('category_id')->havingRaw('COUNT(*) > 5')->pluck('category_id');
        $whatsnewproducts = Product::whereNotNull('primary_image')->orderBy('created_at', 'desc')->limit(9)->get();
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                // Ensure $cart is not null before accessing its methods
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();

                // Ensure cartData is not empty
                if ($cartData->isNotEmpty()) {
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                }
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart

            if (!empty($cart)) {
                // Ensure array keys are valid product codes
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
        }
         return view("frontend.whatsnew", compact("websitedata", "cart", "cartproducts","newcategories","whatsnewproducts", "cartItemCount"));
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


    // filter price range wise 
//     public function filterProducts(Request $request)
// {

//     $priceRange = $request->input('price_range');

//     $productsQuery = Product::query();

//     if ($priceRange) {
//         switch ($priceRange) {
//             case '500 to 1K':
//                 $productsQuery->whereBetween('sell_price', [500, 1000]);
//                 break;
//             case '2K to 5K':
//                 $productsQuery->whereBetween('sell_price', [2000, 5000]);
//                 break;
//             case '5K to 10K':
//                 $productsQuery->whereBetween('sell_price', [5000, 10000]);
//                 break;
//             case '10K and Above':
//                 $productsQuery->where('sell_price', '>=', 10000);
//                 break;
//             default:
//                 // Handle default case or no filtering
//                 break;
//         }
//     }

//     // Fetch the filtered products
//     $explores = $productsQuery->get();

//     // Return a view or JSON response
//     return view('frontend.explore', ['explores' => $explores]);
// }


}
