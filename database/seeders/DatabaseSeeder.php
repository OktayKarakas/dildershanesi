<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        \App\Models\Topic::factory(8)->create();

        \App\Models\Course::create([
            'title' => "İngilizce",
            'excerpt' => "This is excerpt",
            'slug' => 'english'
        ]);

        \App\Models\Course::create([
            'title' => "İngilizce",
            'excerpt' => "This is excerpt",
            'slug' => 'english'
        ]);
    }
}
