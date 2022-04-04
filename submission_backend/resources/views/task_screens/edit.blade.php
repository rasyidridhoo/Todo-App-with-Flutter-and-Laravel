<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>ToDo App</title>
</head>

<body>
    <div class="container mt-5 mr-5 ml-5">
        <form action="/tasks/{{$task->id}}" method="POST">
            @csrf
            @method('PUT')
            <div class="mb-3">
                <label class="mb-2">Nama Tugas</label>
                <input type="text" class="form-control" name="nama" value="{{$task->nama}}">
            </div>
            <div class="mb-3">
                <label class="mb-2">Deskripsi</label>
                <input type="text" class="form-control" name="deskripsi" value="{{$task->deskripsi}}">
            </div>
            <div class="mb-5">
                <label class="mb-2">Waktu</label>
                <input type="date" class="form-control" name="waktu" value="{{$task->waktu}}">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>

</html>