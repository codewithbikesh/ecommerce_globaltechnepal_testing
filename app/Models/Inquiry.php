<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Inquiry extends Model
{
    use HasFactory;
    protected $table = 'inquiries'; // specify the correct table name
    protected $fillable = ['name', 'email', 'subject', 'message'];
}
