import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

late Database database;

Future<void> createDatabase() async {
  var databasePath = await getDatabasesPath();
  String path = join(databasePath, 'todos.db');

  // open the database
  database = await openDatabase(path, version: 1,
      //create
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE Todo (id INTEGER PRIMARY KEY, title TEXT, dis TEXT, time TEXT, date TEXT, status TEXT)')
            .then((value) {
          print("Table created");
        }).catchError((error) {
          print("Error creating table: $error");
        });
      },
      onOpen: (db) {
        print("Database opened");
      });
}

Future<void> insertDataBase({
  required String title,
  required String dis,
  required String time,
  required String date,
}) async {
  // Using the already opened database
  await database.insert('Todo', {
    'title': title,
    'dis': dis,
    'time': time,
    'date': date,
    'status': 'NotDone', // Default status as NotDone
  }).then((value) {
    print("Data inserted: $value");
  }).catchError((error) {
    print("Error inserting data: $error");
  });
}

Future<void> updateDataBase({
  required int id,
  required String title,
  required String dis,
  required String time,
  required String date,
}) async {
  await database.rawUpdate(
    'UPDATE Todo SET title = ?, dis = ?, time = ?, date = ? WHERE id = ?',
    [title, dis, time, date, id],
  ).then((value) {
    print("Data updated for id $id");
  }).catchError((error) {
    print("Error updating data: $error");
  });
}

Future<void> updateStatus(int id, String status) async {
  await database.rawUpdate(
    'UPDATE Todo SET status = ? WHERE id = ?',
    [status, id],
  ).then((value) {
    print("Status updated for id $id");
  }).catchError((error) {
    print("Error updating status: $error");
  });
}

Future<void> deleteDataBase(int id) async {
  await database.rawDelete(
    'DELETE FROM Todo WHERE id = ?',
    [id],
  ).then((value) {
    print("Data deleted for id $id");
  }).catchError((error) {
    print("Error deleting data: $error");
  });
}

Future<List<Map<String, dynamic>>> getDataBase() async {
  return await database.rawQuery('SELECT * FROM Todo').then((value) {
    print("Fetched data: $value");
    return value;
  }).catchError((error) {
    print("Error fetching data: $error");
    return [];
  });
}

Future<void> deleteAllTasks() async {
  await database.rawDelete('DELETE FROM Todo');
  print("All tasks deleted");
}
