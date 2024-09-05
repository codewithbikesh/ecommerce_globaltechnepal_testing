<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Newsletter extends Model
{
    use HasFactory;
    protected $table = 'newsletter_subscribers_list'; // specify the correct table name
    protected $fillable = ['gender', 'email'];
}
