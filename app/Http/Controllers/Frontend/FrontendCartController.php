<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\WebsiteData;
use App\Models\Product;
use App\Models\Shipping;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Province;

class FrontendCartController extends Controller
{
    
    // cart
    public function cart()
    {
        $websitedata = WebsiteData::first();
        $provinces = Province::all()->pluck('province_name', 'id');
        $selectedCity = null;
        $selectedProvince = null;
        $shippingCost = 0;
        $cartItemCount = 0;
        $isCartEmpty = true;
    
        if (auth('customer')->check()) {
            // For authenticated users
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($cart) {
                
            $cartItemCount = $cart->items()->count();
            $isCartEmpty = $cartItemCount === 0;
                
                // Get city, province, and shipping cost from the cart
                $selectedCity = $cart->city;
                $selectedProvince = $cart->province;
                $shippingCost = $cart->shipping_cost;
            
                // Retrieve cart items
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
            } else {
                // Default values if no cart is found
                $selectedCity = null;
                $selectedProvince = null;
                $shippingCostValue = 0;
                $cartproducts = collect(); // Ensure $cartproducts is always a collection
            }
        } else {
            // For guest users
            $cart = session()->get('cart', []);
            $cartItemCount = count($cart); // Count items in the guest cart
            $isCartEmpty = $cartItemCount === 0;
            $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
            $cartData = [];
            $checkoutData = session()->get('checkout', [
                'city' => null,
                'province' => null,
                'shipping_cost' => 0
            ]);
            $selectedCity = $checkoutData['city'];
            $selectedProvince = $checkoutData['province'];
            $shippingCost = $checkoutData['shipping_cost'];
    
        }
    
        return view("frontend.cart", compact("websitedata", "cart", "cartproducts", "cartItemCount", "shippingCost", "selectedCity", "selectedProvince", "isCartEmpty", "provinces"));
    }
    

    public function cart_shippingcost(Request $request)
    {
        $selectedCity = null;
        $selectedProvince = null;
        $shippingCost = 0;
        
        if (auth('customer')->check()) {
                
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            if ($request->has('getshippingcost')) {
                $request->validate([
                    'province' => 'required',
                    'city' => 'required'
                ]);
    
                $selectedCity = $request->input('city');
                $selectedProvince = $request->input('province');
    
                // Fetch shipping cost for the city
                $shippingData = Shipping::where('id', $selectedCity)->first();
                $shippingCost = $shippingData ? $shippingData->shipping_cost : 0;
                
                // Ensure shipping cost is a float
                $shippingCostValue = (float) $shippingCost;
    
                // Update the cart with city and province if needed
                $cart->update([
                    'province' => $selectedProvince,
                    'city' => $selectedCity,
                    'shipping_cost' => $shippingCostValue
                ]);

            }
            
        } else {
            // For guest users
    
            if ($request->has('getshippingcost')) {
                $request->validate([
                    'province' => 'required',
                    'city' => 'required'
                ]);
    
                $selectedCity = $request->input('city');
                $selectedProvince = $request->input('province');
                $shippingCost = Shipping::where('id', $selectedCity)->first();

                session()->put('checkout', [
                    'city' => $selectedCity,
                    'province' => $selectedProvince,
                    'shipping_cost' => $shippingCost
                ]);

            } else {
                $selectedCity = null;
                $selectedProvince = null;
                $shippingCost = 0;
            }
        }
    
        return redirect()->route('frontend.cart')->with('status', 'Shipping cost calculated successfully!');
        // return view("frontend.cart", compact("websitedata", "cart", "cartproducts", "cartItemCount", "shippingCost", "selectedCity", "selectedProvince", "isCartEmpty"));
    }


    
    public function addItem(Request $request)
    {
        $validatedData = $request->validate([
            'product_code' => 'required|integer|exists:products,product_code',
            'quantity' => 'required|integer|min:1',
        ]);

        $productId = $validatedData['product_code'];
        $quantity = $validatedData['quantity'];

    // Retrieve the product and its price
    $product = Product::where('product_code', $productId)->firstOrFail();
    $price = $product->sell_price;
        
    if (auth('customer')->check()) {
        // User is authenticated
        $customerId = auth('customer')->id();
        
        // Find or create a cart for the user
        $cart = Cart::where('customer_id', $customerId)->first();

        if (!$cart) {
            $cart = Cart::create([
                'customer_id' => $customerId,
                'province' => null,
                'city' => null,
                'tax' => 0, // Set default or calculated tax
                'shipping_cost' => 0, // Set default or calculated shipping cost
                'subtotal' => 0, // Set default or calculated subtotal
            ]);
        }

        // Find or create a cart item
        $cartItem = $cart->items()->where('product_code', $productId)->first();

        if ($cartItem) {
            // Update quantity if item already exists in the cart
            $cartItem->quantity += $quantity;
            $cartItem->price = $cartItem->quantity * $price;
            $cartItem->save();
        } else {
            // Add new item to the cart
            $cart->items()->create([
                'product_code' => $productId,
                'quantity' => $quantity,
                'price' => $price,
                'cart_id' => $cart->id // Save the cart_id
            ]);
        }

        // Update cart subtotal and save changes
        $this->updateCartTotals($cart);
        
    } else {

        $cart = session()->get('cart', []);
        if (isset($cart[$productId])) {
            $cart[$productId] += $quantity;
        } else {
            $cart[$productId] = $quantity;
        }

        session()->put('cart', $cart);
    }
        return redirect()->route('frontend.cart')->with('status', 'Item added to cart!');
    }



