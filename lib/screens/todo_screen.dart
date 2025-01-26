import 'package:flutter/material.dart';
import 'package:hw26/data/task.dart';
import 'package:hw26/widget/task_card.dart';

class TodoScreen extends StatelessWidget {
  final List<Task> tasks;
  final void Function(Task) checkTask;
  final void Function(Task) deleteTask;
  const TodoScreen(
      {super.key,
      required this.tasks,
      required this.checkTask,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tasks
          .map((task) => TaskCard(
                task: task,
                checkTask: () => checkTask(task),
                deleteTask: () => deleteTask(task),
              ))
          .toList(),
    );
  }
}
