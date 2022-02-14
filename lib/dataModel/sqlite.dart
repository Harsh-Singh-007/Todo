import 'package:sqflite/sqflite.dart';
import 'package:todo/task.dart';
import 'package:sqflite/sql.dart';
import 'package:path/path.dart';

class SQliteDB {
  static Database? _db;

  static Future<Database> get db async {
    //Checking if the db is empty or not if empty then running the initDb method.
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  //Initalise DB
  static initDb() async {
    String folderPath = await getDatabasesPath();
    String path = join(folderPath, "todo.db");
    var taskDb = await openDatabase(
      path,
      version: 1,
      onCreate: (
        Database db,
        int t,
      ) async {
        await db.execute(
            'CREATE TABLE TASK (id INTEGER PRIMARY KEY, taskListID INTEGER, parentTaskID INTEGER, deadlineTime INTEGER, isFinished INTEGER, isRepeating INTEGER)');
      },
    );
    _db = taskDb;
    return taskDb;
  }

  static Future<int?> insetTask(Map<String, dynamic> taskData) async {
    var dbClient = await db;
    int id = await dbClient.insert("Task", taskData, nullColumnHack: "taskID");
    if (id != 0) {
      return id;
    } else {
      return null;
    }
  }

  static Future<List<Task>?> getAllTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> taskListFromDB = await dbClient.query("Task");
    List<Task> taskListAsObject = [];
    for (var map in taskListFromDB) {
      print(map);
      taskListAsObject.add(Task.fromMap(map));
    }
    return (taskListAsObject);
    /*var taskListInMemory = taskListFromDB.map((t) => Task.fromMap(t)).toList();
    return (taskListInMemory);*/
  }
}
