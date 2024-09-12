<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Province;

class ProvinceController extends Controller
{
    
    public function index()
    {
        $provinces = Province::all();
        return view('backend.provinces.index', compact('provinces'));
    } 
    
    public function add()
    {
        return view('backend.provinces.add');
    }
    
    public function store(Request $request)
    {
        $request->validate([
            'province_name' => 'required',
        ]);
        $province = new Province();
        $province->province_name = $request->province_name;
        if ($province->save()) {
            session()->flash('success', 'Province Added Successfully !');
        } else {
            session()->flash('error', 'Error occured while adding province!');
        }
        return redirect()->route('backend.provinces.index');
    }

    public function view(Request $request)
    {    
        $province = Province::findOrFail($request->id);
        return view('backend.provinces.view', compact('province'));
    } 

    public function edit(Request $request)
    {    
        $province = Province::findOrFail($request->id);
        return view('backend.provinces.edit', compact('province'));
    } 

    public function update(Request $request, $id)
    {    
        $province = Province::findOrFail($id);
        $province->update($request->all());
        return redirect()->route('backend.provinces.index')->with('success', 'Province Details updated successfully');
    } 
    
    public function delete($id)
    {
        $province = Province::findOrFail($id);
        $province->delete();
        return redirect()->route('backend.provinces.index')->with('success', 'Province deleted successfully');
    }
}
