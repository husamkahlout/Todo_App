import 'package:flutter/material.dart';
import '../../models/task_model.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;
  Function function, deleteFunction;
  TaskWidget(this.taskModel, this.function, this.deleteFunction);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: CheckboxListTile(
        secondary: IconButton(
            onPressed: () {
              deleteFunction(taskModel);
            },
            icon: Icon(
              Icons.delete,
            )),
        value: taskModel.isComplete,
        onChanged: (v) {
          function(taskModel);
        },
        title: Text(taskModel.title!),
      ),
    );
  }
}
