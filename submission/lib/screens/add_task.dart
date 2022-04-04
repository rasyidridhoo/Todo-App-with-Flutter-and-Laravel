import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:submission/screens/homepage.dart';

class AddTask extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameTask = TextEditingController();

  TextEditingController _dateTask = TextEditingController();

  TextEditingController _descriptionTask = TextEditingController();

  saveTask() async {
    final response =
        await http.post(Uri.parse('http://127.0.0.1:8000/api/tasks'), body: {
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
        title: Text('Add Task'),
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
                    controller: _nameTask,
                    decoration: InputDecoration(
                        labelText: 'Add task name',
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
                    controller: _descriptionTask,
                    decoration: InputDecoration(
                        labelText: 'Add task description ',
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
                    controller: _dateTask,
                    decoration: InputDecoration(
                      labelText: 'Add task date',
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
                        saveTask().then((value) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));

                          ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                              SnackBar(content: Text('Create Success!')));
                        });
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(10), child: Text('Save')),
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
