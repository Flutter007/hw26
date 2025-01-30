import 'package:flutter/material.dart';
import 'package:hw26/data/task.dart';
import 'package:hw26/helpers/formatted_datetime.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final void Function() checkTask;
  final void Function() deleteTask;
  final void Function() checkDeadLine;
  final bool isDoneInTime;
  const TaskCard({
    super.key,
    required this.task,
    required this.checkTask,
    required this.deleteTask,
    required this.checkDeadLine,
    required this.isDoneInTime,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleMediumStyle = theme.textTheme.titleMedium!;
    final titleSmallStyle = theme.textTheme.titleSmall!;
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
                    onPressed: () {
                      checkTask();
                      checkDeadLine();
                    },
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  formattedDateTime(task.deadLine),
                  style: titleSmallStyle.copyWith(
                      color: task.isDoneInTime
                          ? Colors.green.shade600
                          : Colors.red.shade600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
