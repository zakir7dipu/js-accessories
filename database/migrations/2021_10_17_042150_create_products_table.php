<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *'category_id', 'name', 'description', 'currency', 'price', 'short_description', 'status', 'featured', 'new_arrival', 'popular', 'bestseller', 'trending', 'discount', 'slug'
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('category_id')->nullable();
            $table->string('name',100);
            $table->longText('description');
            $table->integer('currency_id');
            $table->double('price');
            $table->string('short_description',250);
            $table->string('discount')->nullable()->comment('at %');
            $table->string('slug');
            $table->string('sku');
            $table->string('unit_name')->default('pcs');
            $table->string('gross_weight')->nullable();
            $table->longText('tags')->nullable();
            $table->boolean('status')->default(true)->comment('0 = deactivated, 1 = activated');
            $table->boolean('featured')->default(true)->comment('0 = deactivated, 1 = activated');
            $table->boolean('new_arrival')->default(true)->comment('0 = deactivated, 1 = activated');
            $table->boolean('popular')->default(true)->comment('0 = deactivated, 1 = activated');
            $table->boolean('bestseller')->default(true)->comment('0 = deactivated, 1 = activated');
            $table->boolean('trending')->default(true)->comment('0 = deactivated, 1 = activated');
            $table->softDeletes();
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
