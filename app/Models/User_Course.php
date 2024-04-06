<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class User_Course extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $table = 'user_courses';

    public function topic(){
        return $this->belongsTo(Topic::class,"topic_id");
    }

    public function course(){
        return $this->belongsTo(Course::class,"course_id");
    }
}
