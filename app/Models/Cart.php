<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;
    protected $table = 'cart';
    protected $fillable = ['customer_id', 'province', 'city', 'session_id', 'tax', 'shipping_cost', 'subtotal', 'status'];

    public function items()
    {
        return $this->hasMany(CartItem::class);
    }
}
