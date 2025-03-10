<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('order_code');
            $table->integer('user_id')->nullable();
            $table->string('name');
            $table->string('phone');
            $table->double('total_price');
            $table->double('partial_payment')->nullable();
            $table->string('delivery_address');
            $table->double('delivery_charge');
            $table->string('shipping_area');
            $table->string('delivery_method');
            $table->string('coupon_code')->nullable();
            $table->double('discount')->nullable();
            $table->string('status')->default('pending');
            $table->longText('note')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
