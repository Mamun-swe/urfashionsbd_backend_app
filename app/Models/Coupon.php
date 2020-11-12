<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    public function discount($total){
        if ($this->type =='fixed'){
            return ($total->didcount_amount);
        }else if($this->type == 'percent'){
            return ($this->discount_percent / 100) * $total;
        }else
            return 0;
    }
}
