<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table = 'products'; // specify the correct table name
    protected $fillable = ['product_code','product_name', 'product_description', 'category_id', 'category_name', 'subcategory_id', 
                            'subcategory_name', 'delivery_target_days', 'discount', 'actual_price', 
                            'sell_price', 'available_quantity', 'stock_quantity', 'brand_id', 
                            'brand_name'];
                            
    // Define the relationship with ProductImages
    public function images()
    {
        return $this->hasMany(ProductImages::class, 'product_code', 'product_code');
    }
}
