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
        Schema::create('orders', function (Blueprint $table) {
            $table->bigInteger('id')->primary()->autoIncrement();
            $table->bigInteger('customer_id');
            $table->bigInteger('checkout_id');
            $table->bigInteger('cart_id');
            $table->string('shipping_address');
            $table->string('billing_address')->nullable();
            $table->string('payment_method')->nullable();
            $table->string('shipping_method')->nullable();  //Standard, Express
            $table->decimal('subtotal', 10, 2)->default(0);
            $table->decimal('tax', 10, 2)->default(0);
            $table->decimal('shipping_cost', 10, 2)->default(0);
            $table->decimal('discount', 10, 2)->default(0);
            $table->decimal('total_amount', 10, 2)->default(0);
            $table->string('order_status')->default('Pending');
            $table->string('payment_status')->default('Pending');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
