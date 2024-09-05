<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\ProductApiDataService;

class LoadProductsAPIController extends Controller
{
    
    protected $productApiDataService;

    public function __construct(ProductApiDataService $productApiDataService)
    {
        $this->productApiDataService = $productApiDataService;
    }

    public function index()
    {
        $this->productApiDataService->fetchDataAndStore();
        return redirect()->route('backend.products.index')->with('success', 'Products Fetched successfully');
    } 
}
