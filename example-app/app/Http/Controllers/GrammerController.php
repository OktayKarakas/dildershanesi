<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class GrammerController extends Controller
{
    public function show($language_slug, $grammer_id)
    {   
        return view('grammer_topic',[
            "language" => $language_slug,
            "grammer" => $grammer_id
        ]);
    }
}
