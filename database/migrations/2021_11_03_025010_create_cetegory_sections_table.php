<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCetegorySectionsTable extends Migration
{
    /**
     * Run the migrations.
     *'show', 'number_of_content'
     * @return void
     */
    public function up()
    {
        Schema::create('cetegory_sections', function (Blueprint $table) {
            $table->id();
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
        Schema::dropIfExists('cetegory_sections');
    }
}
