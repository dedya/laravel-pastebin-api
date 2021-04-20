<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

use App\Http\Requests\UserFormRequest;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    //only accessbile by admin
    public function logout(Request $request) {
        Auth::logout();
        return redirect('/auth/login');
    }

    public function index(){
        //fetch 5 posts from database which are active and latest
        $users = User::orderBy('name')->paginate(5);
        $title = 'Users';
  
        return view('users.list')->with('users',$users)->with('title',$title);
      }
  
      public function create(Request $request){           
            $title = 'Add New User';
            return view('users.create')->with('title',$title);
      }
  
      public function edit(Request $request,$id){
          $title = 'Edit User';
          $user = User::where('id',$id)
              ->first();
          if($user)
              return view('users.edit')->with('user',$user)->with('title',$title);
          return redirect('user')->withErrors('Invalid user id');
      }
      
      public function store(UserFormRequest $request){
          $user = new User();
          $user->name = $request->get('name');
          $user->email = $request->get('email');
          $user->active = 1;
          $user->created_at = date("Y-m-d H:i:s");
          $user->updated_at = date("Y-m-d H:i:s");
          $user->password = Hash::make($request->get('password'));
       
          $duplicate = User::where('email', $user->email)->first();
          if ($duplicate) {
              return redirect('user/new')->withErrors('User already exists.')->withInput();
          }
    
          $message = 'User saved successfully';
          $user->save();
          return redirect('user/edit/' . $user->id)->withMessage($message);
      }
  
      public function show($id){
          $book = Books::where('id',$id)->first();
          if(!$book){
              return redirect('/book')->withErrors('requested page not found');
          }
          return view('books.show')->with('book',$book);
      }
  
      public function update(Request $request){
        $user_id = $request->input('id');
        $user= User::find($user_id);
        if ($user) {
          $email = $request->get('email');
          $password = $request->get('password');
          $duplicate = User::where('email', $email)->first();
          
          if ($duplicate) {
             if ($duplicate->id != $user_id) {
                  return redirect('user/edit/' . $book->id)->withErrors('User already exists.')->withInput();
              } 
          }
    
          $user->name = $request->get('name');
          $user->email = $request->get('email');
          $user->role = $request->get('role');
          $user->updated_at = date("Y-m-d H:i:s");

          if($password)
              $user->password = Hash::make($password);

          $message = 'User saved successfully';
          $landing = 'user/edit/' . $user->id;
          $user->save();
          return redirect($landing)->withMessage($message);
        } else {
          return redirect('/user')->withErrors('No user found');
        }
      }
  
      public function destroy(Request $request, $id){
          $user = User::find($id);
          if($user){
              $user->delete();
              $data['message'] = 'User '.$user->name.' is deleted Successfully';
          }else {
              $data['errors'] = 'Invalid User';
          }
          return redirect('/user')->with($data);
      }

      
}
