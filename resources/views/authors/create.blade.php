@extends('layouts.app')

@section('content')

<form action="/author/new" method="post">

    <input type="hidden" name="_token" value="{{ csrf_token() }}">

    <div class="form-group col-xs-4">
        <label for="name">Author Name</label>
        <input required="required" value="{{ old('name') }}" placeholder="Enter title here" type="text" name="name"class="form-control" />
    </div>

    <div class="form-group col-xs-12">
        <input type="submit" name='submit' class="btn btn-success" value = "Submit"/>
    </div>
</form>

@endsection