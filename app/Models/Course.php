<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;

    protected $table = 'courses';
    protected $guarded = [];

    public function topics(){
        return $this->hasMany(Topic::class,"course_id");
    }

    public function Konu_anlatimlari(){
        return $this->hasMany(Konu_Anlatimi::class,'course_id');
    }
}
