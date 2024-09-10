<?php
namespace App\Services;

use Illuminate\Support\Facades\Http;
use App\Models\Product;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ProductApiDataService
{
    public function fetchDataAndStore()
    {

        // Fetch the API URL from the database with a filter for api_name = 'P'
// Fetch API configuration for token generation
$authConfig = DB::table('api')
                ->where('api_name', 'P') // Assuming 'Auth' is the identifier for auth config
                ->first(['api_value as token_url', 'api_username', 'api_password', 'api_granttype']);

if (!$authConfig || !$authConfig->token_url || !$authConfig->api_username || !$authConfig->api_password || !$authConfig->api_granttype) {
    \Log::error('Auth credentials not found.');
    return;
}
//dd($authConfig);

// Generate the token
try {
// Generate the token
        $tokenResponse = Http::asForm()->post($authConfig->token_url, [
    'grant_type' => $authConfig->api_granttype,
    'username' => $authConfig->api_username,
    'password' => $authConfig->api_password
]);

//dd($tokenResponse);

if ($tokenResponse->failed()) {
    \Log::error('Token generation failed', ['status' => $tokenResponse->status(), 'body' => $tokenResponse->body()]);
    return;
}

$tokenData = $tokenResponse->json();
$accessToken = $tokenData['access_token'] ?? null;

if (!$accessToken) {
    \Log::error('Access token not found.');
    return;
}
} catch (\Exception $e) {
    Log::error('Exception occurred while generating token', ['error' => $e->getMessage()]);
    return;
}

// Fetch API configuration for product fetch
$apiConfig = DB::table('api')
                ->where('api_name', 'P') // Assuming 'P' is the identifier for product config
                ->first(['api_value as api_url']);

if (!$apiConfig || !$apiConfig->api_url) {
    \Log::error('API URL not found.');
    return;
}

try {
// Fetch products using the generated token
$response = Http::withHeaders([
    'Authorization' => 'Bearer ' . $accessToken
])->get($apiConfig->api_url);

if ($response->successful()) {
    $data = $response->json();

    // Check if 'data' key exists and is an array
    if (!isset($data['data']) || !is_array($data['data'])) {
        return;
    }

    foreach ($data['data'] as $item) {
        // Define default values if keys are missing or null
        $productData = [
            'product_code' => $item['sku'] ?? null,
            'product_name' => $item['productName'] ?? 'Unknown',
            'product_description' => $item['description'] ?? 'Unknown',
            'category_id' => $item['categoryCode'] ?? 'NoCategoryCode',
            'category_name' => $item['category'] ?? 'NoCategory',
            'subcategory_id' => $item['subCategoryCode'] ?? 'NoSubCategoryCode',
            'subcategory_name' => $item['subCategory'] ?? 'NoSubCategory',
            'delivery_target_days' => $item['deliveryTargetDays'] ?? 0,
            'discount' => $item['discount'] ?? 0,
            'actual_price' => $item['purchasePrice'] ?? 0,
            'sell_price' => $item['price'] ?? 0,
            'available_quantity' => $item['availableQty'] ?? null,
            'stock_quantity' => $item['stockQuantity'] ?? null,
            'brand_id' => $item['brandCode'] ?? null,
            'brand_name' => $item['brand'] ?? null
        ];

        try {
            Product::updateOrCreate(
                ['product_code' => $productData['product_code']],
                $productData
            );
        } catch (\Exception $e) {
            \Log::error('Error updating or creating product', ['error' => $e->getMessage(), 'item' => $item]);
        }
    }
} else {
    \Log::error('API request failed', ['status' => $response->status(), 'body' => $response->body()]);
}
} catch (\Exception $e) {
    Log::error('Exception occurred while fetching products', ['error' => $e->getMessage()]);
}




        // Fetch the API URL from the database with a filter for api_name = 'P'
        // $apiUrl = DB::table('api')
        //         ->where('api_name', 'P') // Filter based on api_name
        //         ->value('api_value');

        // if (!$apiUrl) {
        //     \Log::error('API URL not found.');
        //     return;
        // }

        // $response = Http::get($apiUrl);

        // if ($response->successful()) {
        //     $data = $response->json();

        //     // Check if 'data' key exists and is an array
        //     if ((!isset($data['data'])) || (!is_array($data['data']))) {
        //         return;
        //     }

        //     foreach ($data['data'] as $item) {

        //         // Define default values if keys are missing or null
        //         $productData = [
        //             'product_code' => $item['PCode'] ?? null,
        //             'product_name' => $item['PDesc'] ?? ('Unknown'),
        //             'category_id' => $item['GroupName'] ?? ('Uncategorised'),
        //             'actual_price' => $item['BuyRate'] ?? 0,
        //             'sell_price' => $item['SalesRate'] ?? 0,
        //             'stock_quantity' => $item['StockQty'] ?? null,
        //             'primary_image' => $item['PImage'] ?? null
        //         ];

        //         try {

        //             Product::updateOrCreate(
        //                 ['product_code' => $productData['product_code']],
        //                 $productData
        //             );
        //         } catch (\Exception $e) {
        //             \Log::error('Error updating or creating product', ['error' => $e->getMessage(), 'item' => $item]);
        //         }
        //     }
        // } else {
        //     \Log::error('API request failed', ['status' => $response->status(), 'body' => $response->body()]);
        // }








    }
}