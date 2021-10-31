<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'line1', 'line2', 'line3', 'btn_text', 'btn_url', 'image', 'status'];
}
