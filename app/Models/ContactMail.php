<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ContactMail extends Model
{
    protected $fillable = [
        'name','email','phone','subject','message'
    ];
}
