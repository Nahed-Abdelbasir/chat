@extends('layouts.app')


@section('content')

<div class="container">

    <h2 class="text-center text-danger">User Chat</h2>

    <div class="row">

        <div class="col col-md-4">

            <div class="users-group w-75 m-auto">

                <div class="search-form mt-5 text-center">
                    <form action="{{route('messages.show' , $user->id)}}" method="GET">
                        @csrf
    
                        @include('includes.search')
                        
                    </form>
                </div>
    

                 @include('includes.sidebar')

            </div>

        </div> {{-- end of col col-md-4 --}}

        <div class="col col-md-8 mt-1">

            <div class="chat-msg bg-white my-4 rounded border-top border-primary" style="border-top-width: 3px !important">

                <h4 class="p-3 pt-1 text-info">{{ $user->name }}</h4>
                <hr class="mb-0">
                
                <div class="all-msg p-4" style="height: 50vh;overflow: auto;">

                    @forelse ($messages as $message)

                        <div class="w-50 user-msg mt-2 mb-4 text-center text-white rounded
                        {{ auth()->user()->id == $message->user_id ? 'float-right bg-primary' : 'float-left bg-secondary' }}" >

                                <p class="pt-2">{{$message->body}}</p>

                        </div>
                        <div class="clearfix"></div>

                    @empty
                        <p class="font-weight-normal text-center text-primary no-message">There Is No Messages</p>
                    @endforelse

                </div>
                

            </div> {{-- end of chat-msg --}}

            <div class="form-msg w-100 text-center m-auto">

                <form>
                    @csrf
                    <input type="hidden" name="reciver_id" value="{{ $user->id }}" id="reciver-id">
                    <input class="w-75 rounded @error('body') is-invalid @enderror" type="text" name="body" id="msg" data-url="{{route('messages.store')}}">
                    <button id="btn-msg"  class="btn btn-primary px-3">Send</button>

                    @error('body')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    
                @enderror
                </form>

            </div> {{-- end of chat-msg --}}

        </div> {{-- end of col col-md-9 --}}

    </div> {{-- end of row --}}
    
</div> {{-- end of container --}}
    
@endsection