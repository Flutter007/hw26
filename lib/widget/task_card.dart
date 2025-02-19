import 'package:flutter/material.dart';
import 'package:hw26/model/task.dart';
import 'package:hw26/helpers/formatted_datetime.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final void Function() checkTask;
  final void Function() checkDeadLine;
  final bool isDoneInTime;

  const TaskCard({
    super.key,
    required this.task,
    required this.checkTask,
    required this.checkDeadLine,
    required this.isDoneInTime,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleMediumStyle = theme.textTheme.titleMedium!;
    final category = task.category;
    bool isUrgent = category.label == 'Urgent';
    bool isNotNull = task.deadLine != null;
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
                  ),
                ),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.left,
                    task.title,
                    style: task.isCompleted
                        ? titleMediumStyle.copyWith(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough)
                        : titleMediumStyle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      category.icon,
                      size: 24,
                      color: isUrgent
                          ? theme.colorScheme.error
                          : theme.colorScheme.tertiary,
                    ),
                    SizedBox(width: 5),
                    Text(
                      category.label,
                      style: isUrgent
                          ? titleMediumStyle.copyWith(
                              color: Colors.red.shade900,
                            )
                          : titleMediumStyle,
                    ),
                  ],
                ),
                Text(
                  isNotNull ? formattedDateTime(task.deadLine) : 'No deadline',
                  style: titleMediumStyle.copyWith(
                    color: task.isCompleted && isNotNull
                        ? (task.isDoneInTime
                            ? Colors.green.shade600
                            : Colors.red.shade600)
                        : Colors.grey.shade700,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
