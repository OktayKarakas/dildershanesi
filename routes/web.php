<?php

use App\Http\Controllers\KonuController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TopicController;
use App\Http\Controllers\AdminController;
use \App\Http\Controllers\UserCoursesController;
use App\Models\Course;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

use Illuminate\Support\Collection;

Route::get('/', function () {
    $cacheKey = 'course_index_page_courses';

    $courses = Cache::remember($cacheKey, now()->addMonth(), function (){
        return Course::all();
    });

    // Apply search filter if present
    if(request('search')){
        $courses = $courses->filter(function ($course) {
            return stripos($course->title, request('search')) !== false;
        });
    }

    // Set the number of items per page
    $perPage = 6; // Default number of items per page
    if (request()->has('per_page')) {
        $perPage = (int) request('per_page');
    }

    // Paginate the filtered or all courses
    if ($courses instanceof Collection) {
        $currentPage = request()->get('page', 1); // Get current page from request
        $currentPageItems = $courses->slice(($currentPage - 1) * $perPage, $perPage)->all();
        $courses = new LengthAwarePaginator($currentPageItems, $courses->count(), $perPage, $currentPage);
    } else {
        $courses = $courses->paginate($perPage);
    }

    return view('index', [
        "courses" => $courses
    ]);
});





Route::middleware('auth')->group(function () {
    Route::get('/settings', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/settings', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/settings', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::get('/languages/{course_slug}/grammar/{topic_slug}', [KonuController::class, 'show']);
    Route::patch('/languages/{course_slug}/grammar/{topic_slug}', [KonuController::class, 'update']);
    Route::patch('/languages/{course_slug}/word/{topic_slug}', [KonuController::class, 'update']);
    Route::get('/languages/{course_slug}/word/{topic_slug}', [KonuController::class, 'show']);
    Route::get('/languages/{course_slug}/quiz/{topic_slug}', [KonuController::class, 'show']);
    Route::patch('/languages/{course_slug}/quiz/{topic_slug}', [KonuController::class, 'update']);
    Route::get('/profile/courses', [UserCoursesController::class, 'show']);
    Route::post('/user/create/bookmark', [UserController::class, 'add_bookmark']);
    Route::get('/user/bookmarks', [UserController::class, 'show_bookmarks']);
});

Route::middleware('admin.auth')->group(function () {
    Route::get('/admin', [AdminController::class, 'show']);
    Route::post('/admin/create/course', [AdminController::class, 'create_course']);
    Route::post('/admin/create/topic', [AdminController::class, 'create_topic']);
    Route::post('/admin/create/konu_anlatimi', [AdminController::class, 'create_konu_anlatimi']);
    Route::post('/admin/create/quiz_question', [AdminController::class, 'create_question']);
    Route::post('/admin/create/quiz', [AdminController::class, 'create_quiz']);
});

Route::post('/courses/languages/{slug}', [TopicController::class, 'course_register'])->middleware('set.session');
Route::get('/courses/languages/{slug}', [TopicController::class, 'show']);
Route::patch('/courses/languages/{slug}', [TopicController::class, 'course_reset'])->middleware('auth');


require __DIR__ . '/auth.php';
