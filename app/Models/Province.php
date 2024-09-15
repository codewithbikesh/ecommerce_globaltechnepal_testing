<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Province extends Model
{
    use HasFactory;
    protected $table = 'provinces'; // specify the correct table name
    protected $fillable = ['province_name'];

    
    public function addresses()
    {
        return $this->hasMany(CustomerAddressBook::class, 'province_id', 'id'); // Adjust according to actual column names
    }
    
    // Define relationship with City
    public function cities()
    {
        return $this->hasMany(Shipping::class);
    }

}
