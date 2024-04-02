<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bookmark extends Model
{
    use HasFactory;

    protected $table = 'bookmarks';

    public function konu_anlatimlari(){
        return $this->belongsTo(Konu_Anlatimi::class,"konu_anlatimi_id");
    }

    public function users(){
        return $this->belongsTo(User::class,"user_id");
    }
}
