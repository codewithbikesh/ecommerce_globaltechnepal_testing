<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\WebsiteData;
use App\Models\Product;

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
        // Validate request
        $validatedData = $request->validate([
            'product_id' => 'required|integer|exists:products,id',
            'quantity' => 'required|integer|min:1',
        ]);

        // Retrieve cart from session
        $cart = session()->get('cart', []);

        // Add or update item in cart
        $productId = $validatedData['product_id'];
        $quantity = $validatedData['quantity'];

        if (isset($cart[$productId])) {
            $cart[$productId] += $quantity;
        } else {
            $cart[$productId] = $quantity;
        }

        // Save cart back to session
        session()->put('cart', $cart);

        return redirect()->route('frontend.cart')->with('status', 'Item added to cart!');
    }

    public function removeItem(Request $request)
    {
        // Validate request
        $validatedData = $request->validate([
            'product_id' => 'required|integer|exists:products,id',
        ]);

        // Retrieve cart from session
        $cart = session()->get('cart', []);

        // Remove item from cart
        $productId = $validatedData['product_id'];
        if (isset($cart[$productId])) {
            unset($cart[$productId]);
        }

        // Save cart back to session
        session()->put('cart', $cart);

        return redirect()->route('frontend.cart')->with('status', 'Item removed from cart!');
    }

    public function update(Request $request)
    {
        // Check if the remove_product button was clicked
        if ($request->has('remove_product')) {
            // Get the product code of the item to be removed
            $productCode = $request->input('remove_product');

            // Retrieve the current cart from session or database
            $cart = session()->get('cart', []);

            // Check if the product exists in the cart
            if (isset($cart[$productCode])) {
                // Remove the product from the cart
                unset($cart[$productCode]);

                // Update the session or database with the new cart
                session()->put('cart', $cart);

                // Optionally, flash a message to the user
                return redirect()->back()->with('success', 'Product removed from cart successfully.');
            }
        }

        // If no remove_product button is clicked, handle the cart update logic here
        if ($request->has('quantities')) {
            // Validate quantities
            $validatedData = $request->validate([
                'quantities.*' => 'required|integer|min:1',
            ]);

            // Retrieve cart from session
            $cart = session()->get('cart', []);

            // Update cart quantities
            foreach ($validatedData['quantities'] as $productId => $quantity) {
                if (isset($cart[$productId])) {
                    $cart[$productId] = $quantity;
                    // Remove item if quantity is zero or less
                    if ($quantity <= 0) {
                        unset($cart[$productId]);
                    }
                }
            }

            // Save cart back to session
            session()->put('cart', $cart);

            return redirect()->route('frontend.cart')->with('status', 'Cart updated successfully!');
        }
    }

    public function clear()
    {
        // Remove cart from session
        session()->forget('cart');
    
        return redirect()->route('frontend.cart')->with('status', 'Cart has been cleared!');
    }


}
