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
    <div class="container mt-5">
        <table class="table">
            <a href="/tasks/create"><button type="button" class="btn btn-primary">Tambah Task</button></a><br><br>
            <thead>

                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Nama Tugas</th>
                    <th scope="col">Deskripsi</th>
                    <th scope="col">Waktu</th>
                    <th scope="col" colspan="2">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $no = 0;
                ?>
                @foreach($tasks as $task)
                <?php
                $no++;
                ?>
                <tr>
                    <th scope="row"><?php echo $no ?></th>
                    <td>{{$task -> nama}}</td>
                    <td>{{$task -> deskripsi}}</td>
                    <td>{{$task -> waktu}}</td>
                    <td>
                        <a href="/tasks/{{$task->id}}/edit"><button type="button" class="btn btn-success">Edit</button></a>
                    </td>
                    <td>
                        <form action="/tasks/{{$task->id}}" method="POST">
                            @csrf
                            @method('DELETE')
                            <input type="submit" value="Hapus" class="btn btn-danger">
                        </form>
                    </td>
                </tr>

                @endforeach

            </tbody>

        </table>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>

</html>