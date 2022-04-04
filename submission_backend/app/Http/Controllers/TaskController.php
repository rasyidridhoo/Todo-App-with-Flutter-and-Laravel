<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Task;

class TaskController extends Controller
{
    public function index()
    {
        $tasks = Task::orderBy('waktu', 'asc')->get();
        return view('task_screens.index', compact(['tasks']));
    }

    public function create()
    {
        return view('task_screens.create');
    }

    public function posting(Request $request)
    {
        Task::create($request->all());
        return redirect('/tasks');
    }

    public function edit($id)
    {
        $task = Task::find($id);
        return view('task_screens.edit', compact(['task']));
    }

    public function update(Request $request, $id)
    {
        $task = Task::find($id);
        $task->update($request->all());
        return redirect('/tasks');
    }

    public function delete($id)
    {
        $task = Task::find($id);
        $task->delete();
        return redirect('/tasks');
    }
}
