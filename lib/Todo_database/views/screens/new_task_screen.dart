import 'package:flutter/material.dart';
import '../../data/data_repo.dart';
import '../../data/db_helper.dart';
import '../../models/task_model.dart';

class NewTaskScreen extends StatelessWidget {
  Function function;
  NewTaskScreen(this.function);
  String content = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              onChanged: (v) {
                content = v;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  DbHelper.dbhelper.insertNewTask(TaskModel(title: content));
                  Navigator.pop(context);
                },
                child: Text('Add New Task'))
          ],
        ));
  }
}
