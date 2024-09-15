<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $table = 'orders'; // specify the correct table name
    protected $fillable = ['order_id','customer_id', 'shipping_delivery_information_id', 'billing_delivery_information_id',
                           'payment_method', 'shipping_method', 'subtotal', 'tax', 'shipping_cost', 'discount', 
                           'total_amount', 'order_status', 'payment_status'];
    

    public function orderItems()
    {
        return $this->hasMany(OrderItem::class, 'order_id', 'order_id');
    }
    
    // Relationship with Customer
    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id', 'id');
    }

    // Relationship with DeliveryInformation
    public function deliveryInformation()
    {
        return $this->belongsTo(DeliveryInformation::class, 'delivery_information_id', 'id');
    }

}
