<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'name',
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
        'weight',
        'size',
        'color',
        'feature',
        'image',
    ];
}
