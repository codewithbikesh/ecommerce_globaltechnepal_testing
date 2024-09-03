<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
        // Specify the table name
        protected $table = 'contact';

        // If you want to specify the primary key (optional, if it's not 'id')
        protected $primaryKey = 'id';
    
        // If your primary key is not an integer or you want to disable auto-incrementing
        public $incrementing = true;
    
        // If you don't have created_at and updated_at timestamps
        public $timestamps = true;
    
        // Specify fillable attributes if you are using mass assignment
        protected $fillable = ['name', 'email', 'phone', 'message'];
}
