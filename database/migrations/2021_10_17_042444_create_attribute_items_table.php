<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAttributeItemsTable extends Migration
{
    /**
     * Run the migrations.
     *'attribute_id', 'product_id', 'name', 'details'
     * @return void
     */
    public function up()
    {
        Schema::create('attribute_items', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('attribute_id');
            $table->bigInteger('product_id');
            $table->string('name');
            $table->longText('image')->nullable();
            $table->string('details')->nullable()->comment('as like #000000 or S,M,XL or 32, 34, 36 or 3\' by 5\' etc');
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
        Schema::dropIfExists('attribute_items');
    }
}
