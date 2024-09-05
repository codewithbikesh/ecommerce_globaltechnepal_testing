<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\WebsiteData;
use App\Models\Carousel;

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

    public function carousel_data()
    {
        $carouseldata = Carousel::first();
        if (!$carouseldata) {
            $carouseldata = new Carousel();
        }
        return view('backend.website.carousel', compact('carouseldata'));
    }
    
    public function carousel_update(Request $request, $id)
    {    
        $carouseldata = Carousel::findOrFail($request->id);
        
        // Handle file uploads
        if ($request->hasFile('carousel_image_1')) {
            $image1 = $request->file('carousel_image_1');
            $image1Name = time() . '_image1.' . $image1->getClientOriginalExtension();
            $image1->move(public_path('storage/backend/carousel_images/'), $image1Name);
            $carouseldata->image_1 = $image1Name;
        } else {
            $carouseldata->image_1 = $carouseldata->getOriginal('image_1');
        }

        if ($request->hasFile('carousel_image_2')) {
            $image2 = $request->file('carousel_image_2');
            $image2Name = time() . '_image2.' . $image2->getClientOriginalExtension();
            $image2->move(public_path('storage/backend/carousel_images/'), $image2Name);
            $carouseldata->image_2 = $image2Name;
        } else {
            $carouseldata->image_2 = $carouseldata->getOriginal('image_2');
        }
        
        if ($request->hasFile('carousel_image_3')) {
            $image3 = $request->file('carousel_image_3');
            $image3Name = time() . '_image3.' . $image3->getClientOriginalExtension();
            $image3->move(public_path('storage/backend/carousel_images/'), $image3Name);
            $carouseldata->image_3 = $image3Name;
        } else {
            $carouseldata->image_3 = $carouseldata->getOriginal('image_3');
        }

        // Save the updated data
        $carouseldata->save();

        return redirect()->route('backend.website.carousel')->with('success', 'Carousel Images updated successfully');
    }

}
