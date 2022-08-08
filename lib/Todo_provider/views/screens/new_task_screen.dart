import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Todo_provider/providers/db_provider.dart';
import '../../models/task_model.dart';

class NewTaskScreen extends StatelessWidget {
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
            Consumer<DbProvider>(
              builder: (context,provider,x) {
                return ElevatedButton(
                    onPressed: () async {
                      TaskModel taskModel = TaskModel(title: content);
                      await provider.createNewTask(taskModel);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add New Task'));
              }
            )
          ],
        ));
  }
}
