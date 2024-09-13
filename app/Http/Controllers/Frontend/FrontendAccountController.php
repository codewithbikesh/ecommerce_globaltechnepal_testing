<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\WebsiteData;
use App\Models\Cart;
use App\Models\Product;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Province;
use App\Models\Shipping;
use App\Models\CustomerAddressBook;

class FrontendAccountController extends Controller
{
    
    // account
    public function account(){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        $orderCount = 0;
        $cancelledCount = 0;

        if (auth('customer')->check()) {
            $customer_user = Auth::user();
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            $orderCount = Order::where('customer_id', $customerId)
                                           ->where('order_status', '!=', 'cancelled')
                                           ->count();
            $cancelledCount = Order::where('customer_id', $customerId)
                                           ->where('order_status', '=', 'cancelled')
                                           ->count();
                                           
            $order = Order::where('customer_id', $customerId)
                              ->orderBy('created_at', 'desc')
                              ->first(); // Get the most recent order
                              
            if ($order) {
                // Fetch the items associated with the recent order
                $orderItems = OrderItem::where('order_id', $order->order_id)
                                           ->with('product')
                                           ->get();
                    
            } else {
                $orderItems = []; // No items if no order found
            }   

            
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

        return view("frontend.account", compact("websitedata", "cart", "cartproducts", "cartItemCount", "orderCount", "cancelledCount", "order", "orderItems", "customer_user"));
    }


    
    //  dash-my-order 
    public function dashMyOrder(){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
        // Fetch all orders for the authenticated customer, including related orderItems and products
        $orders = Order::where('customer_id', $customerId)
                       ->with('orderItems.product') // Eager load orderItems and their products
                       ->orderBy('created_at', 'desc')
                       ->get();

        // if ($order) {
        //     $orderItems = $order->orderItems; // Access the order items
        // } else {
        //     $orderItems = collect(); // Empty collection if no order found
        // }
            
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
        return view("frontend.dash-my-order", compact("websitedata", "cart", "cartproducts", "cartItemCount", "orders"));
    }


    
    // address-book 
    public function address_book(){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customer_user = Auth::user();
            $addresses = $customer_user->addresses;
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
        return  view("frontend.address-book", compact("websitedata", "cart", "cartproducts", "cartItemCount", "addresses"));
    }

    
    
    // profile-edit
    public function profile_edit(){
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
        return  view("frontend.profile-edit", compact("websitedata", "cart", "cartproducts", "cartItemCount"));
    }
    
    // address-add page
    public function address_add(){
        $websitedata = WebsiteData::first();
        $provinces = Province::all()->pluck('province_name', 'id');
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
        return view("frontend.address-add", compact("websitedata", "cart", "cartproducts", "cartItemCount", "provinces"));
    }

    public function address_create(Request $request)
    {
        
        $customerId = auth('customer')->id();
        $request->validate([
            'full_name' => 'required',
            'phone' => 'required',
            'province' => 'required',
            'city' => 'required',
            'address' => 'required',
        ]);
        $addressbook = new CustomerAddressBook();
        $addressbook->customer_id = $customerId;
        $addressbook->full_name = $request->full_name;
        $addressbook->phone = $request->phone;
        $addressbook->province = $request->province;
        $addressbook->city = $request->city;
        $addressbook->landmark = $request->landmark;
        $addressbook->address = $request->address;
        $addressbook->address_type = $request->address_type;
        $default_shipping = $request->default_shipping;
        $default_billing = $request->default_billing;
        if ($default_shipping = "on"){
            $addressbook->default_shipping = 'Y';
        } else {
            $addressbook->default_shipping = 'N';
        }
        if ($default_billing = "on"){
            $addressbook->default_billing = 'Y';
        } else {
            $addressbook->default_billing = 'N';
        }

        if ($addressbook->save()) {
            session()->flash('success', 'Address have been successfully created.');
        } else {
            session()->flash('error', 'Error !');
        }
        return redirect()->route('frontend.address.book');
    }

    
    
    public function getCity($province_id)
    {
        // Check if the Shipping model is correctly set up
        try {
            $cities = Shipping::where('province', $province_id)
                              ->pluck('city', 'id');
            return response()->json($cities);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Unable to fetch cities'], 500);
        }
    }

}
