<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Events\SendMessage;
use App\Message;
use App\User;
use Auth;


class MessageController extends Controller
{
    //

    public function __construct()
    {
        $this->middleware('auth');
    }



    public function show($id){

        $search = request()->search;
        $records = config('global.pagination_records');   // get pagination record

        $user = User::where("id", $id)->first();     // get user chat with me now

         // get all users except auth user and user chat with me now  and get user that search about him
        $users = User::when($search, function ($query, $search) {
            return $query->where('name', 'like' , "%". $search ."%");
        })->whereNotIn('id', [Auth::user()->id , $id])->paginate($records);           

        // get all messages between auth user and user chat with auth user now
        $messages = Message::whereIn("user_id" , [Auth::user()->id , $id])->whereIn("reciver_id" , [Auth::user()->id , $id])->get() ;
      
        // update to all messages (make it is seen) of user that auth user chat with him now 
        $previous_url = url()->previous();
        $contents = explode('/', $previous_url);
        $previous_page = end($contents);
        $prev_user_id = $previous_page != 'our-group' ? $previous_page : "";

        Message::whereIn("user_id" ,[ $id , $prev_user_id])->where("reciver_id" , Auth::user()->id)->update(["is_seen" => 1]);

        // get all messages is not seen and users that send them
        $unseen_messages = Message::with('user')->where("reciver_id" , Auth::user()->id)->where("is_seen",0)->latest()->get();
        

        return view("messages.show" , compact("users" , "user" , "messages" , "unseen_messages"));

    }//end of show



    public function store(Request $request){ 
      
        $this->validate(request(),[
            'body' => 'required',
        ]);

        $request['user_id'] = Auth::user()->id;
        $message = Message::create($request->all());
           
        broadcast(new SendMessage($message , Auth::user()->name))->toOthers();

        return response()->json($message);
     
    }//end of store


}
