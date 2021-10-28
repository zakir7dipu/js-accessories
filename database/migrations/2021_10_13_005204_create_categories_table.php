<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *'parent_id', 'name', 'icon', 'slug', 'status'
     * @return void
     */
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('parent_id')->nullable()->comment('if this column is null means this row is a main category, and not null mean sub-category of pro category');
            $table->string('name',200);
            $table->longText('icon')->nullable();
            $table->string('slug',255);
            $table->boolean('status')->default(true)->comment('1 = activated and 0 = deactivated');
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
        Schema::dropIfExists('categories');
    }
}
