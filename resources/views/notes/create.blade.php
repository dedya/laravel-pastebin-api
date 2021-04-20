@extends('layouts.app')

@section('content')

<form action="/note/new" method="post">

    <input type="hidden" name="_token" value="{{ csrf_token() }}">
   
    <div class="form-group col-xs-12">
        <label for="name">New Paste</label>
        <textarea  class="form-control"  name='paste_code' value="{{ old('paste_code') }}" rows=10></textarea>
    </div>

    <div class="form-group col-xs-6">
        <label for="name">Paste name</label>
        <input class="form-control" type="text" placeholder="Input paste name" name='paste_name' value="{{ old('paste_name') }}" maxlength=150> 
    </div>

    <div class="form-group col-xs-4">
        <label for="paste_expiration">Paste expiration</label>
        <select class="form-control" id="paste_expiration" name='paste_expiration'>
            @foreach ($paste_expirations as $key=>$value)
                <option value='{{$key}}' {{ (old('paste_expiration') == $key)?'selected':''}}>{{$value}}</option>
            @endforeach
        </select>
    </div>

    <div class="form-group col-xs-4">
        <label for="paste_public">Paste exposure</label>
        <select class="form-control" id="paste_public" name='paste_public'>
        <option value='0' {{ (old('paste_public') == 0)?'selected':''}}>Public</option>
        <option value='1' {{ (old('paste_public') == 1)?'selected':''}}>Unlisted</option>
        <option value='2' {{ (old('paste_public') == 2)?'selected':''}}>Private</option>
        </select>
    </div>

    <div class="form-group col-xs-12">
        <input type="submit" name='submit' class="btn btn-success" value = "Submit"/>
    </div>
</form>
@endsection