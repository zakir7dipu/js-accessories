<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BlogCategory extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'status'];

    public function posts(){
        return $this->hasMany(BlogPost::class, 'category_id', 'id');
    }
}
