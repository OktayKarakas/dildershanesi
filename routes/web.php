<?php

use App\Http\Controllers\KonuController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TopicController;
use Illuminate\Support\Facades\Route;
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
});

Route::post('/courses/languages/{slug}', [TopicController::class, 'course_register'])->middleware('set.session');

// layout body'de padding var.layout footer'da margin var.


Route::get('courses/languages/{slug}',[TopicController::class,'show']);
Route::get('languages/{course_slug}/grammar/{topic_slug}', [KonuController::class, 'show'])->middleware('auth');

Route::get('languages/{course_slug}/word/{topic_slug}', [KonuController::class, 'show'])->middleware('auth');





Route::post('language/{language_slug}/grammar/{grammar_id}', function () {
    return ["test" => "asdasd"];
});


require __DIR__ . '/auth.php';
