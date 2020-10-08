@extends('layouts.app')


@section('content')
    
    <div class="container">

        <h2 class="text-center text-danger">Users</h2>

        <div class="users-group w-50 m-auto">

            <div class="search-form mt-4 text-center">
                <form action="{{route('user.index')}}" method="GET">
                    @csrf

                    @include('includes.search')
                    
                </form>
            </div>

             @include('includes.sidebar')

        </div>
    </div>



@endsection