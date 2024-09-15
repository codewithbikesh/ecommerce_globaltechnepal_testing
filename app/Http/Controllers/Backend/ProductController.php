<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    
    public function index()
    {
        $products = Product::all();
        return view('backend.products.index', compact('products'));
    } 
    
    public function view(Request $request)
    {    
        // Fetch the product using the 'product_code' column
        $product = Product::where('product_code', $request->input('product_code'))->first();
        if (!$product) {
            abort(404, 'Product not found');
        }

        return view('backend.products.view', compact('product'));
    } 

}
