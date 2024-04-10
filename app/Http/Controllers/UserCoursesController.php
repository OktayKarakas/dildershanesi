<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class UserCoursesController extends Controller
{
    public function show(Request $request)
    {
        $user = auth()->user();
        $user_courses = null;

        if ($user) {
            $user_courses = $user->courses;
        }

        return view("user_courses",[
            "user_courses" => $user_courses
        ]);
    }
}
