<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Newsletter;
use Illuminate\Http\Request;

class NewsletterController extends Controller
{
    
    public function index()
    {
        $newsletters = Newsletter::all();
        return view('backend.newsletters.index', compact('newsletters'));
    } 
    
    public function view(Request $request)
    {    
        $newsletter = Newsletter::findOrFail($request->id);
        return view('backend.newsletters.view', compact('newsletter'));
    } 

    public function delete($id)
    {
        $newsletter = Newsletter::findOrFail($id);
        $newsletter->delete();
        return redirect()->route('backend.newsletters.index')->with('success', 'Newsletter Subscriber deleted successfully');
    }
}
