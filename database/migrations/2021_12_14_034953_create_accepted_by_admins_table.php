<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAcceptedByAdminsTable extends Migration
{
    /**
     * Run the migrations.
     *'order_id', 'user_id', 'permission'
     * @return void
     */
    public function up()
    {
        Schema::create('accepted_by_admins', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('order_id');
            $table->bigInteger('user_id');
            $table->string('permission');
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
        Schema::dropIfExists('accepted_by_admins');
    }
}
