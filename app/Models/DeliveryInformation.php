<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryInformation extends Model
{
    use HasFactory;
    protected $table = 'delivery_information'; // Specify the correct table name
    protected $fillable = [
        'customer_id', 'order_id', 'full_name', 'invoice_email', 'phone', 'province_id', 'city_id', 'address', 'landmark', 'address_type', 'type'
    ];

    
    // Relationship with Order
    public function orders()
    {
        return $this->hasMany(Order::class);
    }
    
    public function province()
    {
        return $this->belongsTo(Province::class);
    }

    public function city()
    {
        return $this->belongsTo(Shipping::class);
    }
}
