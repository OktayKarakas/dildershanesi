<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Topic extends Model
{
    use HasFactory;

    protected $table = 'topics';

    public function Konu_anlatimlari(){
        return $this->hasMany(Konu_Anlatimi::class,'topic_id');
    }

    public function Courses(){
        return $this->belongsTo(Course::class,'course_id');
    }
}
