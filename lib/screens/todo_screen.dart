import 'package:flutter/material.dart';
import 'package:hw26/model/task.dart';
import 'package:hw26/widget/task_card.dart';

class TodoScreen extends StatelessWidget {
  final List<Task> tasks;
  final void Function(Task) checkTask;
  final void Function(Task) deleteTask;
  final void Function(Task) checkDeadLine;
  final bool isDoneInTime;
  const TodoScreen(
      {super.key,
      required this.tasks,
      required this.checkTask,
      required this.deleteTask,
      required this.checkDeadLine,
      required this.isDoneInTime});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: tasks
            .map((task) => TaskCard(
                  task: task,
                  checkTask: () => checkTask(task),
                  deleteTask: () => deleteTask(task),
                  checkDeadLine: () => checkDeadLine(task),
                  isDoneInTime: task.isDoneInTime,
                ))
            .toList(),
      ),
    );
  }
}
