<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;

class TaskApiController extends Controller
{
    public function index()
    {
        $tasks = Task::orderBy('waktu', 'asc')->get();
        return response()->json(['message' => 'success', 'data' => $tasks]);
    }

    public function show($id)
    {
        $task = Task::find($id);
        return response()->json(['message' => 'Success', 'data' => $task]);
    }

    public function posting(Request $request)
    {
        $task = Task::create($request->all());
        return response()->json(['message' => 'Success', 'data' => $task]);
    }


    public function update(Request $request, $id)
    {
        $task = Task::find($id);
        $task->update($request->all());
        return response()->json(['message' => 'Success', 'data' => $task]);
    }

    public function delete($id)
    {
        $task = Task::find($id);
        $task->delete();
        return response()->json(['message' => 'Success', 'data' => null]);
    }
}
