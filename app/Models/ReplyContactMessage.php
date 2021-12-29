<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReplyContactMessage extends Model
{
    use HasFactory;

    protected $fillable = ['contact_msg_id', 'message', 'by_user'];

    public function contactMessage()
    {
        return $this->belongsTo(ContactMessage::class, 'contact_msg_id', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'by_user', 'id');
    }
}
