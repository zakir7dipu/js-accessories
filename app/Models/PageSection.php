<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PageSection extends Model
{
    use HasFactory;

    protected $fillable = ['page_id', 'name', 'title', 'content', 'status'];

    public function page()
    {
        return $this->belongsTo(Pages::class, 'page_id', 'id');
    }
}
