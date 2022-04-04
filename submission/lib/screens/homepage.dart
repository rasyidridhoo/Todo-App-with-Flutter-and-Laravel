import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:submission/screens/add_task.dart';
import 'package:http/http.dart' as http;
import 'package:submission/screens/edit_task.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'http://127.0.0.1:8000/api/tasks';

  Future getTask() async {
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  Future deleteTask(String taskId) async {
    String url = 'http://127.0.0.1:8000/api/tasks/' + taskId;
    var response = await http.delete(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddTask();
          }));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: FutureBuilder(
        future: getTask(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: (snapshot.data as dynamic)['data'].length,
                itemBuilder: (context, index) {
                  return SafeArea(
                    child: Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                        child: Card(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            (snapshot.data as dynamic)['data']
                                                [index]['nama'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        PopupMenuButton(
                                            iconSize: 20,
                                            itemBuilder: (context) {
                                              return [
                                                PopupMenuItem(
                                                    child: TextButton(
                                                  onPressed: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return EditTask(
                                                        task: (snapshot.data
                                                                as dynamic)[
                                                            'data'][index],
                                                      );
                                                    }));
                                                  },
                                                  child: Container(
                                                    width: 50,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'Edit',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                                PopupMenuItem(
                                                    child: TextButton(
                                                  onPressed: () {
                                                    deleteTask((snapshot.data
                                                                    as dynamic)[
                                                                'data'][index]['id']
                                                            .toString())
                                                        .then((value) {
                                                      setState(() {});
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  'Delete Success!')));
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 50,
                                                    child: Text(
                                                      'Hapus',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                )),
                                              ];
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 8, right: 30),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Expanded(
                                      child: Text(
                                          (snapshot.data as dynamic)['data']
                                              [index]['deskripsi']),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15.0,
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            (snapshot.data as dynamic)['data']
                                                [index]['waktu'],
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                        CheckButton(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: Text('Not Found'),
            );
          }
        },
      ),
    );
  }
}

class CheckButton extends StatefulWidget {
  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isCheck ? Icons.check_box : Icons.check_box_outline_blank,
        size: 20,
        color: Colors.blue,
      ),
      onPressed: () {
        setState(() {
          isCheck = !isCheck;
        });
      },
    );
  }
}
