<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostOfficeListsTable extends Migration
{
    /**
     * Run the migrations.
     *'district_list_id', 'name', 'post_code'
     * @return void
     */
    public function up()
    {
        Schema::create('post_office_lists', function (Blueprint $table) {
            $table->id();
            $table->integer('district_list_id');
            $table->string('name');
            $table->string('post_code');
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
        Schema::dropIfExists('post_office_lists');
    }
}
