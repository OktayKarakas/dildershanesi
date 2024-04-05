<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Topic;
use Illuminate\Http\Request;

class TopicController extends Controller
{
    public function show(Request $request, $slug)
    {
        $course = Course::where('slug', $slug)->firstOrFail();
        $user = auth()->user();
        $user_courses = null;

        if ($user) {
            $user_courses = $user->courses->where("course_id", $course->id)->first();
        }

        $topics = $course->topics;

        return view('course_page', [
            'topics' => $topics,
            'user_courses' => $user_courses,
        ]);
    }
}
