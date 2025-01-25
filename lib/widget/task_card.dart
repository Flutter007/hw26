import 'package:flutter/material.dart';
import 'package:hw26/data/task.dart';

class TaskCard extends StatelessWidget {
  final Task tasks;
  const TaskCard({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                tasks.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
