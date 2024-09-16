<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
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
                                           
        // Retrieve addresses with province and city relationships
        $addresses = $customer_user->addresses()
            ->with(['province', 'city'])
            ->get();

        // Fetch default shipping and billing addresses
        $defaultShippingAddress = $addresses->firstWhere('default_shipping', 'Y');
        $defaultBillingAddress = $addresses->firstWhere('default_billing', 'Y');
                                           
            $order = Order::where('customer_id', $customerId)
                              ->orderBy('created_at', 'desc')
                              ->first(); // Get the most recent order
                              
            if ($order) {
                // Fetch the items associated with the recent order
                $orderItems = OrderItem::where('order_id', $order->order_id)
                                           ->with('product.images')
                                           ->get();
                                           
                // Prepare each product with the path of the first image
                foreach ($orderItems as $item) {
                    $firstImage = $item->product->images->first();
                    $item->image_path = $firstImage ? asset($firstImage->image_path) : null; // Set image path or null if no image
                }
                    
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

        return view("frontend.account", compact("websitedata", "cart", "cartproducts", "cartItemCount", "orderCount", "cancelledCount", "order", "orderItems", "customer_user", "addresses", "defaultShippingAddress", "defaultBillingAddress"));
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
            $addresses = $customer_user->addresses()
                        ->with(['province', 'city'])
                        ->get();
                        
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
        $customer_user = Auth::user();
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
        return  view("frontend.profile-edit", compact("websitedata", "cart", "cartproducts", "cartItemCount", "customer_user"));
    }

    
    public function profile_update(Request $request)
    {
        
        // Get the authenticated user
        $customer_user = Auth::user();
        
        // Validate the input
        $request->validate([
            'full_name' => 'required|string',
            'phone' => 'required|string',
            'email' => [
                'required',
                'email',
                // Add a custom validation rule for email uniqueness
                Rule::unique('customers')->ignore($customer_user->id),
            ],
        ]);

        // Update user details
        $customer_user->full_name = $request->input('full_name');
        $customer_user->phone = $request->input('phone');
        $customer_user->email = $request->input('email');
        $customer_user->save();

        // Redirect with a success message
        return redirect()->route('frontend.account')->with('success', 'Profile updated successfully!');
    }

    
    // address-add page
    public function address_add(){
        $websitedata = WebsiteData::first();
        $customer_user = Auth::user();
        $provinces = Province::all()->pluck('province_name', 'id');
        $cartItemCount = 0;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            // Check if the user has any address with default_shipping or default_billing set to 'Y'
            $user = auth('customer')->user();
            $hasDefaultAddress = $user->addresses()->where(function($query) {
                $query->where('default_shipping', 'Y')
                    ->orWhere('default_billing', 'Y');
            })->exists();

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
        return view("frontend.address-add", compact("websitedata", "cart", "cartproducts", "cartItemCount", "provinces", "hasDefaultAddress", "customer_user"))->with('success', 'Address added successfully.');
        
    }

    
    // address-edit
    public function address_edit($id){
        $websitedata = WebsiteData::first();
        $cartItemCount = 0;
        $selectedCity = null;
        $selectedProvince = null;
        $cartproducts = collect(); // Initialize as an empty collection
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $address = CustomerAddressBook::with(['province', 'city'])->findOrFail($id);
            $provinces = Province::pluck('province_name', 'id');
            $selectedCity = $address->city_id;
            $selectedProvince = $address->province_id;

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
        return  view("frontend.address-edit", compact("websitedata", "cart", "cartproducts", "cartItemCount", "address", "provinces", "selectedCity", "selectedProvince"));
    }

    public function address_update(Request $request, $id)
    {
        $request->validate([
            'full_name' => 'required',
            'phone' => 'required',
            'province' => 'required',
            'city' => 'required',
            'address' => 'required',
        ]);

        $address = CustomerAddressBook::findOrFail($id);
        $provinceId = $request->input('province');
        $cityId = $request->input('city');

        $address->update([
            'full_name' => $request->input('full_name'),
            'phone' => $request->input('phone'),
            'province_id' => $provinceId, // Set the province_id
            'city_id' => $cityId, // Set the city_id
            'address' => $request->input('address'),
            'landmark' => $request->input('landmark'),
            'address_type' => $request->input('address_type'),
        ]);

        // $address->update($request->all());

        return redirect()->route('frontend.address.book')->with('success', 'Address updated successfully');
    }
    
    public function setDefaultShipping($id)
    {
        // Set the current address as default shipping
        CustomerAddressBook::where('default_shipping', 'Y')->update(['default_shipping' => null]);
        $address = CustomerAddressBook::find($id);
        if ($address) {
            $address->default_shipping = 'Y';
            $address->save();
        }
        
        return redirect()->back()->with('success', 'Default shipping address updated successfully.');
    }

    public function setDefaultBilling($id)
    {
        // Set the current address as default billing
        CustomerAddressBook::where('default_billing', 'Y')->update(['default_billing' => null]);
        $address = CustomerAddressBook::find($id);
        if ($address) {
            $address->default_billing = 'Y';
            $address->save();
        }
        
        return redirect()->back()->with('success', 'Default billing address updated successfully.');
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
        $addressbook->province_id = $request->province;
        $addressbook->city_id = $request->city;
        $addressbook->landmark = $request->landmark;
        $addressbook->address = $request->address;
        $addressbook->address_type = $request->address_type;
        $addressbook->default_shipping = $request->default_shipping;
        $addressbook->default_billing = $request->default_billing;

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
            
        // Ensure $province_id is valid
        if (!is_numeric($province_id)) {
            throw new \Exception("Invalid province ID.");
        }

            $cities = Shipping::where('province_id', $province_id)
                              ->pluck('city', 'id');

            return response()->json($cities);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Unable to fetch cities'], 500);
        }
    }

}
