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

        // Fetch API configuration for token generation
        $authConfig = DB::table('api')
            ->where('api_name', 'T') // Assuming 'P' is the identifier for auth config
            ->first(['api_value as token_url', 'api_username', 'api_password', 'api_granttype']);

        if (!$authConfig || !$authConfig->token_url || !$authConfig->api_username || !$authConfig->api_password || !$authConfig->api_granttype) {
            Log::error('Auth credentials not found.');
            return;
        }

        // Generate the token
        try {
            $tokenResponse = Http::asForm()->post($authConfig->token_url, [
                'username' => $authConfig->api_username,
                'password' => $authConfig->api_password,
                'grant_type' => $authConfig->api_granttype
            ]);

            // Log the response status and body for debugging
            Log::info('Token Response Status: ' . $tokenResponse->status());
            Log::info('Token Response Body: ' . $tokenResponse->body());

            if ($tokenResponse->failed()) {
                Log::error('Token generation failed', [
                    'status' => $tokenResponse->status(),
                    'body' => $tokenResponse->body()
                ]);
                return;
            }

            $tokenData = $tokenResponse->json();

            if (isset($tokenData['access_token'])) {
                $accessToken = $tokenData['access_token'];
            } else {
                Log::error('Access token not found in response.', ['response' => $tokenData]);
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
            Log::error('API URL not found.');
            return;
        }

        // Fetch products using the generated token
        try {
            $response = Http::withHeaders([
                'Authorization' => 'Bearer ' . $accessToken
            ])->get($apiConfig->api_url);

            // Log the response status and body for debugging
            Log::info('Product API Response Status: ' . $response->status());
            Log::info('Product API Response Body: ' . $response->body());

            if ($response->failed()) {
                Log::error('API request failed', [
                    'status' => $response->status(),
                    'body' => $response->body()
                ]);
                return;
            }

            $data = $response->json();

            // Check for JSON decoding errors
            if (json_last_error() !== JSON_ERROR_NONE) {
                Log::error('JSON decoding error', [
                    'error' => json_last_error_msg(),
                    'body' => $response->body()
                ]);
                return;
            }

            // Ensure 'data' key exists and is an array
            if (!isset($data['data']) || !is_array($data['data'])) {
                Log::error('Invalid data format', ['response' => $data]);
                return;
            }

            foreach ($data['data'] as $item) {
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
                    Log::error('Error updating or creating product', ['error' => $e->getMessage(), 'item' => $item]);
                }
            }
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching products', ['error' => $e->getMessage()]);
        }

    }
}