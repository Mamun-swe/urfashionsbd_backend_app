<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = ['parent_id', 'name', 'image'];

    public function products(){
        return $this->hasMany('App\Models\Product');
    }
}