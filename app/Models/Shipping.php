<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shipping extends Model
{
    use HasFactory;
    protected $table = 'set_shipping'; // specify the correct table name
    protected $fillable = ['province', 'city', 'shipping_cost', 'remarks'];
}
