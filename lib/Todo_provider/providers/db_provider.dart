import 'package:flutter/material.dart';
import 'package:todo_app/Todo_provider/models/task_model.dart';
import 'package:todo_app/Todo_provider/data/db_helper.dart';

class DbProvider extends ChangeNotifier {
  DbProvider() {
    selectAllTasks();
  }
  List<TaskModel> allTasks = [];
  List<TaskModel> completeTasks = [];
  List<TaskModel> inCompleteTasks = [];
  // distribute all tasks from database from selectAllTask Function into these lists of tasks
  fillTasks(List<TaskModel> tasks) {
    allTasks = tasks;
    completeTasks   = tasks.where((element) => element.isComplete).toList();
    inCompleteTasks = tasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }

  createNewTask(TaskModel taskModel) {
    DbHelper.dbhelper.insertNewTask(taskModel);
    selectAllTasks();
  }

  selectAllTasks() async {
    List<TaskModel> tasks = await DbHelper.dbhelper.selectAllTasks();
    fillTasks(tasks);
  }

  deleteTask(TaskModel taskModel) async {
    await DbHelper.dbhelper.deleteOneTask(taskModel.id!);
    selectAllTasks();
  }

  updateTask(TaskModel taskModel) async {
    taskModel.isComplete = !taskModel.isComplete;
    await DbHelper.dbhelper.updateOneTask(taskModel);
    selectAllTasks();
  }
}

