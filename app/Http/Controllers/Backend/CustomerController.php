<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customer;

class CustomerController extends Controller
{
    
    public function index()
    {
        $customers = Customer::all();
        return view('backend.customers.index', compact('customers'));
    } 
}
