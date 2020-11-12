<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description');
            $table->integer('category_id');
            $table->integer('parent_category_id');
            $table->string('brand');
            $table->integer('campaign_id')->nullable();
            $table->text('tags');
            $table->double('mrp');
            $table->double('selling_price');
            $table->string('sku');
            $table->boolean('track_inventory')->default(false);
            $table->boolean('stock')->default(false);
            $table->string('image');
            $table->string('size')->nullable();
            $table->text('color')->nullable();
            $table->integer('quantity');
            $table->integer('weight')->nullable();
            $table->boolean('feature')->default(false);
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
        Schema::dropIfExists('products');
    }
}
