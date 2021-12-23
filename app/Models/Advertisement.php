<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Advertisement extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = ['title', 'line1', 'line2', 'line3', 'btn_text', 'btn_url', 'image', 'status'];
}
