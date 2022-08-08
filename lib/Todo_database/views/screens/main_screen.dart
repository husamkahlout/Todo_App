import 'package:flutter/material.dart';
import '../../data/data_repo.dart';
import '../../data/db_helper.dart';
import '../../models/task_model.dart';
import 'all_tasks_screen.dart';
import 'completed_tasks_screen.dart';
import 'incomplete_tasks_screen.dart';
import 'new_task_screen.dart';

class MainTodoPage extends StatefulWidget {
  @override
  State<MainTodoPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainTodoPage>
    with SingleTickerProviderStateMixin {
  getAllTasks() async {
    tasks = await DbHelper.dbhelper.selectAllTasks();
    setState(() {});
  }

  changeTaskStatus(TaskModel taskModel) {
    int index = tasks.indexOf(taskModel);
    tasks[index].isComplete = !tasks[index].isComplete;
    DbHelper.dbhelper.updateOneTask(taskModel);
    setState(() {});
  }

  removeTask(TaskModel taskModel) {
    tasks.remove(taskModel);
    DbHelper.dbhelper.deleteOneTask(taskModel.id!);
    setState(() {});
  }

  setStateAfterAddNewTask() {
    setState(() {});
  }

  TabController? tabController;
  initTabBar() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  // once the application starts do this
  void initState() {
    super.initState();
    initTabBar();
    getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo app'),
        bottom: TabBar(controller: tabController!, tabs: const [
          Tab(
            icon: Icon(Icons.list),
          ),
          Tab(
            icon: Icon(Icons.done),
          ),
          Tab(
            icon: Icon(Icons.cancel),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) =>
                      NewTaskScreen(setStateAfterAddNewTask))));
        },
      ),
      body: TabBarView(controller: tabController!, children: [
        AllTasksScreen(changeTaskStatus,removeTask),
        CompleteTasksScreen(changeTaskStatus,removeTask),
        InCompleteTasksScreen(changeTaskStatus,removeTask)
      ]),
    );
  }
}
