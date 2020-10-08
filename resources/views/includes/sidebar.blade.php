

<ul class="list-unstyled mt-4 all-users rounded border-top border-primary" style="border-top-width: 3px !important">

    @forelse ($users as $user)
        <li class="list-group-item font-weight-normal" style="font-size: 18px">
            <i class='fas fa-circle pr-2 d-none online-icon' style='font-size: 10px; color:#00aa00'></i>
            <a data-id="{{$user->id}}" class="text-decoration-none text-secondary" href="{{route('messages.show' , $user->id)}}">{{$user->name}}</a>
        </li> 
    @empty 
        <li class="list-group-item font-weight-normal text-center text-danger">There Is No Users</li>
    @endforelse
    
</ul>

<div class="mt-4">
    {!! $users->links() !!}
</div>

