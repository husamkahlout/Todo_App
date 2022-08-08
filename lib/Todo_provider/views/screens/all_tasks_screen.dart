import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Todo_provider/views/widgets/task_widget.dart';
import '../../providers/db_provider.dart';

class AllTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DbProvider>(builder: (context, provider, x) {
      return ListView.builder(
          itemCount: provider.allTasks.length,
          itemBuilder: (context, index) {
            return TaskWidget(provider.allTasks[index]);
          });
    });
  }
}
