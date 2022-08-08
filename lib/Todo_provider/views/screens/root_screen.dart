import 'package:flutter/material.dart';
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

  TabController? tabController;
  initTabBar() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  // once the application starts do this
  void initState() {
    super.initState();
    initTabBar();
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
                      NewTaskScreen())));
        },
      ),
      body: TabBarView(controller: tabController!, children: [
        AllTasksScreen(),
        CompleteTasksScreen(),
        InCompleteTasksScreen(),
      ]),
    );
  }
}
