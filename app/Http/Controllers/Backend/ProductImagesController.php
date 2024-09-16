<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Imports\ProductImagesImport;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\ProductImages;

class ProductImagesController extends Controller
{
    
    public function index()
    {
        return view('backend.uploadproductimages.index');
    }

    public function import_image(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,csv'
        ]);

        Excel::import(new ProductImagesImport, $request->file('file'));

        return redirect()->back()->with('success', 'Import successful!');
    }
}
