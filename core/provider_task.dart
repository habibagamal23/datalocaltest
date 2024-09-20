import 'package:flutter/cupertino.dart';
import 'local_data.dart'; // Ensure that this file contains your database functions

class TaskProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _tasks = [];

  List<Map<String, dynamic>> get tasks => _tasks;

  // Load tasks from the database
  Future<void> loadTask() async {
    try {
      _tasks = await getDataBase(); // Load tasks from database
      notifyListeners(); // Notify listeners to update UI
    } catch (e) {
      print("Error loading tasks: $e");
    }
  }

  // Add a new task to the database
  Future<void> addTask(
      String title, String dis, String time, String date) async {
    try {
      await insertDataBase(
        title: title,
        dis: dis,
        time: time,
        date: date,
      );
      await loadTask(); // Reload tasks after insertion
    } catch (e) {
      print("Error adding task: $e");
    }
  }

  // Delete a task from the database
  Future<void> deleteTask(int id) async {
    try {
      await deleteDataBase(id); // Delete task by ID
      await loadTask(); // Reload tasks after deletion
    } catch (e) {
      print("Error deleting task: $e");
    }
  }

// Delete all tasks from the database
  Future<void> deleteAllTasks() async {
    try {
    await deleteAllTasks(); // Call the method to delete all tasks in the database
      _tasks.clear(); // Clear the local task list
      notifyListeners(); // Notify listeners to update UI
    } catch (e) {
      print("Error deleting all tasks: $e");
    }
  }
}
