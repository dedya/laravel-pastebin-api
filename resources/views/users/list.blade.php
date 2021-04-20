@extends('layouts.app')

@section('content')

<style>
    /* Overrides list-group-item from Bootstrap */ 
    .list-group-item {
        height:50px;
        padding: 10px 10px
    }
</style>
<!--
@if(Auth::user()->is_admin())
    is_admin
@else
    not admin
@endif
-->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="col-mb-2 bordered">
                    <button type="button" class="btn btn-primary" onClick="window.location.href='{{ url('/user/new') }}'">Add New user</button>
                </div>
                <br/>
                <div class="card-body">
                    @if ( !$users->count() )
                    There is no users till now.
                    @else
                    <div class="">
                        <ul class="list-group">
                            @foreach( $users as $user )
                            <li class="list-group-item py-8">
                                <a href="{{ url('user/edit/'.$user->id)}}">{{ $user->name}} - {{ $user->email}} - {{ $user->role}} </a>

                                <button type="button" class="btn btn-default btn-sm pull-right" onClick="window.location.href='{{ url('user/delete/'.$user->id)}}'">
                                    <span class="glyphicon glyphicon-trash"></span>Delete
                                </button>                      
                                <br>                                          
                            </li>
                            @endforeach
                        </ul>
                    
                    {{ $users->links('pagination::bootstrap-4') }}
                    </div>
                    @endif


                
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
