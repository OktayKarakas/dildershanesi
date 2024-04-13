<?php

use App\Http\Controllers\KonuController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TopicController;
use App\Http\Controllers\AdminController;
use \App\Http\Controllers\UserCoursesController;
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\UserController;
use Illuminate\Http\Request;

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

Route::get('/', function () {
    return view('index');
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
