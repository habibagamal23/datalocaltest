import 'package:flutter/material.dart';
import 'package:localdata_app/features/home/widgets/todo_card.dart';
import 'package:provider/provider.dart';
import '../../../core/provider_task.dart';

class Note extends StatelessWidget {
  const Note({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF180e2b),
      body: taskProvider.tasks.isEmpty
          ? const Center(
        child: Text(
          "Welcome, add your task",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
          : ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
          final task = taskProvider.tasks[index];
          return TodoCard(
            title: task['title'] ?? '',
            dis: task['dis'] ?? '',
            time: task['time'] ?? '',
            date: task['date'] ?? '',
            onDelete: () =>
                taskProvider.deleteTask(task['id']),
          );
        },
      ),
    );
  }
}
