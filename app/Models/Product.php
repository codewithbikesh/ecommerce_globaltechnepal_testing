<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table = 'products'; // specify the correct table name
    protected $fillable = ['product_code','product_name', 'category_id', 'actual_price', 'sell_price', 
                            'stock_quantity', 'primary_image'];
}
