<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Bookmark;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function add_bookmark(Request $request){

        $validatedData = $request->validate([
            'course_id' => 'required|integer',
            'topic_id' => 'required|integer',
            'konu_anlatimi_id' => 'required|integer'
        ]);



        $bookmark = new Bookmark();
        $bookmark->course_id =$validatedData['course_id'];
        $bookmark->topic_id =$validatedData['topic_id'];
        $bookmark->konu_anlatimi_id =$validatedData['konu_anlatimi_id'];
        $bookmark->user_id = $request->user()->id;
        $bookmark->save();
        return new JsonResponse(['success' => 'bookmark created.'], 200);
    }
}
