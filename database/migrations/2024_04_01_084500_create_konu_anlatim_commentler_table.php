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
        Schema::create('konu_anlatimi_commentler', function (Blueprint $table) {
            $table->id();
            $table->text('title');
            $table->text('body');
            $table->foreignId('konu_anlatimi_id')->constrained('konu_anlatimi')->onDelete('cascade');
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('konu_anlatimi_commentler');
    }
};
