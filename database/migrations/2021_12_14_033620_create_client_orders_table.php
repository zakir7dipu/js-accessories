<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClientOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *'user_id', 'invoice', 'price', 'discount', 'weight', 'shipping', 'shipping_status', 'order_status', 'accepted_by'
     * @return void
     */
    public function up()
    {
        Schema::create('client_orders', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id');
            $table->string('invoice');
            $table->string('price');
            $table->string('discount')->default(0)->comment('No discount added...');
            $table->string('weight')->default(0)->comment('Only show KG');
            $table->string('shipping')->default(0)->comment('No shipping added...');
            $table->boolean('shipping_status')->default(1)->comment('Client payed = 1, Company payed = 0.');
            $table->string('payment')->default('Xash on delivery');
            $table->string('payment_trx')->nullable()->comment('Payment transaction number');
            $table->boolean('payment_status')->default(false)->comment('due = 0, payed = 1');
            $table->integer('order_status')->default(1)->comment('Canceled = 0, Pending = 1, Approved = 2, Process to delivery = 3, Delivered = 4.');
            $table->integer('accepted_by')->nullable()->comment('Who process this order.');
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
        Schema::dropIfExists('client_orders');
    }
}
