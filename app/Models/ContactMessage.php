<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContactMessage extends Model
{
    use HasFactory;

    protected $fillable = ['contact_name', 'contact_email', 'contact_phone', 'contact_message', 'status'];

    public function replyMessage()
    {
        return $this->hasOne(ReplyContactMessage::class, 'contact_msg_id', 'id');
    }
}
