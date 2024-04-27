<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Topic;
use App\Models\User_Course;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Cache;

class KonuController extends Controller
{
    public function show(Request $request, $course_slug, $topic_slug)
    {

        $course = Cache::remember('course_' . $course_slug, now()->addMinute(), function () use ($course_slug) {
            return Course::where('slug', $course_slug)->firstOrFail();
        });

        $topic = Cache::remember('topic_' . $topic_slug, now()->addMinute(), function () use ($topic_slug) {
            return Topic::where('slug', $topic_slug)->firstOrFail();
        });

        $user = auth()->user();
        $user_course = null;

        if ($user) {
            $user_course = $user->courses->where("course_id", $course->id)->first();
        }
        if (!isset($user_course)) {
            $user_course = User_Course::create([
                'user_id' => $user->id,
                'topic_id' => $topic->id,
                'course_id' => $course->id,
                'completed_quizes' => "[]",
            ]);
        }
        $current_topic_row_number = Cache::remember('current_topic_row_number_' . $course->slug . '_' . $topic->slug, now()->addMinute(), function () use ($course, $topic) {
            return Topic::where('course_id', $course->id)
                ->where('id', $topic->id)
                ->value('id');
        });

        $next_topic = Cache::remember('next_topic_' . $course->slug . '_' . $current_topic_row_number, now()->addMinute(), function () use ($course, $current_topic_row_number) {
            return Topic::where('course_id', $course->id)
                ->where('id', '>', $current_topic_row_number)
                ->orderBy('id', 'asc')
                ->select('slug', 'isGrammar', 'isWord', 'isQuiz')
                ->first();
        });

        $previous_topic = Cache::remember('previous_topic_' . $course->slug . '_' . $current_topic_row_number, now()->addMinute(), function () use ($course, $current_topic_row_number) {
            return Topic::where('course_id', $course->id)
                ->where('id', '<', $current_topic_row_number)
                ->orderBy('id', 'desc')
                ->select('slug', 'isGrammar', 'isWord', 'isQuiz')
                ->first();
        });

        $konu_anlatimi = Cache::remember('konu_anlatimi_' . $course->slug . '_' . $topic->slug, now()->addMinute(), function () use ($course, $topic) {
            return $course->Konu_anlatimlari()->where('topic_id', $topic->id)->firstOrFail();
        });
        if ($user) {
            $user_bookmark = $user->bookmarks->where("course_id", $course->id)->where("topic_id", $topic->id)->where("konu_anlatimi_id", $konu_anlatimi->id)->first();
        }


        return view('grammer_topic', [
            "language" => $course,
            "grammer" => $topic,
            "konu_anlatimi" => $konu_anlatimi,
            "previous_topic_slug" => $previous_topic->slug ?? null,
            "next_topic_slug" => $next_topic->slug ?? null,
            "topic_general" => isset($topic) ? ($topic->isGrammar ? 'grammar' : ($topic->isWord ? 'word' : 'quiz')) : null,
            "previous_topic_general" => isset($previous_topic) ? ($previous_topic->isGrammar ? 'grammar' : ($previous_topic->isWord ? 'word' : 'quiz')) : null,
            "next_topic_general" => isset($next_topic) ? ($next_topic->isGrammar ? 'grammar' : ($next_topic->isWord ? 'word' : 'quiz')) : null,
            "isLast" => !isset($next_topic),
            "user_bookmark" => $user_bookmark ?? null
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
