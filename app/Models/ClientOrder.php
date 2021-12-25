<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ClientOrder extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = ['user_id', 'invoice', 'price', 'discount', 'weight', 'shipping', 'shipping_status', 'payment', 'payment_trx', 'payment_status', 'order_status', 'accepted_by'];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function address()
    {
        return $this->hasOne(OrderShippingAddress::class, 'order_id', 'id');
    }

    public function product()
    {
        return $this->hasMany(OrderedProduct::class, 'order_id', 'id');
    }

    public function acceptedBy()
    {
        return $this->hasMany(AcceptedByAdmin::class, 'accepted_by', 'id');
    }
}
