import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hw26/model/task.dart';
import 'package:hw26/widget/task_card.dart';

class TodoScreen extends StatelessWidget {
  final List<Task> tasks;
  final void Function(Task) checkTask;
  final void Function(String id) deleteTask;
  final void Function(Task) checkDeadLine;
  final void Function(String id) onTaskEdited;
  final bool isDoneInTime;
  const TodoScreen(
      {super.key,
      required this.tasks,
      required this.checkTask,
      required this.deleteTask,
      required this.checkDeadLine,
      required this.isDoneInTime,
      required this.onTaskEdited});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          final task = tasks[index];
          return Slidable(
            endActionPane: ActionPane(
              extentRatio: 0.45,
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (ctx) => deleteTask(task.id),
                  icon: Icons.delete,
                  borderRadius: BorderRadius.circular(15),
                  label: 'Delete',
                  backgroundColor: theme.colorScheme.error,
                  padding: EdgeInsets.all(15),
                ),
                SlidableAction(
                  onPressed: (ctx) => onTaskEdited(task.id),
                  icon: Icons.edit,
                  borderRadius: BorderRadius.circular(15),
                  label: 'Edit',
                  backgroundColor: theme.colorScheme.secondary,
                  padding: EdgeInsets.all(10),
                ),
              ],
            ),
            child: TaskCard(
                task: task,
                checkTask: () => checkTask(task),
                checkDeadLine: () => checkDeadLine(task),
                isDoneInTime: task.isDoneInTime),
          );
        },
        itemCount: tasks.length,
      ),
    );
  }
}
