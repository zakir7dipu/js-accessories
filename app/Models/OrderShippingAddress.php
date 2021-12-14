<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderShippingAddress extends Model
{
    use HasFactory;

    protected $fillable = ['order_id', 'name', 'company', 'street_address', 'police_station', 'state', 'postal_code', 'country', 'phone'];

    public function order()
    {
        return $this->belongsTo(ClientOrder::class, 'order_id', 'id');
    }
}
