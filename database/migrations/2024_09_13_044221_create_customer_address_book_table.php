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
            $table->bigInteger('customer_id')->index();
            $table->string('full_name');
            $table->string('phone');
            $table->bigInteger('province_id')->index();
            $table->bigInteger('city_id')->index();
            $table->string('address');
            $table->string('landmark')->nullable();
            $table->string('address_type')->nullable();
            $table->string('default_shipping')->nullable();
            $table->string('default_billing')->nullable();
            $table->timestamps();
            
            // Defining the foreign key constraint
            $table->foreign('customer_id')
                  ->references('id')
                  ->on('customers')
                  ->onDelete('restrict');
                
            // Defining the foreign key constraint
            $table->foreign('province_id')
                  ->references('id')
                  ->on('provinces')
                  ->onDelete('restrict');

            // Defining the foreign key constraint
            $table->foreign('city_id')
                  ->references('id')
                  ->on('set_shipping')
                  ->onDelete('restrict');

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
