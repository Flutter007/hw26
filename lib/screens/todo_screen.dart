import 'package:flutter/material.dart';
import 'package:hw26/data/task.dart';
import 'package:hw26/widget/task_card.dart';

class TodoScreen extends StatelessWidget {
  final List<Task> tasks;
  const TodoScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tasks.map((task) => TaskCard(tasks: task)).toList(),
    );
  }
}
