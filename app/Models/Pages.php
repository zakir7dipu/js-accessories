<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pages extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'status'];

    public function sections()
    {
        return $this->hasMany(PageSection::class, 'page_id', 'id');
    }
}
