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
        Schema::create('set_shipping', function (Blueprint $table) {
            $table->bigInteger('id')->primary()->autoIncrement();
            $table->bigInteger('province_id')->index();
            $table->string('city');
            $table->decimal('shipping_cost', 10, 2)->default(0);
            $table->string('remarks')->nullable();
            $table->timestamps();

            
            // Defining the foreign key constraint
            $table->foreign('province_id')
                  ->references('id')
                  ->on('provinces')
                  ->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('set_shipping');
    }
};
