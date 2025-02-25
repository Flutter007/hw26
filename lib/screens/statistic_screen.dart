import 'package:flutter/material.dart';
import 'package:hw26/model/task.dart';
import 'package:hw26/model/task_expense.dart';
import 'package:hw26/widget/statistics/tasks_chart.dart';

class StatisticScreen extends StatelessWidget {
  final List<Task> tasks;
  const StatisticScreen({super.key, required this.tasks});

  List<TaskExpense> get taskExpense {
    final List<TaskExpense> taskExpense = [];
    final now = DateTime.now();

    for (var i = 0; i < 7; i++) {
      final date = now.subtract(Duration(days: i));
      int counter = 0;

      for (var task in tasks) {
        if (task.isCompleted && task.finalTime!.day == date.day) {
          counter++;
        }
      }

      taskExpense.add(TaskExpense(
        dateTime: date,
        counter: counter,
      ));
    }

    return taskExpense.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return TasksChart(
      expenses: taskExpense,
    );
  }
}
