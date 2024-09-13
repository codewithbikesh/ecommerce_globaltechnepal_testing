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
        Schema::create('customer_address_book', function (Blueprint $table) {
            $table->bigInteger('id')->primary()->autoIncrement();
            $table->bigInteger('customer_id');
            $table->string('full_name');
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
        Schema::dropIfExists('customer_address_book');
    }
};
