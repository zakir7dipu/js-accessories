<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class ContactMessage extends Model
{
    use HasFactory;
    use Notifiable;

    protected $fillable = ['contact_name', 'contact_email', 'contact_phone', 'contact_message', 'status'];

    public function replyMessage()
    {
        return $this->hasOne(ReplyContactMessage::class, 'contact_msg_id', 'id');
    }
}
