<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Topic;
use App\Models\User_Course;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class KonuController extends Controller
{
    public function show(Request $request, $course_slug, $topic_slug)
    {
        $course = Course::where('slug', $course_slug)->firstOrFail();
        $topic = Topic::where('slug', $topic_slug)->firstOrFail();
        $user = auth()->user();
        $user_courses = null;

        if ($user) {
            $user_courses = $user->courses->where("course_id", $course->id)->first();
        }
        if (!isset($user_courses)) {
            $user_courses = User_Course::create([
                'user_id' => $user->id,
                'topic_id' => "1",
                'course_id' => $course->id,
                'completed_quizes' => "[]",
            ]);
        }
        $current_topic_row_number = Topic::where('course_id', $course->id)
            ->where('id', '<=', $topic->id)
            ->count();
        $next_topic = Topic::where('course_id', $course->id)
            ->skip($current_topic_row_number)
            ->select('slug', 'isGrammar', 'isWord', 'isQuiz')
            ->first();
        $previous_topic = Topic::where('course_id', $course->id)
            ->skip($current_topic_row_number - 2) // Skip to the previous row
            ->select('slug', 'isGrammar', 'isWord', 'isQuiz') // Select only the 'slug' column
            ->first();
        $konu_anlatimi = $course->Konu_anlatimlari()->where('topic_id', $topic->id)->firstOrFail();


        return view('grammer_topic', [
            "language" => $course,
            "grammer" => $topic,
            "konu_anlatimi" => $konu_anlatimi,
            "previous_topic_slug" => $previous_topic->slug ?? null,
            "next_topic_slug" => $next_topic->slug ?? null,
            "previous_topic_general" => isset($previous_topic) ? ($previous_topic->isGrammar ? 'grammar' : ($previous_topic->isWord ? 'word' : 'quiz')) : null,
            "next_topic_general" => isset($next_topic) ? ($next_topic->isGrammar ? 'grammar' : ($next_topic->isWord ? 'word' : 'quiz')) : null,
            "isLast" => !isset($next_topic),
        ]);
    }

    public function update(Request $request, $course_slug, $topic_slug)
    {
        // Find the topic and course
        try {
            $topic = Topic::where('slug', $topic_slug)->firstOrFail();
            $course = Course::where('slug', $course_slug)->firstOrFail();
        } catch (\Exception $e) {
            return new JsonResponse(['error' => 'Topic or course not found.'], 404);
        }

        // Get the authenticated user
        $user = auth()->user();

        // Check if the user is authenticated
        if (!$user) {
            return new JsonResponse(['error' => 'User is not authenticated.'], 401);
        }

        // Find user's enrolled course
        $user_course = $user->courses()->where("course_id", $course->id)->first();

        // Check if the user is enrolled in the course
        if (!$user_course) {
            return new JsonResponse(['error' => 'User is not enrolled in the course.'], 403);
        }

        // Find the next topic
        $next_topic = Topic::where('course_id', $course->id)
            ->where('id', '>', $topic->id)
            ->orderBy('id')
            ->first();

        if ($user_course->isCompleted) {
            $topic_general = $next_topic ? ($next_topic->isGrammar ? 'grammar' : ($next_topic->isWord ? 'word' : 'quiz')) : null;
            $link = $next_topic ? "/languages/$course_slug/$topic_general/$next_topic->slug" : "/courses/languages/$course_slug/";
            return new JsonResponse(['redirect_link' => $link, 'message' => 'No Update,Course is already completed.'], 200);
        }

        // Check if user is on the correct topic
        if ($topic->id < $user_course->topic_id) {
            $topic_general = $next_topic ? ($next_topic->isGrammar ? 'grammar' : ($next_topic->isWord ? 'word' : 'quiz')) : null;
            $link = $next_topic ? "/languages/$course_slug/$topic_general/$next_topic->slug" : "/languages/$course_slug/";
            return new JsonResponse(['redirect_link' => $link, 'message' => 'Redirecting to the next topic.'], 200);
        }

        // Update user's progress
        $user_course->update([
            'isCompleted' => (bool)$request->json('isLast')
        ]);

        // Prepare redirection link if next topic is found
        if ($next_topic) {
            $topic_general = $next_topic->isGrammar ? 'grammar' : ($next_topic->isWord ? 'word' : 'quiz');
            $link = "/languages/$course_slug/$topic_general/$next_topic->slug";
            $user_course->update([
                'topic_id' => $next_topic->id,
            ]);
            return new JsonResponse(['redirect_link' => $link, 'message' => 'Form submitted successfully.'], 200);
        }

        // Return error if next topic is not found
        $main_page_link = "/courses/languages/$course_slug";
        return new JsonResponse(['redirect_link' => $main_page_link, 'message' => 'Next topic not found. Redirecting to the main page.'], 200);
    }
}