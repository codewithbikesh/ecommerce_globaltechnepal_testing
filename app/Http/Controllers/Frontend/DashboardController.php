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
use App\Models\CustomerAddressBook;
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
        $products = Product::paginate(25);
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
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        }
        // dd($products);
        return view("frontend.index", compact("categories","products","carousel", "websitedata", "cart", "cartproducts", "cartItemCount","newarriveproducts","featureproducts","specialproducts","weeklyproducts","flashproducts"));
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
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
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
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        }
        return view("frontend.bestSale", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }
 

    // checkout 
    public function checkout(Request $request){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $shippingCost = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        $default_shipping_addresses = collect(); // Initialize as an empty collection
        $default_billing_addresses = collect();
        $deliveryInformation = null; // Initialize as null
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            // Fetch all addresses for the authenticated customer where default_shipping = 'Y'
            $default_shipping_addresses = CustomerAddressBook::where('customer_id', $customerId)
                                                         ->where('default_shipping', 'Y')
                                                         ->with(['province', 'city']) // Eager load the province and city relationships
                                                         ->first();
                                                         
            // If no default shipping address found, fetch any available address
            if (!$default_shipping_addresses) {
                $default_shipping_addresses = CustomerAddressBook::where('customer_id', $customerId)
                                            ->with(['province', 'city']) // Eager load the province and city relationships
                                            ->first();
            }

            // Fetch all addresses for the authenticated customer where default_billing = 'Y'
            $default_billing_addresses = CustomerAddressBook::where('customer_id', $customerId)
                                                         ->where('default_billing', 'Y')
                                                         ->with(['province', 'city']) // Eager load the province and city relationships
                                                         ->first();
                                                         
            // If no default shipping address found, fetch any available address
            if (!$default_billing_addresses) {
                $default_billing_addresses = CustomerAddressBook::where('customer_id', $customerId)
                                            ->with(['province', 'city']) // Eager load the province and city relationships
                                            ->first();
            }

            $cart = Cart::where('customer_id', $customerId)->first();
            if ($cart) {
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
            
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            $checkoutData = session()->get('checkout', [
                'shipping_cost' => 0
            ]);
            $shippingCost = $checkoutData['shipping_cost'];
            $deliveryInformationId = $request->session()->get('delivery_information_id');
            if ($deliveryInformationId) {
                $deliveryInformation = DeliveryInformation::find($deliveryInformationId);
            }
            
        }
        // Return the checkout view with necessary data
        return view("frontend.checkout", [
            "websitedata" => $websitedata,
            "cart" => $cart ?? null,
            "cartproducts" => $cartproducts,
            "cartItemCount" => $cartItemCount,
            "shippingCost" => $shippingCost,
            "deliveryInformation" => $deliveryInformation,
            "default_shipping_addresses" => $default_shipping_addresses,
            "default_billing_addresses" => $default_billing_addresses
        ]);
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
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
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
                    $cartItemCount = $cart->items()->count();
                    $cartData = $cart->items()->get();
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                } else {
                    // Handle the case where no cart is found
                    $cartData = collect(); // Empty collection
                }
            } else {
                $cart = session()->get('cart', []);
                $cartItemCount = count($cart); // Count items in the guest cart
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
            return  view("frontend.dash-cancellation", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
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

    
    $categories = Product::distinct()->pluck('category_id');
            // dd($categories);
  // Fetch the filtered products
  $explores = $productsQuery->paginate(25);
    // $explores = Product::get();
    $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            if ($cart) {
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        }
        return view("frontend.explore", compact("websitedata", "cart", "cartproducts", "cartItemCount","explores","categories"));
    }

    public function filexplore(Request $request){
     
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
    
        
        $categories = Product::distinct()->pluck('category_id');
        // dd($categories);
      // Fetch the filtered products
        $explores = $productsQuery->get();
        // $explores = Product::get();
        $websitedata = WebsiteData::first();
            $cartItemCount = 0;
            if (auth('customer')->check()) {
                $customerId = auth('customer')->id();
                $cart = Cart::where('customer_id', $customerId)->first();
                if ($cart) {
                    $cartItemCount = $cart->items()->count();
                    $cartData = $cart->items()->get();
                    $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
                } else {
                    // Handle the case where no cart is found
                    $cartData = collect(); // Empty collection
                }
            } else {
                $cart = session()->get('cart', []);
                $cartItemCount = count($cart); // Count items in the guest cart
                $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            }
            return view("frontend._explore", compact("websitedata", "cart", "cartproducts", "cartItemCount","explores","categories"));
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
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        }
        return view("frontend.lost-password", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }

    // newarrival
    public function newarrival(){
        // $newarriveproducts = Product::orderBy('created_at', 'desc')->limit(9)->get();
        $newarriveproducts = Product::paginate(25);
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            if ($cart) {
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
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
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        }
        return view("frontend.product-detail", compact("websitedata","productDetails", "cart", "cartproducts", "cartItemCount"));
    }

    // shop list full 
    public function shopListFull(Request $request){
        $shoplistproducts = Product::latest();
        if(!empty($request->get('keyword'))){
            $keyword = $request->get('keyword');
            $shoplistproducts = $shoplistproducts->where('product_name','like','%'.$keyword.'%')
            ->orWhere('category_id','like','%'.$keyword.'%');
        }
        $categoryId = $request->category_id;
        $categories = Product::distinct()->pluck('category_id',$categoryId);
        $shoplistproducts = $shoplistproducts->paginate(25);
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            if ($cart) {
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        }
        return view("frontend.shop-list-full", compact("websitedata", "cart", "cartproducts", "cartItemCount","shoplistproducts","categories"));
    }

    //  partials products filter by category wise 
    //  partials products filter by category wise 
    public function filterProducts(Request $request)
    {
        $categoryId = $request->category_id;

        // Fetch products that belong to the selected category
        $shoplistproducts = Product::where('category_id', $categoryId)->get();

        // Return the filtered products as HTML
        return view('frontend.filtered-products', compact('shoplistproducts'))->render();
    }
     
    // partials products filter by price range wise 
    // partials products filter by price range wise 
    public function filterProductsByPrice(Request $request)
    {
        $minPrice = $request->input('min_price');
        $maxPrice = $request->input('max_price');

        // Validate price range
        if ($minPrice === null) $minPrice = 0;
        if ($maxPrice === null) $maxPrice = PHP_INT_MAX;

        // Fetch products within the price range
        $shoplistproducts = Product::whereBetween('sell_price', [$minPrice, $maxPrice])->get();

        // Return the filtered products as HTML
        return view('frontend.filtered-products', compact('shoplistproducts'))->render();
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
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
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
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
            $cartItemCount = $cart->items()->count();
            $cartData = $cart->items()->get();
            $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        }
        return view("frontend.signup", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }

    // whatsnew 
    public function whatsnew(){
        $newcategories = Product::select('category_id')->groupBy('category_id')->havingRaw('COUNT(*) > 5')->pluck('category_id');
        $whatsnewproducts = Product::whereNotNull('primary_image')->orderBy('created_at', 'desc')->paginate(25);
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            if ($cart) {
                $cartItemCount = $cart->items()->count();
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Handle the case where no cart is found
                $cartData = collect(); // Empty collection
            }
        } else {
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        }
         return view("frontend.whatsnew", compact("websitedata", "cart", "cartproducts","newcategories","whatsnewproducts", "cartItemCount"));
    }

    
    public function newsletter_store(Request $request)
    {
        $request->validate([
            'email' => 'required',
            'gender' => 'required'
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
        ]);
        $customer = new Customer();
        $customer->full_name = $request->full_name;
        $customer->email = $request->email;
        $customer->phone = $request->phone;
        $customer->password = Hash::make($request->password);
        if ($customer->save()) {
            session()->flash('success', 'Your Account have been successfully created.');
        } else {
            session()->flash('error', 'Error while creating account!');
        }
        return redirect()->route('frontend.signin');
    }
}
