<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <meta name="user_id" content="{{ auth()->user()->id ?? "" }}">
    

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    
    
    <style>
        body 
        {
          background-color: #eee;  
        }   

        .dropdown-toggle::after {
            display: none;
        }
    </style>

</head>
<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
                    {{ config('app.name', 'Laravel') }}
                </a>

                @auth
                    <a class="navbar-brand" href="{{ route("user.index") }}">
                        Our Group
                    </a>
                @endauth

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav mr-auto">

                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Authentication Links -->

                        @guest
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                            </li>
                            @if (Route::has('register'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                </li>
                            @endif
                        @else

                        <div class="btn-group">

                            
                            <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell">
                                    <span class="bg-danger rounded-circle  p-1 ml-1 text-white msg-count 
                                    @if (isset($unseen_messages) && $unseen_messages->count() > 0)
                                        d-inline-block
                                    @else 
                                        d-none
                                    @endif
                                    " style='font-size: 15px;'>{{$unseen_messages->count()}}</span>
                                </i>
                            </button>

                               

                                <div class="dropdown-menu">

                                        <a class="dropdown-item text-secondary" >All New Messages</a>
                                        <hr>
                                        <div class="new-messages">
                                            @if (isset($unseen_messages) && $unseen_messages->count() > 0)

                                                @foreach ($unseen_messages as $message)

                                                    <a class="dropdown-item user-item" href='{{ url("/messages/$message->user_id") }}'>{{$message->user->name}}</a>
                                            
                                                @endforeach 

                                            @endif
                                        </div>
                                     
                                </div>

                          </div>


                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }}
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
            </div>
        </nav>

        <main class="py-4">
            @yield('content')
        </main>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.5.2/umd/popper.min.js" integrity="sha512-Jen3K+iRN4thSYDEyHwUGYFxNslAUCTV9P/g0k836eaoq/tplAUCzRPUyDxKUjBlKdJhamW7S3u7NWSGEEdIQw==" crossorigin="anonymous"></script>


</body>
</html>
