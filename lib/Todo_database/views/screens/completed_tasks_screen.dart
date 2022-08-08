import 'package:flutter/material.dart';
import '../../data/data_repo.dart';
import '../widgets/task_widget.dart';

class CompleteTasksScreen extends StatelessWidget {
  Function function, deleteFunction;
  CompleteTasksScreen(this.function, this.deleteFunction);
  @override
  Widget build(BuildContext context) {
    return tasks.where((element) => element.isComplete).isEmpty
        ? Center(child: Text("No Tasks Found"))
        : ListView.builder(
            itemCount: tasks.where((element) => element.isComplete).length,
            itemBuilder: (context, index) {
              return TaskWidget(
                  tasks.where((element) => element.isComplete).toList()[index],
                  function,
                  deleteFunction);
            });
  }
}
