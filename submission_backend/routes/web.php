<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TaskController;

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

//Show
Route::get('/tasks', [TaskController::class, 'index']);

//Create
Route::get('/tasks/create', [TaskController::class, 'create']);
Route::post('/tasks/create', [TaskController::class, 'posting']);

//Update
Route::get('/tasks/{id}/edit', [TaskController::class, 'edit']);
Route::put('/tasks/{id}', [TaskController::class, 'update']);

//Delete
Route::delete('/tasks/{id}', [TaskController::class, 'delete']);
