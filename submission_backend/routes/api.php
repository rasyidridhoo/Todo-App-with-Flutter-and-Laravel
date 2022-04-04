<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TaskApiController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Show
Route::get('/tasks', [TaskApiController::class, 'index']);
Route::get('/tasks/show/{id}', [TaskApiController::class, 'show']);

//Create
Route::post('/tasks', [TaskApiController::class, 'posting']);

//Update
Route::put('/tasks/{id}', [TaskApiController::class, 'update']);

//Delete
Route::delete('/tasks/{id}', [TaskApiController::class, 'delete']);
