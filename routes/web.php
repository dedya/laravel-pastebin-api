<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\BookController;
use App\Http\Controllers\AuthorController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/logout', 'App\Http\Controllers\UserController@logout');
Route::group(['prefix' => 'auth'], function () {
  Auth::routes();
});

// check for logged in user
Route::middleware('role:admin,user')->group(function () {
//Route::middleware(['auth'])->group(function () {
    Route::get('/', 'App\Http\Controllers\NoteController@index');
    Route::get('home', 'App\Http\Controllers\NoteController@index');
    Route::prefix('note')->group(function () {
        Route::get('/', 'App\Http\Controllers\NoteController@index');
        Route::get('new', 'App\Http\Controllers\NoteController@create');
        Route::post('new', 'App\Http\Controllers\NoteController@store');
        Route::get('edit/{id}', 'App\Http\Controllers\NoteController@edit');
        Route::post('update', 'App\Http\Controllers\NoteController@update');
        Route::get('delete/{id}', 'App\Http\Controllers\NoteController@destroy');    
    });
});

Route::middleware('role:admin')->group(function () {
//Route::middleware(['auth'])->group(function () {
    Route::prefix('user')->group(function () {
        Route::get('/', [UserController::class,'index']);
        Route::get('new', 'App\Http\Controllers\UserController@create');
        Route::post('new', [UserController::class, 'store']);
        Route::get('edit/{id}', 'App\Http\Controllers\UserController@edit');
        Route::post('update', 'App\Http\Controllers\UserController@update');
        Route::get('delete/{id}', 'App\Http\Controllers\UserController@destroy');    
    });
});


 


Auth::routes();

//Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
