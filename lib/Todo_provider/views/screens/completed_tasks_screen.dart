import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Todo_provider/models/task_model.dart';
import '../../providers/db_provider.dart';
import '../widgets/task_widget.dart';

class CompleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* 
  selectors used to listen to state of custom variable in privider so when the 
  variable changed the slector do setState == reset the widgets
    */
    return Selector<DbProvider, List<TaskModel>>(
      selector: (context, provider) {
      return provider.completeTasks;
      },
      builder: (context, completeTasksVariable, x) {
        return completeTasksVariable.where((element) => element.isComplete).isEmpty
            ? const Center(child: Text("No Tasks Found"))
            : ListView.builder(
                itemCount: completeTasksVariable.length,
                itemBuilder: (context, index) {
                  return TaskWidget(
                      completeTasksVariable[index]);
                });
      }
    );
  }
}
