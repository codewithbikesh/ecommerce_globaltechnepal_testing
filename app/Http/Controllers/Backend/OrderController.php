<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderItem;

class OrderController extends Controller
{
    
    public function index()
    {
        // Retrieve all orders
        $orders = Order::with('customer', 'deliveryInformation') // Eager load relationships
                        ->get()
                        ->map(function($order) {
                            // Count the total items in the order
                            $order->total_items = OrderItem::where('order_id', $order->order_id)->count();

                            return $order;
                        });
        return view('backend.orders.index', compact('orders'));
    }
    
    public function show($id)
    {
        // Fetch the order with all related details
        $order = Order::with('customer', 'deliveryInformation', 'orderItems.product')
        ->findOrFail($id);

        // Calculate total items and total amount
        $order->total_items = $order->orderItems->count();

        return view('backend.orders.view', compact('order'));
    }

}
