<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerAddressBook extends Model
{
    use HasFactory;
    protected $table = 'customer_address_book'; // Specify the correct table name
    protected $fillable = [
        'customer_id','full_name', 'phone', 'province', 'city', 'address', 'landmark', 'address_type', 'default_shipping', 'default_billing'
    ];
}
