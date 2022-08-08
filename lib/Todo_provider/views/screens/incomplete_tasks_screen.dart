import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/db_provider.dart';
import '../widgets/task_widget.dart';

class InCompleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DbProvider>(builder: (context, provider, x) {
      return ListView.builder(
          itemCount: provider.inCompleteTasks.length,
          itemBuilder: (context, index) {
            return TaskWidget(provider.inCompleteTasks[index]);
          });
    });
  }
}
