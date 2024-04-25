<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Question;
use App\Models\Quizler;
use App\Models\Topic;
use App\Models\Konu_Anlatimi;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use mysql_xdevapi\Exception;

class AdminController extends Controller
{
    public function show(Request $request)
    {
        $courses = Course::all();
        $topics = Topic::all();
        $konu_anlatimlari = Konu_Anlatimi::all();
        $quizes = Quizler::all();
        return view('admin_page', [
            "courses" => $courses,
            "topics" => $topics,
            "konu_anlatimlari" => $konu_anlatimlari,
            "quizler" => $quizes
        ]);
    }

    public function create_course(Request $request)
    {
        $validatedData = $request->validate([
            'kurs_title' => 'required|string|max:255',
            'course_excerpt' => 'required|string',
            'course_slug' => 'required|string|max:255',
            'course_background_url' => 'required|string',
        ]);

        // Assuming you have a Course model, you can create a new course
        $course = new Course();
        $course->title = $validatedData['kurs_title'];
        $course->excerpt = $validatedData['course_excerpt'];
        $course->slug = $validatedData['course_slug'];
        $course->background_url = $validatedData["course_background_url"];
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

    public function create_konu_anlatimi(Request $request)
    {
        $validatedData = $request->validate([
            'konu_anlatimi_course_id' => 'required|integer',
            'konu_anlatimi_topic_id' => 'required|integer',
            'konu_anlatimi_title' => 'required|string|max:255',
            'konu_anlatimi_body' => 'required|string', // Adjust validation rules as needed
            'sirasi' => 'required|integer',
        ]);

        // Create a new Konu Anlatimi instance
        $konuAnlatimi = new Konu_Anlatimi(); // Assuming you have a KonuAnlatimi model
        $konuAnlatimi->course_id = $validatedData['konu_anlatimi_course_id'];
        $konuAnlatimi->topic_id = $validatedData['konu_anlatimi_topic_id'];
        $konuAnlatimi->title = $validatedData['konu_anlatimi_title'];
        $konuAnlatimi->body = $validatedData['konu_anlatimi_body'];
        $konuAnlatimi->sirasi = $validatedData['sirasi'];
        $konuAnlatimi->save();

        // Optionally, you can redirect the user after successful submission
        return new JsonResponse(['success' => 'Konu Anlatimi created.'], 200);
    }

    public function create_quiz(Request $request)
    {
        // Validate the incoming request data
        $validatedData = $request->validate([
            'quiz_topic_id' => 'required|integer',
            'quiz_konu_anlatimi_id' => 'required|integer',
            'quiz_isEnd_checkbox' => 'nullable|boolean', // Assuming quiz_isEnd_checkbox is optional and boolean
        ]);

        // Create a new quiz instance
        $quiz = new Quizler();

        // Assign values to the quiz instance
        $quiz->topic_id = $validatedData['quiz_topic_id'];
        $quiz->konu_anlatimi_id = $validatedData['quiz_konu_anlatimi_id'];
        // Assuming quiz_isEnd_checkbox is a boolean field in your database
        $quiz->is_end = $validatedData['quiz_isEnd_checkbox'] ?? false; // Default to false if checkbox is not checked

        // Save the quiz to the database
        $quiz->save();

        // Return a response indicating success
        return new JsonResponse(['success' => 'Quiz created.'], 200);
    }

    public function create_question(Request $request)
    {
        try {
            // Validate the incoming request data
            $validatedData = $request->validate([
                'quiz_id' => 'required|integer',
                'question_body' => 'required|string', // Adjust validation rules as needed
                'quiz_question_type' => 'required|string|in:multipleChoice,trueFalse,clickComplete',
            ]);

            // Create a new question instance
            $question = new Question();

            // Assign values to the question instance
            $question->quiz_id = $validatedData['quiz_id'];
            $question->question = $validatedData['question_body'];

            // Determine the question type based on the quiz_question_type field
            switch ($validatedData['quiz_question_type']) {
                case 'multipleChoice':
                    $question->isMultiChoice = true;
                    $question->isTrueFalse = false;
                    $question->isClickComplete = false;
                    break;
                case 'trueFalse':
                    $question->isMultiChoice = false;
                    $question->isTrueFalse = true;
                    $question->isClickComplete = false;
                    break;
                case 'clickComplete':
                    $question->isMultiChoice = false;
                    $question->isTrueFalse = false;
                    $question->isClickComplete = true;
                    break;
            }

            // Save the question to the database
            $question->save();

            // Return a response indicating success
            return response()->json(['success' => 'Question created successfully'], 200);
        } catch (\Exception $e) {
            // Handle any exceptions that occur during the process
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }


}
