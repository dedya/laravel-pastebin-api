@extends('layouts.app')

@section('content')
<div class='row'>
    <form method="post" action='{{ url("/author/update") }}'>

        <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <input type="hidden" name="id" value="{{ $author->id }}{{ old('id') }}">

        <div class="form-group col-xs-4">
            <label for="name">Author Name</label>
            <input required="required" value="@if(!old('name')){{$author->name}}@endif{{ old('name') }}" placeholder="Enter Name here" type="text" name="name"class="form-control" />
        </div>


        <div class="form-group col-xs-12">
            <input type="submit" name='submit' class="btn btn-success" value = "Submit"/>
        </div>
    </form>
</div>
@if(count($books))
<div class="">
    <ul class="list-group">
        @foreach( $books as $book )
        <li class="list-group-item py-8">
            <a href="{{ url('book/edit/'.$book->id)}}" target="_blank">{{ $book->name}}</a>                                          
        </li>
        @endforeach
    </ul>
</div>
@endif

@endsection