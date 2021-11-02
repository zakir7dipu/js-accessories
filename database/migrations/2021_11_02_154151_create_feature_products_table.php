<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFeatureProductsTable extends Migration
{
    /**
     * Run the migrations.
     *'', ''
     * @return void
     */
    public function up()
    {
        Schema::create('feature_products', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->boolean('show')->default(true);
            $table->integer('number_of_content')->default(6);
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
        Schema::dropIfExists('feature_products');
    }
}
