<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Inquiry;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class InquiryController extends Controller
{
    
    public function index()
    {
        $contacts = Inquiry::all();
        return view('backend.inquiries.index', compact('contacts'));
    } 
    
    
    public function view(Request $request)
    {    
        $contact = Inquiry::findOrFail($request->id);
        return view('backend.inquiries.view', compact('contact'));
    } 
    
    public function edit(Request $request)
    {    
        $contact = Inquiry::findOrFail($request->id);
        return view('backend.inquiries.edit', compact('contact'));
    } 

    public function update(Request $request, $id)
    {    
        $contact = Inquiry::findOrFail($id);
        $contact->update($request->all());
        return redirect()->route('backend.inquiries.index')->with('success', 'Inquiries updated successfully');
    } 

    public function delete($id)
    {
        $inquiry = Inquiry::findOrFail($id);
        $inquiry->delete();
        return redirect()->route('backend.inquiries.index')->with('success', 'Inquiry deleted successfully');
    }

}
