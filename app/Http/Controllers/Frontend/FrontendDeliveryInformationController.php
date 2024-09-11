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

            // Create the order
            $order = Order::create([
                'customer_id' => auth('customer')->check() ? $customerId : null,
                'delivery_information_id' => $deliveryInformationId,
                'payment_method' => $request->input('payment_method'),
                'subtotal' => $cart->subtotal,
                'tax' => $cart->tax,
                'shipping_cost' => $cart->shipping_cost,
                'order_status' => 'Pending', 
                'payment_status' => 'Pending', 
            ]);

            // Retrieve cart items
            $cartItems = $cart->items; // If using Eloquent relationship, otherwise fetch manually

            foreach ($cartItems as $cartItem) {
                // Create order items
                $orderitems = OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $cartItem->product_code,
                    'quantity' => $cartItem->quantity,
                    'price' => $cartItem->price, // Assuming you store price in cart item
                ]);
                
            }

            // Clear the cart
            if (auth('customer')->check()) {
                $cart->delete(); // Delete cart if using database
            } else {
                session()->forget('cart'); // Clear session cart
            }

            return redirect()->route('frontend.account')
                             ->with('success', 'Order placed successfully.');

        } catch (\Exception $e) {
            // Rollback the transaction on error
            \DB::rollback();
            return redirect()->route('frontend.checkout')->withErrors('Failed to place the order. Please try again.');
        }
    }

}
