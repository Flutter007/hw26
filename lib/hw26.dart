import 'package:flutter/material.dart';
import 'package:hw26/model/task.dart';
import 'package:hw26/screens/todo_screen.dart';
import 'package:hw26/widget/add_task.dart';

class Hw26 extends StatefulWidget {
  const Hw26({super.key});

  @override
  State<Hw26> createState() => _Hw26State();
}

class _Hw26State extends State<Hw26> {
  bool isDoneInTime = false;
  List<Task> tasks = [
    Task(
      title: 'Продать Li 9',
      isCompleted: false,
      deadLine: DateTime.now(),
      finalTime: DateTime.now(),
      isDoneInTime: false,
      categoryId: 'work',
    ),
    Task(
      title: 'Доделать Flutter HomeWork',
      isCompleted: false,
      deadLine: DateTime(2025, 2, 22, 14, 14),
      finalTime: DateTime.now(),
      isDoneInTime: false,
      categoryId: 'study',
    ),
    Task(
      title: 'Обсудить с коллегой макет сайта',
      isCompleted: false,
      deadLine: DateTime(2025, 3, 30, 15, 15),
      finalTime: DateTime.now(),
      isDoneInTime: false,
      categoryId: 'meeting',
    ),
    Task(
      title: 'Сделать Кардио-Тренировку',
      isCompleted: false,
      deadLine: DateTime.now(),
      finalTime: DateTime.now(),
      isDoneInTime: false,
      categoryId: 'training',
    ),
    Task(
      title: 'Купить корм коту!!!!',
      isCompleted: false,
      deadLine: DateTime.now(),
      finalTime: DateTime.now(),
      isDoneInTime: false,
      categoryId: 'urgent',
    ),
  ];

  void addTask(Task addTask) {
    setState(() {
      tasks.add(addTask);
    });
  }

  void changeCondition(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });
  }

  void checkDeadLine(Task task) {
    setState(() {
      task.isDoneInTime = task.finalTime.compareTo(task.deadLine) <= 0;
    });
  }

  void deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  void openAddSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddTask(onTaskCreated: addTask),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDo List!',
        ),
        actions: [
          IconButton(
            onPressed: openAddSheet,
            icon: Icon(
              Icons.add,
              color: Colors.blue.shade700,
              size: 33,
            ),
          )
        ],
      ),
      body: TodoScreen(
        tasks: tasks,
        checkTask: changeCondition,
        deleteTask: deleteTask,
        checkDeadLine: checkDeadLine,
        isDoneInTime: isDoneInTime,
      ),
    );
  }
}
