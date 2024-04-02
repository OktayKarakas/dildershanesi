<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    use HasFactory;

    protected $table = 'quizler';

    public function topics(){
        return $this->belongsTo(Topic::class,"topic_id");
    }

    public function Konu_Anlatimlari(){
        return $this->belongsTo(Konu_Anlatimi::class,"konu_anlatimi_id");
    }

    public function Questions(){
        return $this->hasMany(Question::class,"quiz_id");
    }
}
