<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

use App\Models\Notes;

use App\Http\Requests\NoteFormRequest;

use Config;

class NoteController extends Controller
{
    public function index(){
        $title = "Notes List";
        $notes = Notes::orderBy('notes.created_at')->paginate(5);
        $links = $notes->toArray();
    
        return view('notes.list')->with('title',$title)->with('notes',$notes)->with('links',$links);
    }

    public function create(Request $request){
        $title = 'Add New Note';

        $paste_expirations = config('notes.paste_expiration');

        //get list of notes
        return view('notes.create')->with('title',$title)->with('paste_expirations',$paste_expirations);
    }

    public function edit(Request $request,$id){
        $title = 'Edit Notes';
        $authors = Author::orderBy('name')->get();
        $book = Books::where('books.id',$id)
            ->join('authors','authors.id','=','books.author_id')
            ->select('books.*','authors.name as author_name','authors.id as author_id')        
            ->first();
        if($book)
            return view('books.edit')->with('book',$book)->with('title',$title)->with('authors',$authors);
        return redirect('book')->withErrors('Invalid book id');
    }
    
    public function store(NoteFormRequest $request){
        $post = new Notes();
        $post->paste_code = $request->post('paste_code');
        $post->paste_name = $request->post('paste_name');
        $post->paste_expiration = $request->get('paste_expiration');
        $post->paste_public = $request->get('paste_public');

        //post to pastebin to get paste url
        $post->paste_url = $request->get('paste_url');
        $api_dev_key 			= config('notes.api_dev_key');
        $api_paste_code 		= urlencode($request->post('paste_code'));
        $api_paste_private 		= $request->get('paste_public');
        $api_paste_name			= urlencode($request->post('paste_name'));
        $api_paste_expire_date 		=  $request->get('paste_expiration');
        $api_user_key 			= config('notes.user_api_key');
        $url 				    = config('notes.api_base_url').'/api_post.php';
        
        $params = [
            'api_dev_key'               => $api_dev_key
            ,'api_paste_code'           => $api_paste_code
            ,'api_paste_private'        => $api_paste_private
            ,'api_paste_name'           => $api_paste_name
            ,'api_paste_expire_date'    => $api_paste_expire_date
            ,'api_option'               => 'paste'
            ,'api_user_key'             => $api_user_key
        ];

        $response = Http::asForm()->post($url, $params);
        if($response->successful()){            
            $post->paste_url = $response->body();
            $post->paste_key 			= str_replace("https://pastebin.com/", "",  $post->paste_url);
        }else{
            echo $response->status();
            exit;
        }


        $message = 'Note saved successfully';
        $post->save();
        return redirect('note')->withMessage($message);
    }

 
    public function destroy(Request $request, $id){
        $note = Notes::where("paste_key",'=',$id)->first();
        if($note){
            $note->delete();
            $data['message'] = 'Note '.$note->paste_name.' is deleted Successfully';
        }else {
            $data['errors'] = 'Invalid Note';
        }
        return redirect('/note')->with($data);
    }

}
