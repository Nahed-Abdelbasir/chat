<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    //
    protected $guarded = [];
    
    protected $fillable = [
        'body', 'user_id', 'reciver_id' ,
    ];


    public function user()
    {
        return $this->belongsTo('App\User');
    }

}
