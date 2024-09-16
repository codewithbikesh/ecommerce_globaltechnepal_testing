<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductImages extends Model
{
    use HasFactory;
    protected $table = 'product_images'; // specify the correct table name
    protected $fillable = ['product_code', 'image_path'];
    
    // If 'product_code' is a foreign key in ProductImages
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_code', 'product_code');
    }

}
