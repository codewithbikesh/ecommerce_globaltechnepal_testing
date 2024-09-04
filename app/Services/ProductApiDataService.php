<?php
namespace App\Services;

use Illuminate\Support\Facades\Http;
use App\Models\Product;

class ProductApiDataService
{
    public function fetchDataAndStore()
    {
        $response = Http::get('https://myomsapi.globaltechsolution.com.np/api/MasterList/productlist?DbName=erpdemo101');

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