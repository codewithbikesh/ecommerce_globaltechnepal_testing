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
        $inquiries = Inquiry::all();
        return view('backend.inquiries.index', compact('inquiries'));
    } 
    
    
    public function view(Request $request)
    {    
        $inquiry = Inquiry::findOrFail($request->id);
        return view('backend.inquiries.view', compact('inquiry'));
    } 

    public function delete($id)
    {
        $inquiry = Inquiry::findOrFail($id);
        $inquiry->delete();
        return redirect()->route('backend.inquiries.index')->with('success', 'Inquiry deleted successfully');
    }

}
