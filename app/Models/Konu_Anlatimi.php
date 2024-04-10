<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Konu_Anlatimi extends Model
{
    use HasFactory;
    protected $table = 'konu_anlatimi';
    protected $guarded = [];
    public function topics(){
        return $this->belongsTo(Topic::class,"topic_id");
    }

    public function quizes(){
        return $this->hasMany(Quizler::class,"konu_anlatimi_id");
    }

    public function Konu_Anlatim_Commentler(){
        return $this->hasMany(Konu_Anlatim_Comment::class,"konu_anlatimi_id");
    }
}
