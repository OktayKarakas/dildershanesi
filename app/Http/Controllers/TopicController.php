<?php

namespace App\Http\Controllers;

use App\Models\Course;
use Illuminate\Http\Request;
use App\Models\User_Course;

class TopicController extends Controller
{
    public function show(Request $request, $slug)
    {
        $course = Course::where('slug', $slug)->firstOrFail();
        $user = auth()->user();
        $user_course = null;

        if ($user) {
            $user_course = $user->courses->where("course_id", $course->id)->first();
        }

        $topics = $course->topics;

        return view('course_page', [
            'topics' => $topics,
            'user_course' => $user_course,
        ]);
    }

    public function course_register(Request $request, $slug)
    {
        if ($request->session()->has('is_course_get') && $request->session()->get('course_slug')) {
            $request->session()->forget(['is_course_get', 'course_slug']);
        }
        $course = Course::where('slug', $slug)->firstOrFail();
        $user = auth()->user();
        $user_courses = null;
        if ($user) {
            $user_courses = $user->courses->where("course_id", $course->id)->first();
            if ($user_courses) {

                return redirect("courses/languages/$slug");
            }
            User_Course::create([
                'user_id' => $user->id,
                'topic_id' => "1",
                'course_id' => $course->id,
                'completed_quizes' => "[]",
            ]);
        }
        return redirect("courses/languages/$slug");
    }

    public function course_reset(Request $request, $slug)
    {
        $course = Course::where('slug', $slug)->firstOrFail();
        $user = auth()->user();
        $user_course = null;
        if ($user) {
            $user_course = $user->courses->where("course_id", $course->id)->first();
            if ($user_course) {
                $user_course->update([
                    'isCompleted' => false,
                    'topic_id' => 1
                ]);
                return redirect()->back();
            }
        }
    }
}
