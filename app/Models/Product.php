<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'name',
        'slug',
        'description',
        'category_id',
        'parent_category_id',
        'brand',
        'campaign_id',
        'mrp',
        'selling_price',
        'sku',
        'tags',
        'track_inventory',
        'stock',
        'quantity',
        'size',
        'color',
        'feature',
        'image',
    ];
}
