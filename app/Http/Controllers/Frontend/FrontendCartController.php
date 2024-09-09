<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\WebsiteData;
use App\Models\Product;
use App\Models\Shipping;

class FrontendCartController extends Controller
{
    
    // cart
    public function cart(){
        $websitedata = WebsiteData::first();
        $cart = session()->get('cart', []);
        $cartproducts = Product::whereIn('product_code', array_keys($cart))->get();
        return view("frontend.cart", compact("websitedata", "cart", "cartproducts"));
    }
    
    public function addItem(Request $request)
    {
        $validatedData = $request->validate([
            'product_code' => 'required|integer|exists:products,product_code',
            'quantity' => 'required|integer|min:1',
        ]);

        $cart = session()->get('cart', []);

        $productId = $validatedData['product_code'];
        $quantity = $validatedData['quantity'];

        if (isset($cart[$productId])) {
            $cart[$productId] += $quantity;
        } else {
            $cart[$productId] = $quantity;
        }

        session()->put('cart', $cart);
        return redirect()->route('frontend.cart')->with('status', 'Item added to cart!');
    }

    public function removeItem(Request $request)
    {
        $validatedData = $request->validate([
            'product_code' => 'required|integer|exists:products,product_code',
        ]);
        $cart = session()->get('cart', []);

        $productId = $validatedData['product_code'];
        if (isset($cart[$productId])) {
            unset($cart[$productId]);
        }

        session()->put('cart', $cart);
        return redirect()->route('frontend.cart')->with('status', 'Item removed from cart!');
    }

    public function update(Request $request)
    {
        if ($request->has('remove_product')) {
            $productCode = $request->input('remove_product');
            $cart = session()->get('cart', []);
            if (isset($cart[$productCode])) {
                unset($cart[$productCode]);
                session()->put('cart', $cart);
                return redirect()->back()->with('success', 'Product removed from cart successfully.');
            }
        }
        

        if ($request->has('update_cart')) {
            $validatedData = $request->validate([
                'quantities.*' => 'required|integer|min:1',
            ]);
            $cart = session()->get('cart', []);

            foreach ($validatedData['quantities'] as $productId => $quantity) {
                if (isset($cart[$productId])) {
                    $cart[$productId] = $quantity;
                    if ($quantity <= 0) {
                        unset($cart[$productId]);
                    }
                }
            }
            session()->put('cart', $cart);
            return redirect()->route('frontend.cart')->with('status', 'Cart updated successfully!');
        }
        
        if ($request->has('clear_cart')) {
            session()->forget('cart');
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
