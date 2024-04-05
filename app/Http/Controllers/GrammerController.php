<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Konu_Anlatimi;
use App\Models\Topic;
use Illuminate\Http\Request;

class GrammerController extends Controller
{
    public function show($course_slug, $topic_slug)
    {
        $course = Course::where('slug', $course_slug)->firstOrFail();
        $topic = Topic::where('slug', $topic_slug)->firstOrFail();
        $current_topic_row_number = Topic::where('course_id', $course->id)
            ->where('id', '<=', $topic->id)
            ->count();
        $next_topic = Topic::where('course_id', $course->id)
            ->skip($current_topic_row_number)
            ->select('slug','isGrammar')
            ->first();
        $previous_topic = Topic::where('course_id', $course->id)
            ->skip($current_topic_row_number - 2) // Skip to the previous row
            ->select('slug','isGrammar') // Select only the 'slug' column
            ->first();
        $konu_anlatimi = $course->Konu_anlatimlari()->where('topic_id', $topic->id)->firstOrFail();



        return view('grammer_topic', [
            "language" => $course,
            "grammer" => $topic,
            "konu_anlatimi" => $konu_anlatimi,
            "previous_topic_slug" => $previous_topic->slug ?? null,
            "next_topic_slug" => $next_topic->slug ?? null,
            "previous_is_grammar" => $previous_topic->isGrammar ?? null,
            "next_is_grammar" => $next_topic->isGrammar ?? null,
        ]);
    }
}
