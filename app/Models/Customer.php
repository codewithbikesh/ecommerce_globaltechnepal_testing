<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Customer extends Authenticatable
{
    use HasFactory;

    protected $table = 'customers'; // Specify the correct table name
    protected $fillable = [
        'full_name', 'email', 'password', 'phone'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    
    // Relationship with Order
    public function orders()
    {
        return $this->hasMany(Order::class);
    }
    
}
