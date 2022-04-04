import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:submission/screens/homepage.dart';

class EditTask extends StatelessWidget {
  final Map task;
  EditTask({required this.task});
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameTask = TextEditingController();

  TextEditingController _dateTask = TextEditingController();

  TextEditingController _descriptionTask = TextEditingController();

  updateTask() async {
    final response = await http.put(
        Uri.parse('http://127.0.0.1:8000/api/tasks/' + task['id'].toString()),
        body: {
          "nama": _nameTask.text,
          "deskripsi": _descriptionTask.text,
          "waktu": _dateTask.text
        });

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Card(
            margin: EdgeInsets.all(10),
            child: Container(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameTask..text = task['nama'],
                    decoration: InputDecoration(
                        labelText: 'Edit task name',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please, input task name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _descriptionTask..text = task['deskripsi'],
                    decoration: InputDecoration(
                        labelText: 'Edit task description ',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please, input task description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _dateTask..text = task['waktu'],
                    decoration: InputDecoration(
                      labelText: 'Edit task date',
                      hintText: 'yyyy-mm-dd',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please, input task date';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        updateTask().then((value) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Update Success!')));
                        });
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(10), child: Text('Update')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
