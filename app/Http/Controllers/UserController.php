<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Message;
use App\User;
use Auth;


class UserController extends Controller
{
    //

    public function __construct()
    {
        $this->middleware('auth');
    }


    public function index(){
        
        $search = request()->search;
        $records = config('global.pagination_records');  // get pagination record

        // get all users except auth user and get user that search about him
       $users = User::when($search, function ($query, $search) {
            return $query->where('name', 'like' , "%". $search ."%");
        })->where("id" , "!=" , Auth::user()->id)->paginate($records);

        // get all messages is not seen and users that send them
        $unseen_messages = Message::with('user')->where("reciver_id" , Auth::user()->id)->where("is_seen",0)->latest()->get();

        return view("messages.index" , compact('users' , "unseen_messages"));
 
     }//end of index



}
