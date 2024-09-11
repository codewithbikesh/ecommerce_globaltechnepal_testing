<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryInformation extends Model
{
    use HasFactory;
    protected $table = 'delivery_information'; // Specify the correct table name
    protected $fillable = [
        'customer_id', 'full_name', 'email', 'phone', 'province', 'city', 'street_address', 'postal_code', 'order_note'
    ];
}
