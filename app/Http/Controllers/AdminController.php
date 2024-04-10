<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Topic;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function show(Request $request)
    {
        $courses = Course::all();
        return view('admin_page', [
            "courses" => $courses,
        ]);
    }

    public function create_course(Request $request)
    {
        $validatedData = $request->validate([
            'kurs_title' => 'required|string|max:255',
            'course_excerpt' => 'required|string',
            'course_slug' => 'required|string|max:255',
        ]);

        // Assuming you have a Course model, you can create a new course
        $course = new Course();
        $course->title = $validatedData['kurs_title'];
        $course->excerpt = $validatedData['course_excerpt'];
        $course->slug = $validatedData['course_slug'];
        $course->save();

        // Optionally, you can redirect the user after successful submission
        return new JsonResponse(['success' => 'course created.'], 200);
    }

    public function create_topic(Request $request)
    {
        $validatedData = $request->validate([
            'topic_course_id' => 'required|integer',
            'topic_title' => 'required|string|max:255',
            'topic_excerpt' => 'required|string',
            'topic_slug' => 'required|string|max:255',
            'topic_general' => 'required|string|in:grammar,word,quiz', // Assuming these are the valid values for topic_general
        ]);

        // Create a new topic
        $topic = new Topic();
        $topic->course_id = $validatedData['topic_course_id'];
        $topic->title = $validatedData['topic_title'];
        $topic->excerpt = $validatedData['topic_excerpt'];
        $topic->slug = $validatedData['topic_slug'];
        switch ($validatedData['topic_general']) {
            case 'grammar':
                $topic->isGrammar = true;
                $topic->isWord = false;
                $topic->isQuiz = false;
                break;
            case 'word':
                $topic->isGrammar = false;
                $topic->isWord = true;
                $topic->isQuiz = false;
                break;
            case 'quiz':
                $topic->isGrammar = false;
                $topic->isWord = false;
                $topic->isQuiz = true;
                break;
        }
        $topic->save();

        // Optionally, you can redirect the user after successful submission
        return new JsonResponse(['success' => 'course created.'], 200);
    }
}
