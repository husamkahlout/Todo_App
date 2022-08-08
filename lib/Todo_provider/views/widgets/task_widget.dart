import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Todo_provider/models/task_model.dart';
import '../../providers/db_provider.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;
  TaskWidget(this.taskModel);
  @override
  Widget build(BuildContext context) => Consumer<DbProvider>(
    builder: (context, provider, x) {
      return Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: CheckboxListTile(
            secondary: IconButton(
                onPressed: () {
                  provider.deleteTask(taskModel);
                },
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                )),
            value: taskModel.isComplete,
            onChanged: (v) {
              provider.updateTask(taskModel);
            },
            title: Text(taskModel.title!),
          ),
        );
    }
  );
  
}
