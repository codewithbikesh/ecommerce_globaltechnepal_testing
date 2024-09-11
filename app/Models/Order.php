<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $table = 'orders'; // specify the correct table name
    protected $fillable = ['order_id','customer_id', 'delivery_information_id', 'shipping_address', 'billing_address', 
                           'payment_method', 'shipping_method', 'subtotal', 'tax', 'shipping_cost', 'discount', 
                           'total_amount', 'order_status', 'payment_status'];
}
