<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Shipping;
use App\Models\Province;

class ShippingController extends Controller
{
    
    public function index()
    {
        $provinces = Province::all()->pluck('province_name', 'id'); 
        $shippings = Shipping::all();
        return view('backend.setshipping.index', compact('shippings', "provinces"));
    } 
    
    public function add()
    {
        $provinces = Province::all();
        return view('backend.setshipping.add', compact('provinces'));
    }
    
    public function view(Request $request)
    {    
        $provinces = Province::all()->pluck('province_name', 'id'); 
        $shipping = Shipping::findOrFail($request->id);
        return view('backend.setshipping.view', compact('shipping', "provinces"));
    } 
    
    public function store(Request $request)
    {
        $request->validate([
            'province' => 'required',
            'city' => 'required',
            'shipping_cost' => 'required'
        ]);
        $shipping = new Shipping();
        $shipping->province = $request->province;
        $shipping->city = $request->city;
        $shipping->shipping_cost = $request->shipping_cost;
        $shipping->remarks= $request->remarks;
        if ($shipping->save()) {
            session()->flash('success', 'Shipping cost Added Successfully !');
        } else {
            session()->flash('error', 'Error occured while adding shipping cost!');
        }
        return redirect()->route('backend.setshipping.index')->with('success', 'Shipping Cost added successfully');
    }
    
    public function edit(Request $request)
    {    
        $provinces = Province::all()->pluck('province_name', 'id');
        $shipping = Shipping::findOrFail($request->id);
        return view('backend.setshipping.edit', compact('shipping', 'provinces'));
    } 
    
    public function update(Request $request, $id)
    {    
        $shipping = Shipping::findOrFail($id);
        $shipping->update($request->all());
        return redirect()->route('backend.setshipping.index')->with('success', 'Shipping Cost updated successfully');
    } 

    public function delete($id)
    {
        $shipping = Shipping::findOrFail($id);
        $shipping->delete();
        return redirect()->route('backend.setshipping.index')->with('success', 'Shipping Cost deleted successfully');
    }

}
