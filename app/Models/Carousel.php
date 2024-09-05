<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Carousel extends Model
{
    use HasFactory;
    protected $table = 'carousel_images'; // specify the correct table name
    protected $fillable = ['image_1', 'image_2', 'image_3'];
}
