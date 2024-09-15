<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DeliveryInformation;
use App\Models\Customer;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Cart;
use App\Models\CustomerAddressBook;

class FrontendDeliveryInformationController extends Controller
{
    public function add_delivery_information(Request $request)
    {
            // Save delivery information
            $deliveryInfo = DeliveryInformation::create([
                'order_id' => null,
                'customer_id' => null,
                'full_name' => $request->input('full_name'),
                'invoice_email' => $request->input('email'),
                'phone' => $request->input('phone'),
                'province_id' => $request->input('province'),
                'city_id' => $request->input('city'),
                'landmark' => $request->input('landmark'),
                'address' => $request->input('street_address'),
                'type' => 'shipping'
            ]);

            $selectedCity = $request->input('city');
            $selectedProvince = $request->input('province');
            $shippingCost = Shipping::where('id', $selectedCity)->first();

            session()->put('checkout', [
                'city' => $selectedCity,
                'province' => $selectedProvince,
                'shipping_cost' => $shippingCost
            ]);

        // Store the delivery information ID in the session
        $request->session()->put('delivery_information_id', $deliveryInfo->id);

        // Redirect or handle as needed
        return redirect()->route('frontend.checkout')->with('success', 'Shipping Address set successfully.'); // Example route
    }

    
    public function create_order(Request $request)
    {

        // Fetch the cart for the authenticated user or session
        if (auth('customer')->check()) {
            $order_id = null;
            $customerId = auth('customer')->id();
            $cart = Cart::where('customer_id', $customerId)->first();
            
            // Fetch customer data
            $customer = Customer::findOrFail(auth('customer')->id());
            // Fetch addresses from customer address book
            $addresses = CustomerAddressBook::where('customer_id', $customer->id)->get();

            // Extract the required addresses
            $billingAddress = $addresses->firstWhere('default_billing', 'Y');
            if (!$billingAddress) {
                $billingAddress = $addresses->first();
            }

            $shippingAddress = $addresses->firstWhere('default_shipping', 'Y');
            if (!$shippingAddress) {
                $shippingAddress = $addresses->first();
            }

            // Create delivery information using customer data
            if ($billingAddress) {
            $billingdeliveryInfo = DeliveryInformation::create([
                'order_id' => $order_id,
                'customer_id' => auth('customer')->id(),
                'full_name' => $billingAddress->full_name,
                'invoice_email' => $customer->email,
                'phone' => $billingAddress->phone,
                'province_id' => $billingAddress->province_id,
                'city_id' => $billingAddress->city_id,
                'address' => $billingAddress->address,
                'landmark' => $billingAddress->landmark,
                'address_type' => $billingAddress->address_type,
                'type' => 'billing',
            ]);
            }
            
            // Create delivery information using customer data
            if ($shippingAddress) {
                $shippingdeliveryInfo = DeliveryInformation::create([
                    'order_id' => $order_id,
                    'customer_id' => auth('customer')->id(),
                    'full_name' => $shippingAddress->full_name,
                    'invoice_email' => $customer->email,
                    'phone' => $shippingAddress->phone,
                    'province_id' => $shippingAddress->province_id,
                    'city_id' => $shippingAddress->city_id,
                    'address' => $shippingAddress->address,
                    'landmark' => $shippingAddress->landmark,
                    'address_type' => $shippingAddress->address_type,
                    'type' => 'shipping',
                ]);
            }
            
            // Store the delivery information ID in the session
            $request->session()->put('shipping_delivery_information_id', $shippingdeliveryInfo->id);
            $request->session()->put('billing_delivery_information_id', $billingdeliveryInfo->id);

            // Validate that delivery information ID is present in the session
            $shippingdeliveryInformationId = $request->session()->get('shipping_delivery_information_id');
            $billingdeliveryInformationId = $request->session()->get('billing_delivery_information_id');
            if (!$shippingdeliveryInformationId) {
                return redirect()->route('frontend.checkout')->with('error','Shipping information is required.');
            }
            if (!$billingdeliveryInformationId) {
                return redirect()->route('frontend.checkout')->with('error','Billing information is required.');
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
                $ordershippingcost = $cart->shipping_cost_total;
                $total_before_tax = $ordersubtotal + $ordershippingcost;
                //$tax_amount = 13/100 * $total_before_tax;
                $tax_amount = 0;
                $total_amount = $tax_amount + $total_before_tax;

                // Create the order
                $order = Order::create([
                    'order_id' => $newOrderId,
                    'customer_id' => auth('customer')->check() ? $customerId : null,
                    'shipping_delivery_information_id' => $shippingdeliveryInformationId,
                    'billing_delivery_information_id' => $billingdeliveryInformationId,
                    'payment_method' => $request->input('payment_method'),
                    'subtotal' => $ordersubtotal,
                    'tax' => $tax_amount,
                    'shipping_cost' => $ordershippingcost,
                    'total_amount' => $total_amount,
                    'order_status' => 'Processing', 
                    'payment_status' => 'Pending', 
                ]);

                // Update the delivery information records with the order ID
                DeliveryInformation::where('id', $shippingdeliveryInformationId)->update([
                    'order_id' => $order->order_id,
                ]);

                DeliveryInformation::where('id', $billingdeliveryInformationId)->update([
                    'order_id' => $order->order_id,
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
                        'tax' => 0,
                        'shipping_cost_total' => 0
                    ]);
                    $cart->items()->delete();
                    $request->session()->forget('shipping_delivery_information_id');
                    $request->session()->forget('billing_delivery_information_id');
                } else {
                    session()->forget('cart'); // Clear session cart
                    $request->session()->forget('delivery_information_id');
                }

                return redirect()->route('frontend.account')
                             ->with('success', 'Order placed successfully.');

            } catch (\Exception $e) {
                return redirect()->route('frontend.checkout')->with('error','Failed to place the order. Please try again.');
            }

        } else {
            $cart = session()->get('cart', []);

            // session()->forget('cart'); // Clear session cart
            // $request->session()->forget('delivery_information_id');
            
            return redirect()->route('frontend.index')
            ->with('success', 'Order placed successfully.');
        }

    }

}
