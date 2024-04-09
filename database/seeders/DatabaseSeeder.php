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

        \App\Models\Konu_Anlatimi::create([
            'title' => "İngilizce",
            'body' => "This is excerpt",
            'sirasi' => 1,
            'topic_id' => 1,
            'course_id' =>1
        ]);

        \App\Models\Konu_Anlatimi::create([
            'title' => "İngilizce2",
            'body' => "This is excerpt",
            'sirasi' => 2,
            'topic_id' => 2,
            'course_id' =>1
        ]);

        \App\Models\Konu_Anlatimi::create([
            'title' => "İngilizce3",
            'body' => "This is excerpt",
            'sirasi' => 3,
            'topic_id' => 3,
            'course_id' =>1
        ]);

        \App\Models\Konu_Anlatimi::create([
            'title' => "İngilizce4",
            'body' => "This is excerpt",
            'sirasi' => 4,
            'topic_id' => 4,
            'course_id' =>1
        ]);

        \App\Models\Konu_Anlatimi::create([
            'title' => "İngilizce5",
            'body' => "This is excerpt",
            'sirasi' => 5,
            'topic_id' => 5,
            'course_id' =>1
        ]);

        \App\Models\Konu_Anlatimi::create([
            'title' => "İngilizce6",
            'body' => "This is excerpt",
            'sirasi' => 6,
            'topic_id' => 6,
            'course_id' =>1
        ]);

        \App\Models\Konu_Anlatimi::create([
            'title' => "İngilizce7",
            'body' => "This is excerpt",
            'sirasi' => 7,
            'topic_id' => 7,
            'course_id' =>1
        ]);

        \App\Models\Konu_Anlatimi::create([
            'title' => "İngilizce8",
            'body' => "This is excerpt",
            'sirasi' => 8,
            'topic_id' => 8,
            'course_id' =>1
        ]);

    }
}
