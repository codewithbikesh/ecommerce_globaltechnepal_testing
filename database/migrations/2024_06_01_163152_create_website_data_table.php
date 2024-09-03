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
        Schema::create('website_data', function (Blueprint $table) {
            $table->id();
            $table->string('company_name');
            $table->string('company_logo_header')->nullable();
            $table->string('company_logo_footer')->nullable();
            $table->string('primary_email');
            $table->string('secondary_email')->nullable();
            $table->string('address')->nullable();
            $table->string('primary_phone')->nullable();
            $table->string('secondary_phone')->nullable();
            $table->string('website_link')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('website_data');
    }
};
