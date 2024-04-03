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
        Schema::create('konu_anlatimi', function (Blueprint $table) {
            $table->id();
            $table->text('title');
            $table->text('body');
            $table->integer('sirasi');
            $table->foreignId('topic_id');
            $table->foreignId('course_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('konu_anlatimi');
    }
};
