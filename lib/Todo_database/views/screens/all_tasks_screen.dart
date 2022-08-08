// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../data/data_repo.dart';
import '../widgets/task_widget.dart';


class AllTasksScreen extends StatelessWidget {
Function function, deleteFunction;
  AllTasksScreen(this.function,this.deleteFunction);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(tasks[index], function, deleteFunction);
        });
  }
}
