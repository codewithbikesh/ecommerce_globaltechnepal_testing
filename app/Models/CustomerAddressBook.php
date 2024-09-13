<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerAddressBook extends Model
{
    use HasFactory;
    protected $table = 'customer_address_book'; // Specify the correct table name
    protected $fillable = [
        'customer_id','full_name', 'phone', 'province_id', 'city_id', 'address', 'landmark', 'address_type', 'default_shipping', 'default_billing'
    ];

    
    public function province()
    {
        return $this->belongsTo(Province::class, 'province_id', 'id'); // Adjust according to actual column names
    }

    public function city()
    {
        return $this->belongsTo(Shipping::class, 'city_id', 'id'); // Adjust according to actual column names
    }

}
