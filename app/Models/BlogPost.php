<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BlogPost extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = ['category_id', 'user_id','title', 'thumbnail', 'body', 'tags', 'slug', 'status'];

    public function category(){
        return $this->belongsTo(BlogCategory::class, 'category_id', 'id');
    }


    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
