<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;
    protected $table = 'customers'; // specify the correct table name
    protected $fillable = ['full_name', 'email', 'password', 'phone', 'province', 'city', 'street_address', 'postal_code'];
}
