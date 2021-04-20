@extends('layouts.app')

@section('content')

<style>
    /* Overrides list-group-item from Bootstrap */ 
    .list-group-item {
        height:50px;
        padding: 10px 10px
    }
</style>


<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="col-mb-2 bordered">
                    <button type="button" class="btn btn-primary" onClick="window.location.href='{{ url('note/new') }}'">Add New Note</button>
                </div>
                <br/>
                <div class="card-body">
                    @if ( !$notes->count() )
                    There is no books till now.
                    @else
                    <div class="">
                        <ul class="list-group">
                            @foreach( $notes as $note )
                            <li class="list-group-item py-8">
                                <a href="{{ $note->paste_url }}" target='_blank'>{{ $note->paste_name }}</a>
                                {{ $note->created_at->format('M d,Y \a\t h:i a') }}

                                <button type="button" class="btn btn-default btn-sm pull-right" onClick="window.location.href='{{ url('note/delete/'.$note->paste_key)}}'">
                                    <span class="glyphicon glyphicon-trash"></span>Delete
                                </button>                      
                                <br>                                          
                            </li>
                            @endforeach
                        </ul>

                        <ul class="pagination">
                            @foreach( $links['links'] as $link )
                                @if($link['active'])
                                    <li class="page-item active" ><a class="page-link" href='#'>{!! $link['label'] !!}</a></li>
                                @else
                                    @if($link['url'])
                                        <li class="page-item"><a class="page-link" href='{{ $link['url'] }}'>{!! $link['label'] !!}</a></li>                                        
                                    @else
                                        <li class="page-item disabled" ><a class="page-link" href='#'>{!! $link['label'] !!}</a></li>
                                    @endif
                                @endif
                            </li>
                            @endforeach
                            <div>
                            Showing {{$links['from']}} to {{$links['to']}} of {{$links['total']}}
                            </div>

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
