<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\WebsiteData;
use App\Models\Cart;
use App\Models\Product;
use App\Models\Order;
use App\Models\OrderItem;

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

        return view("frontend.account", compact("websitedata", "cart", "cartproducts", "cartItemCount", "orderCount", "cancelledCount", "order", "orderItems"));
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


}
