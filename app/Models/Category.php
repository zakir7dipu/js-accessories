<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    public $fillable = ['parent_id', 'name', 'icon', 'slug', 'status'];

    public function childCategory()
    {
        return $this->hasMany(Category::class, 'parent_id','id');
    }

    public function parentCategory()
    {
        return $this->belongsTo(Category::class, 'parent_id','id');
    }

    public function products()
    {
        return $this->hasMany(Product::class, 'category_id', 'id');
    }
}
