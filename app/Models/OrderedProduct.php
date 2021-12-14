<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderedProduct extends Model
{
    use HasFactory;

    public $fillablev = ['product_id', 'order_id', 'specification', 'qty', 'price_qty', 'discount'];

    public function order()
    {
        return $this->belongsTo(ClientOrder::class, 'order_id', 'id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
}
