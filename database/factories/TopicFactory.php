<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Topic>
 */
class TopicFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'course_id' => 1,
            'title' => $this->faker->sentence,
            'excerpt' => $this->faker->sentence,
            'isGrammar' => $this->faker->boolean,
            'isQuiz' => $this->faker->boolean,
            'isWord' => $this->faker->boolean,
            'slug' => $this->faker->word,
        ];
    }
}
