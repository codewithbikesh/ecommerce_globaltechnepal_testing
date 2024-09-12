<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\WebsiteData;
use App\Models\Cart;
use App\Models\Product;

class FrontendAccountController extends Controller
{
    
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

}
