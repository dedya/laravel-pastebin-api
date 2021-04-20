@extends('layouts.app')

@section('content')
<form method="post" action='{{ url("/book/update") }}'>

    <input type="hidden" name="_token" value="{{ csrf_token() }}">
    <input type="hidden" name="id" value="{{ $book->id }}{{ old('id') }}">

    <div class="form-group col-xs-4">
        <label for="name">Book Title</label>
        <input required="required" value="@if(!old('name')){{$book->name}}@endif{{ old('name') }}" placeholder="Enter title here" type="text" name="name"class="form-control" />
    </div>

    <div class="form-group col-xs-4">
        <label for="name">Author</label>
        <select name="author_id" id="author_id" placeholder="Please Select Author" class="form-control" >
            <option value=""></option>
            @foreach( $authors as $key=>$author )
            <option value="{{$author->id}}" 
                @if(old('author_id') && old('author_id') == $key)
                    selected
                @elseif ($author->id == $book->author_id)
                    selected
                @endif

                >{{$author->name}}</option>
            @endforeach
        </select>
    </div>
    <div class="form-group col-xs-12">
        <input type="submit" name='submit' class="btn btn-success" value = "Submit"/>
    </div>
</form>
@endsection