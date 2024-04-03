<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Topic;
use Illuminate\Http\Request;

class GrammerController extends Controller
{
    public function show($course_slug, $topic_slug)
    {
        $course = Course::where('slug', $course_slug)->firstOrFail();
        $topic = Topic::where('slug', $topic_slug)->firstOrFail();
        return view('grammer_topic',[
            "language" => $course,
            "grammer" => $topic
        ]);
    }
}
