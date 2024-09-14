<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\WebsiteData;
use App\Models\Product;
use App\Models\Shipping;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Province;
use App\Models\CustomerAddressBook;

class FrontendCartController extends Controller
{

    // cart
    public function cart()
    {
        $websitedata = WebsiteData::first();
        $provinces = Province::all()->pluck('province_name', 'id');
        $cartproducts = collect(); // Ensure $cartproducts is always a collection
        $selectedCity = null;
        $selectedProvince = null;
        $shippingCost = 0;
        $cartItemCount = 0;
        $isCartEmpty = true;
        $address = null; // Initialize address for both authenticated and guest users
        $provinceName = null; // Initialize provinceName
        $cityName = null; // Initialize cityName

        if (auth('customer')->check()) {
            // For authenticated users
            $customerId = auth('customer')->id();
            
            //For fetching address of auth users for cart page
            // Try to fetch the default billing address
            $address = CustomerAddressBook::where('customer_id', $customerId)
                ->where('default_billing', 'Y') // Fetch default billing address
                ->first();

            // If no default billing address found, fetch any available address
            if (!$address) {
                $address = CustomerAddressBook::where('customer_id', $customerId)
                    ->first();
            }

            // Default province and city ids
            $provinceId = $address ? $address->province_id : null;
            $cityId = $address ? $address->city_id : null;

            // Fetch province name
            $provinceName = null;
            if ($provinceId) {
                $province = Province::find($provinceId);
                $provinceName = $province ? $province->province_name : null;
            }

            // Fetch city name
            $cityName = null;
            if ($cityId) {
                $city = Shipping::find($cityId);
                $cityName = $city ? $city->city : null;
            }

            //For cart details
            $cart = Cart::where('customer_id', $customerId)->first();
            if ($cart) {

                $cartItemCount = $cart->items()->count();
                $isCartEmpty = $cartItemCount === 0;
                $shippingCost = $cart->shipping_cost;

                // Retrieve cart items
                $cartData = $cart->items()->get();
                $cartproducts = Product::whereIn('product_code', $cartData->pluck('product_code'))->get();
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

        return view("frontend.cart", compact("websitedata", "cart", "cartproducts", "cartItemCount", "shippingCost", "selectedCity", "selectedProvince", "isCartEmpty", "provinces", "address", "provinceName", "cityName"));
    }


    public function cart_shippingcost(Request $request)
    {
        $selectedCity = null;
        $selectedProvince = null;
        $shippingCost = 0;

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

            }

        return redirect()->route('frontend.cart')->with('success', 'Shipping cost calculated successfully!');
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
            $customer_user = Auth::user();

            // Find or create a cart for the user
            $cart = Cart::where('customer_id', $customerId)->first();

            if (!$cart) {
                $cart = Cart::create([
                    'customer_id' => $customerId,
                    'province_id' => null,
                    'city_id' => null,
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

            $this->updateCartShippingCost($cart);
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
        return redirect()->route('frontend.cart')->with('success', 'Item added to cart successfully!');
    }

    private function updateCartShippingCost($cart)
    {
        $customerId = $cart->customer_id;

        // Fetch the customer's address
        $address = CustomerAddressBook::where('customer_id', $customerId)
            ->where('default_billing', 'Y') // Assuming you have a way to determine the default address
            ->first();

        if ($address) {
            $cityId = $address->city_id;

            // Fetch the shipping cost based on the city_id
            $shippingSetting = Shipping::where('id', $cityId)->first();

            // Update the cart with the shipping cost if found
            if ($shippingSetting) {
                $cart->shipping_cost = $shippingSetting->shipping_cost;
                $cart->save();
            }
        }
    }


    private function updateCartTotals($cart)
    {
        $subtotal = $cart->items()->with('product')->get()->sum(function ($item) {
            return $item->quantity * $item->product->sell_price;
        });

        $numberOfItems = $cart->items()->count();
        $shippingCost = $cart->shipping_cost;
        $shippingcosttotal = $shippingCost * $numberOfItems;
        //$tax = $this->calculateTax($subtotal);
        $tax = 0;

        $user = auth('customer')->user();
        // Fetch the user's address
        $address = CustomerAddressBook::where('customer_id', $user->id)
            ->where('default_billing', 'Y') // Assuming you have a way to determine the default address
            ->first();

        // Default province and city ids
        $provinceId = null;
        $cityId = null;

        if ($address) {
            $provinceId = $address->province_id;
            $cityId = $address->city_id;
        }


        $cart->update([
            'subtotal' => $subtotal,
            'tax' => $tax,
            'shipping_cost_total' => $shippingcosttotal,
            'province_id' => $provinceId,
            'city_id' => $cityId,
        ]);
    }

    private function calculateSubtotal($items)
    {
        // Retrieve products and their sell prices
        $products = Product::whereIn('product_code', array_keys($items))->get();

        $subtotal = $products->sum(function ($product) use ($items) {
            return $product->sell_price * $items[$product->product_code];
        });

        return $subtotal;
    }

    private function calculateTax($subtotal)
    {
        // Example tax calculation (13% tax rate)
        return $subtotal;
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

        return redirect()->route('frontend.cart')->with('success', 'Item removed from cart!');
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

            return redirect()->back()->with('success', 'Item removed from cart successfully.');
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

            return redirect()->route('frontend.cart')->with('success', 'Cart updated successfully!');
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
                        'tax' => 0,
                        'shipping_cost_total' => 0
                    ]);
                }
            } else {
                // For guest users
                session()->forget('cart');
            }

            return redirect()->route('frontend.cart')->with('success', 'Cart has been cleared!');
        }
    }


    public function getCities($province_id)
    {
        // Check if the Shipping model is correctly set up
        try {
            $cities = Shipping::where('province_id', $province_id)
                ->pluck('city', 'id');
            return response()->json($cities);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Unable to fetch cities'], 500);
        }
    }

}
