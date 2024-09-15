<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shipping extends Model
{
    use HasFactory;
    protected $table = 'set_shipping'; // specify the correct table name
    protected $fillable = ['province_id', 'city', 'shipping_cost', 'remarks'];

    
    public function addresses()
    {
        return $this->hasMany(CustomerAddressBook::class, 'city_id', 'id'); // Adjust according to actual column names
    }
    
    // Define inverse relationship with Province
    public function province()
    {
        return $this->belongsTo(Province::class);
    }

}
