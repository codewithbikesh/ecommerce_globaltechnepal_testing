<?php
namespace App\Services;

use Illuminate\Support\Facades\Http;
use App\Models\Product;
use Illuminate\Support\Facades\DB;

class ProductApiDataService
{
    public function fetchDataAndStore()
    {
        // Fetch the API URL from the database with a filter for api_name = 'P'
        $apiUrl = DB::table('api')
                ->where('api_name', 'P') // Filter based on api_name
                ->value('api_value');

        if (!$apiUrl) {
            \Log::error('API URL not found in configuration for api_name = P.');
            return;
        }

        $response = Http::get($apiUrl);

        if ($response->successful()) {
            $data = $response->json();

            // Check if 'data' key exists and is an array
            if ((!isset($data['data'])) || (!is_array($data['data']))) {
                return;
            }

            foreach ($data['data'] as $item) {

                // Define default values if keys are missing or null
                $productData = [
                    'product_code' => $item['PCode'] ?? null,
                    'product_name' => $item['PDesc'] ?? ('Unknown'),
                    'category_id' => $item['GroupName'] ?? ('Uncategorised'),
                    'actual_price' => $item['BuyRate'] ?? 0,
                    'sell_price' => $item['SalesRate'] ?? 0,
                    'stock_quantity' => $item['StockQty'] ?? null,
                    'primary_image' => $item['PImage'] ?? null
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
    }
}