<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInfoSectionsTable extends Migration
{
    /**
     * Run the migrations.
     *'title', 'sub_title', 'description', 'icon'
     * @return void
     */
    public function up()
    {
        Schema::create('info_sections', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('sub_title');
            $table->string('description');
            $table->longText('icon')->nullable();
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
        Schema::dropIfExists('info_sections');
    }
}
