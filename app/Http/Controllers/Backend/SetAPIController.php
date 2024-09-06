<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SetAPI;

class SetAPIController extends Controller
{
    
    public function index()
    {
        $apis = SetAPI::all();
        return view('backend.setapi.index', compact('apis'));
    } 
    
    public function add()
    {
        return view('backend.setapi.add');
    }
    
    public function store(Request $request)
    {
        $request->validate([
            'api_name' => 'required',
            'api_value' => 'required'
        ]);
        $api = new SetAPI();
        $api->api_name = $request->api_name;
        $api->api_value = $request->api_value;
        $api->remarks = $request->remarks;
        if ($api->save()) {
            session()->flash('success', 'API Added Successfully.');
        } else {
            session()->flash('error', 'Error occured when adding API!');
        }
        return redirect()->route('backend.setapi.index');
    }
    
    public function edit(Request $request)
    {    
        $api = SetAPI::findOrFail($request->id);
        return view('backend.setapi.edit', compact('api'));
    } 
    
    public function update(Request $request, $id)
    {    
        $api = SetAPI::findOrFail($id);
        $api->update($request->all());
        return redirect()->route('backend.setapi.index')->with('success', 'API Details updated successfully');
    } 

    public function delete($id)
    {
        $api = SetAPI::findOrFail($id);
        $api->delete();
        return redirect()->route('backend.setapi.index')->with('success', 'API deleted successfully');
    }
}
