<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryInformation extends Model
{
    use HasFactory;
    protected $table = 'delivery_information'; // Specify the correct table name
    protected $fillable = [
        'customer_id', 'order_id', 'full_name', 'email', 'phone', 'province', 'city', 'address', 'land_mark', 'address_type', 'default_shipping', 'default_billing'
    ];

    
    // Relationship with Order
    public function orders()
    {
        return $this->hasMany(Order::class);
    }
    
}
