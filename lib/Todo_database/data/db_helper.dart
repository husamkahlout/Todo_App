import 'dart:developer';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../models/task_model.dart';


class DbHelper {
  DbHelper._();
  static DbHelper dbhelper = DbHelper._();
  static const String tableName = "tasks",
      taskIdColumName = 'id',
      taskNameColumName = 'taskName',
      taskIsCompleteColumName = 'taskComplete';
  Database? database;
  initDatabase() async {
    database = await createConnectionWithDatabase();
  }

  Future<Database> createConnectionWithDatabase() async {
    String databasePath = await getDatabasesPath();
    String databaseName = 'tasks.db';
    String fullPath = join(databasePath, databaseName);
    Database database =
        await openDatabase(fullPath, version: 1, onCreate: (db, i) {
      log('hello, the database has been created');

      db.execute('''
 CREATE TABLE $tableName (
  $taskIdColumName INTEGER PRIMARY KEY AUTOINCREMENT,
   $taskNameColumName TEXT,
    $taskIsCompleteColumName INTEGER)
''');
    }, onOpen: (db) async {
      final tables =
          await db.rawQuery('SELECT name FROM sqlite_master ORDER BY name;');
      log(tables.toString());
      log('hello, the database has been opened');
    });
    return database;
  }

  insertNewTask(TaskModel taskModel) async {
    int rowIndex = await database!.insert(tableName, taskModel.toMap());
    log(rowIndex.toString());
  }

  Future<List<TaskModel>> selectAllTasks() async {
    // fetch all rows from database as list of maps
    List<Map<String, Object?>> rowsAsMap = await database!.query(tableName);
    // convert list of maps to list of task models 
    List<TaskModel> tasks = rowsAsMap.map((e) => TaskModel.fromMap(e)).toList();
    return tasks;
  }
    selectOneTask(int id) {
    database!.query(tableName, where: '$taskIdColumName=?', whereArgs: [id]);
  }

  updateOneTask(TaskModel taskModel) async {
    int count = await database!.update(tableName, taskModel.toMap(),
        where: '$taskIdColumName=?', whereArgs: [taskModel.id]);
    log(count.toString());
  }

  deleteOneTask(int id) {
    database!.delete(tableName, where: '$taskIdColumName=?', whereArgs: [id]);
  }
}
