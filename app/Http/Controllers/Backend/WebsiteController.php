<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\WebsiteData;

class WebsiteController extends Controller
{
    
    public function data()
    {
        $websitedata = WebsiteData::first();
        if (!$websitedata) {
            $websitedata = new WebsiteData();
        }
        return view('backend.website.setting', compact('websitedata'));
    }
    
    public function update(Request $request, $id)
    {    
        $websitedata = WebsiteData::findOrFail($request->id);
        
        // Update the fields
        $websitedata->company_name = $request->input('company_name');
        $websitedata->primary_email = $request->input('primary_email');
        $websitedata->secondary_email = $request->input('secondary_email');
        $websitedata->primary_phone = $request->input('primary_phone');
        $websitedata->secondary_phone = $request->input('secondary_phone');
        $websitedata->address = $request->input('address');
        $websitedata->website_link = $request->input('website_link');

        // Handle file uploads
        if ($request->hasFile('company_logo_header')) {
            $headerLogo = $request->file('company_logo_header');
            $headerLogoName = time() . '_header.' . $headerLogo->getClientOriginalExtension();
            $headerLogo->move(public_path('storage/backend/company_logo/'), $headerLogoName);
            $websitedata->company_logo_header = $headerLogoName;
        } else {
            $websitedata->company_logo_footer = $websitedata->getOriginal('company_logo_header');
        }

        if ($request->hasFile('company_logo_footer')) {
            $footerLogo = $request->file('company_logo_footer');
            $footerLogoName = time() . '_footer.' . $footerLogo->getClientOriginalExtension();
            $footerLogo->move(public_path('storage/backend/company_logo/'), $footerLogoName);
            $websitedata->company_logo_footer = $footerLogoName;
        } else {
            $websitedata->company_logo_footer = $websitedata->getOriginal('company_logo_footer');
        }

        // Save the updated data
        $websitedata->save();

        return redirect()->route('backend.website.setting')->with('success', 'Website Data updated successfully');
    }

}
