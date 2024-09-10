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
        Schema::create('products', function (Blueprint $table) {
            $table->bigInteger('id')->primary()->autoIncrement();
            $table->string('product_code')->index;
            $table->string('product_name');
            $table->string('product_description')->nullable();
            $table->string('category_id')->nullable();
            $table->string('category_name')->nullable();
            $table->string('subcategory_id')->nullable();
            $table->string('subcategory_name')->nullable();
            $table->string('delivery_target_days')->nullable();
            $table->decimal('discount', 8, 2)->nullable();
            $table->decimal('actual_price', 8, 2);
            $table->decimal('sell_price', 8, 2);
            $table->decimal('available_quantity', 8, 2)->nullable();
            $table->decimal('stock_quantity', 8, 2)->nullable();
            $table->string('brand_id')->nullable();
            $table->string('brand_name')->nullable();
            $table->binary('primary_image')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
