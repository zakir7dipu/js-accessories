<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Supplier extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = ['company_name', 'email', 'phone', 'logo', 'url'];

    public function products()
    {
        return $this->belongsToMany(Product::class, 'product_supplier', 'supplier_id', 'product_id');
    }
}
