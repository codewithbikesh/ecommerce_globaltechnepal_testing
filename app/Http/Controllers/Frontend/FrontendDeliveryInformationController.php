<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DeliveryInformation;
use App\Models\Customer;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Cart;

class FrontendDeliveryInformationController extends Controller
{
    public function add_delivery_information(Request $request)
    {
        $defaultBilling = $request->input('default_billing');
        // Check if 'default_billing' is checked
        if ($defaultBilling === 'Y') {
            // Fetch customer data
            $customer = Customer::findOrFail(auth('customer')->id());

            // Create delivery information using customer data
            $deliveryInfo = DeliveryInformation::create([
                'customer_id' => auth('customer')->id(),
                'default_billing' => 'Y',
                'full_name' => $customer->full_name,
                'email' => $customer->email,
                'phone' => $customer->phone,
                'province' => $customer->province,
                'city' => $customer->city,
                'street_address' => $customer->street_address,
                'postal_code' => $customer->postal_code,
                'order_note' => $request->input('order_note', ''),
            ]);

        } else {
            // Validate the input
            $request->validate([
                'full_name' => 'required|string',
                'email' => 'required|string',
                'phone' => 'required|string',
                'province' => 'required|string',
                'city' => 'required|string',
                'street_address' => 'required|string',
                'postal_code' => 'nullable|string', // Make postal_code optional
                'order_note' => 'nullable|string',
            ]);

            // Save delivery information
            $deliveryInfo = DeliveryInformation::create([
                'customer_id' => auth('customer')->id(),
                'default_billing' => 'N',
                'full_name' => $request->input('full_name'),
                'email' => $request->input('email'),
                'phone' => $request->input('phone'),
                'province' => $request->input('province'),
                'city' => $request->input('city'),
                'street_address' => $request->input('street_address'),
                'postal_code' => $request->input('postal_code', ''),
                'order_note' => $request->input('order_note', ''),
            ]);
        }

        // Store the delivery information ID in the session
        $request->session()->put('delivery_information_id', $deliveryInfo->id);

        // Redirect or handle as needed
        return redirect()->route('frontend.checkout'); // Example route
    }

    
    public function create_order(Request $request)
    {
        // Validate that delivery information ID is present in the session
        $deliveryInformationId = $request->session()->get('delivery_information_id');
        if (!$deliveryInformationId) {
            return redirect()->route('frontend.checkout')->withErrors('Delivery information is required.');
        }

        // Fetch the cart for the authenticated user or session
        if (auth('customer')->check()) {
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
        } else {
            $cart = session()->get('cart', []);
        }

        if (!$cart) {
            return redirect()->route('frontend.checkout')->withErrors('Cart is empty.');
        }

        // Begin a transaction to ensure data consistency
        try {

            // Generate the current date    
            $prefix = '#ORD-';
            $timestamp = now()->format('Ymd');

            // Get the latest order based on the created_at date and the order_id
            $latestOrder = Order::whereDate('created_at', now()->toDateString())->latest('id')->first();

            // Determine the latest order ID or start from 0 if no orders exist
            if ($latestOrder) {
                // Extract the numeric part of the latest order ID
                $latestOrderId = intval(substr($latestOrder->order_id, -4));
            } else {
                // If no orders exist, start at 0
                $latestOrderId = 0;
            }

            // Increment the latest order ID to generate the new ID
            $newOrderIdNumeric = $latestOrderId + 1;

            // Format the new order ID with leading zeros
            $newOrderId = $prefix . $timestamp . '-' . str_pad($newOrderIdNumeric, 4, '0', STR_PAD_LEFT);

            $ordersubtotal = $cart->subtotal;
            $ordershippingcost = $cart->shipping_cost;
            $total_before_tax = $ordersubtotal + $ordershippingcost;
            $tax_amount = 13/100 * $total_before_tax;
            $total_amount = $tax_amount + $total_before_tax;

            // Create the order
            $order = Order::create([
                'order_id' => $newOrderId,
                'customer_id' => auth('customer')->check() ? $customerId : null,
                'delivery_information_id' => $deliveryInformationId,
                'payment_method' => $request->input('payment_method'),
                'subtotal' => $ordersubtotal,
                'tax' => $tax_amount,
                'shipping_cost' => $ordershippingcost,
                'total_amount' => $total_amount,
                'order_status' => 'Pending', 
                'payment_status' => 'Pending', 
            ]);

            // Retrieve cart items
            $cartItems = $cart->items; // If using Eloquent relationship, otherwise fetch manually

            foreach ($cartItems as $cartItem) {
                $order_id = $order->order_id;
                $product_code = $cartItem->product_code;
                $quantity = $cartItem->quantity;
                $price = $cartItem->price;
                $subtotal = $quantity * $price;
                // Create order items
                $orderitems = OrderItem::create([
                    'order_id' => $order_id,
                    'product_id' => $product_code,
                    'quantity' => $quantity,
                    'price' => $price,
                    'subtotal' => $subtotal
                ]);
                
            }

            // Clear the cart
            if (auth('customer')->check()) {
                $cart->update([
                    'subtotal' => 0,
                    'tax' => 0
                ]);
                $cart->items()->delete();
                $request->session()->forget('delivery_information_id');
            } else {
                session()->forget('cart'); // Clear session cart
                $request->session()->forget('delivery_information_id');
            }

            return redirect()->route('frontend.account')
                             ->with('success', 'Order placed successfully.');

        } catch (\Exception $e) {
            return redirect()->route('frontend.checkout')->withErrors('Failed to place the order. Please try again.');
        }
    }

}
