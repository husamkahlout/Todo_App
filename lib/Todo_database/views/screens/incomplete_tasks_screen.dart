import 'package:flutter/material.dart';
import '../../data/data_repo.dart';
import '../widgets/task_widget.dart';

class InCompleteTasksScreen extends StatelessWidget {
 Function function, deleteFunction;
  InCompleteTasksScreen(this.function,this.deleteFunction);
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: tasks.where((element) => !element.isComplete).length,
        itemBuilder: (context, index) {
          return TaskWidget(
              tasks.where((element) => !element.isComplete).toList()[index],
              function,deleteFunction);
        });
  }
}
