<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    public $fillable = ['category_id', 'name', 'description', 'currency_id', 'price', 'short_description', 'status', 'featured', 'new_arrival', 'popular', 'bestseller', 'trending', 'discount', 'slug', 'sku', 'unit_name', 'gross_weight', 'tags'];

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    public function currency(){
        return $this->belongsTo(Currency::class, 'currency_id', 'id');
    }

    public function suppliers()
    {
        return $this->belongsToMany(Supplier::class, 'product_supplier', 'product_id', 'supplier_id');
    }

    public function attributes()
    {
        return $this->belongsToMany(Attribute::class, 'attribute_product', 'product_id', 'attribute_id');
    }

    public function attributeItems()
    {
        return $this->hasMany(AttributeItem::class, 'product_id', 'id');
    }

    public function productImages()
    {
        return $this->hasMany(ProductImage::class, 'product_id', 'id');
    }

    public function orderedProduct()
    {
        return $this->hasMany(OrderedProduct::class, 'product_id', 'id');
    }
}
