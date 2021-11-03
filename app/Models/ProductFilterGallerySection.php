<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductFilterGallerySection extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'show', 'number_of_content'];
}
