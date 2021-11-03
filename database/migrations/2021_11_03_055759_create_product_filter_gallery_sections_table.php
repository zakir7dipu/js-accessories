<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductFilterGallerySectionsTable extends Migration
{
    /**
     * Run the migrations.
     *'title', 'show', 'number_of_content'
     * @return void
     */
    public function up()
    {
        Schema::create('product_filter_gallery_sections', function (Blueprint $table) {
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
        Schema::dropIfExists('product_filter_gallery_sections');
    }
}
