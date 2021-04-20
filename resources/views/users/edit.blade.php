@extends('layouts.app')

@section('content')

<form action='{{ url("/user/update") }}' method="post">

    <input type="hidden" name="_token" value="{{ csrf_token() }}">
    <input type="hidden" name="id" value="{{ $user->id }}{{ old('id') }}">

    <div class="form-group col-xs-6">
        <label for="name">Name</label>
        <input required="required" value="@if(!old('name')){{$user->name}}@endif{{ old('name') }}" placeholder="Enter title here" type="text" name="name"class="form-control" />
    </div>

    <div class="form-group col-xs-6">
        <label for="name">Email</label>
        <input required="required" value="@if(!old('email')){{$user->email}}@endif{{ old('email') }}" placeholder="Enter email here" type="text" name="email"class="form-control" />
    </div>

    <div class="form-group col-xs-6">
        <label for="name">Password</label>
        <input value="" placeholder="Enter Password here" type="password" name="password"class="form-control" />
    </div>

    <div class="form-group col-xs-6">
        <label for="name">Role</label>
        <select name="role" id="role" class="form-control" >
            <option value="admin" 
            @if(old('role') && old('role') == "admin")
                    selected
                @endif
                >Admin</option>
            <option value="user" 
            @if(old('role') && old('role') == "user")
                    selected
                @endif
            >User</option>
            <option value="member" 
            @if(old('role') && old('role') == "member")
                    selected
                @endif
            >Member</option>
        </select>
    </div>

    <div class="form-group col-xs-12">
        <input type="submit" name='submit' class="btn btn-success" value = "Submit"/>
    </div>
</form>
@endsection