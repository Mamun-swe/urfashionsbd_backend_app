<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = [
        'order_code',
        'user_id',
        'name',
        'phone',
        'total_price',
        'partial_payment',
        'delivery_address',
        'delivery_charge',
        'shipping_area',
        'delivery_method',
        'coupon_code',
        'discount',
        'status',
    ];
}
