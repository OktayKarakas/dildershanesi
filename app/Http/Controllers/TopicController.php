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

        return view('course_page', [
            'topics' => Topic::where("course_id", $course->id)->get(),
            'user_courses' => $user_courses,
        ]);
    }
}
