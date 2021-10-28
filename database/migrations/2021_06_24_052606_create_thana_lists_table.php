<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateThanaListsTable extends Migration
{
    /**
     * Run the migrations.
     *'district_list_id', 'name'
     * @return void
     */
    public function up()
    {
        Schema::create('thana_lists', function (Blueprint $table) {
            $table->id();
            $table->integer('district_list_id');
            $table->string('name');
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
        Schema::dropIfExists('thana_lists');
    }
}