    private function updateCartTotals($cart)
    {
        $subtotal = $cart->items()->with('product')->get()->sum(function($item) {
            return $item->quantity * $item->product->sell_price;
        });
    
        $tax = $this->calculateTax($subtotal);
    
        $cart->update([
            'subtotal' => $subtotal,
            'tax' => $tax,
        ]);
    }

    private function calculateSubtotal($items)
    {
        // Retrieve products and their sell prices
        $products = Product::whereIn('product_code', array_keys($items))->get();
        
        $subtotal = $products->sum(function($product) use ($items) {
            return $product->sell_price * $items[$product->product_code];
        });
    
        return $subtotal;
    }

    private function calculateTax($subtotal)
    {
        // Example tax calculation (13% tax rate)
        return $subtotal * 0.13;
    }






    public function removeItem(Request $request)
    {
        $validatedData = $request->validate([
            'product_code' => 'required|integer|exists:products,product_code',
        ]);

        $productId = $validatedData['product_code'];
        
        if (auth('customer')->check()) {
            // For authenticated users
            $cart = Cart::where('customer_id', auth('customer')->id())->first();
            if ($cart) {
                $cartItem = $cart->items()->where('product_code', $productId)->first();
                if ($cartItem) {
                    $cartItem->delete();
                    
                    // Optionally update cart totals after removal
                    $this->updateCartTotals($cart);
                }
            }
        } else {
            // For guest users
            $cart = session()->get('cart', []);
            if (isset($cart[$productId])) {
                unset($cart[$productId]);
                session()->put('cart', $cart);
            }
        }

        return redirect()->route('frontend.cart')->with('status', 'Item removed from cart!');
    }


    public function update(Request $request)
    {
        // Handle removal of a product
        if ($request->has('remove_product')) {
            $productCode = $request->input('remove_product');
            
            if (auth('customer')->check()) {
                // For authenticated users
                $cart = Cart::where('customer_id', auth('customer')->id())->first();
                if ($cart) {
                    $cartItem = $cart->items()->where('product_code', $productCode)->first();
                    if ($cartItem) {
                        $cartItem->delete();
                        
                        // Optionally update cart totals after removal
                        $this->updateCartTotals($cart);
                    }
                }
            } else {
                // For guest users
                $cart = session()->get('cart', []);
                if (isset($cart[$productCode])) {
                    unset($cart[$productCode]);
                    session()->put('cart', $cart);
                }
            }
            
            return redirect()->back()->with('success', 'Product removed from cart successfully.');
        }
    
        // Handle cart update
        if ($request->has('update_cart')) {
            $validatedData = $request->validate([
                'quantities.*' => 'required|integer|min:1',
            ]);
    
            if (auth('customer')->check()) {
                // For authenticated users
                $cart = Cart::where('customer_id', auth('customer')->id())->first();
                if ($cart) {
                    foreach ($validatedData['quantities'] as $productCode => $quantity) {
                        $cartItem = $cart->items()->where('product_code', $productCode)->first();
                        if ($cartItem) {
                            if ($quantity <= 0) {
                                $cartItem->delete();
                            } else {
                                $cartItem->quantity = $quantity;
                                $cartItem->save();
                            }
                        } else if ($quantity > 0) {
                            $cart->items()->create([
                                'product_code' => $productCode,
                                'quantity' => $quantity,
                                'price' => Product::where('product_code', $productCode)->value('sell_price')
                            ]);
                        }
                    }
                    
                    // Update cart totals
                    $this->updateCartTotals($cart);
                }
            } else {
                // For guest users
                $cart = session()->get('cart', []);
                foreach ($validatedData['quantities'] as $productCode => $quantity) {
                    if ($quantity <= 0) {
                        unset($cart[$productCode]);
                    } else {
                        $cart[$productCode] = $quantity;
                    }
                }
                session()->put('cart', $cart);
            }
    
            return redirect()->route('frontend.cart')->with('status', 'Cart updated successfully!');
        }
    
        // Handle clearing the cart
        if ($request->has('clear_cart')) {
            if (auth('customer')->check()) {
                // For authenticated users
                $cart = Cart::where('customer_id', auth('customer')->id())->first();
                if ($cart) {
                    $cart->items()->delete(); // Delete all cart items
                    $cart->update([
                        'subtotal' => 0,
                        'tax' => 0
                    ]);
                }
            } else {
                // For guest users
                session()->forget('cart');
            }
    
            return redirect()->route('frontend.cart')->with('status', 'Cart has been cleared!');
        }
    }
    
    
    public function getCities($province_id)
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
