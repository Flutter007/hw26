import 'package:flutter/material.dart';
import 'package:hw26/data/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final void Function() checkTask;
  final void Function() deleteTask;
  const TaskCard(
      {super.key,
      required this.task,
      required this.checkTask,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleMediumStyle = theme.textTheme.titleMedium!;
    return Card(
      elevation: 9.0,
      color: Colors.blue.shade100,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: checkTask,
                    icon: Icon(
                      task.isCompleted
                          ? Icons.check_box
                          : Icons.check_box_outline_blank_sharp,
                    )),
                Expanded(
                  child: Text(
                      textAlign: TextAlign.left,
                      task.title,
                      style: task.isCompleted
                          ? titleMediumStyle.copyWith(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough)
                          : titleMediumStyle),
                ),
                IconButton(
                    onPressed: deleteTask, icon: Icon(Icons.delete_outline)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
