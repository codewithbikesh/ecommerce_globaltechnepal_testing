<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DeliveryInformation;

class FrontendDeliveryInformationController extends Controller
{
    public function add_delivery_information(Request $request)
    {
        // Validate the input
        $request->validate([
            'full_name' => 'required|string',
            'email' => 'required|string',
            'phone' => 'required|string',
            'province' => 'required|string',
            'city' => 'required|string',
            'street_address' => 'required|string'
        ]);

        // Save delivery information
        $deliveryInfo = DeliveryInformation::create([
            'customer_id' => auth('customer')->id(), // if applicable
            'full_name' => $request->input('full_name'),
            'email' => $request->input('email'),
            'phone' => $request->input('phone'),
            'province' => $request->input('province'),
            'city' => $request->input('city'),
            'street_address' => $request->input('street_address'),
            'postal_code' => $request->input('postal_code'),
            'order_note' => $request->input('order_note'),
        ]);

        // Store the delivery information ID in the session or pass it directly to the next step
        $request->session()->put('delivery_information_id', $deliveryInfo->id);

        // Redirect or handle as needed
        return redirect()->route('frontend.checkout'); // Example route
    }
}
