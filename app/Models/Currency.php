<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'currency', 'digital_code', 'symbol'];

    public function products(){
        return $this->hasMany(Product::class, 'currency_id', 'id');
    }
}
