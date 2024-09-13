<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('delivery_information', function (Blueprint $table) {
            $table->bigInteger('id')->primary()->autoIncrement();
            $table->bigInteger('customer_id')->nullable();
            $table->bigInteger('order_id')->nullable();
            $table->string('full_name');
            $table->string('email')->nullable();
            $table->string('phone');
            $table->string('province');
            $table->string('city');
            $table->string('address');
            $table->string('landmark')->nullable();
            $table->string('address_type')->nullable();
            $table->string('default_shipping')->nullable();
            $table->string('default_billing')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('delivery_information');
    }
};
