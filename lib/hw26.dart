import 'package:flutter/material.dart';
import 'package:hw26/model/task.dart';
import 'package:hw26/screens/todo_screen.dart';
import 'package:hw26/widget/add_task.dart';

import 'data/categories_data.dart';

class Hw26 extends StatefulWidget {
  const Hw26({super.key});

  @override
  State<Hw26> createState() => _Hw26State();
}

class _Hw26State extends State<Hw26> {
  bool isDoneInTime = false;
  String? selectedInfoCategory = 'all_tasks';

  List<Task> tasks = [
    Task(
      title: 'Продать Li 9',
      isCompleted: false,
      isDoneInTime: false,
      categoryId: 'work',
      deadLine: null,
      finalTime: DateTime.now(),
    ),
    Task(
      title: 'Доделать Flutter HomeWork',
      isCompleted: false,
      deadLine: DateTime(2025, 3, 22, 14, 14),
      finalTime: DateTime.now(),
      isDoneInTime: false,
      categoryId: 'study',
    ),
    Task(
      title: 'Обсудить с коллегой макет сайта',
      isCompleted: false,
      deadLine: DateTime(2024, 3, 30, 15, 15),
      finalTime: DateTime.now(),
      isDoneInTime: false,
      categoryId: 'meeting',
    ),
    Task(
      title: 'Сделать Кардио-Тренировку',
      isCompleted: false,
      deadLine: DateTime(2024, 6, 26, 06, 06),
      finalTime: DateTime.now(),
      isDoneInTime: false,
      categoryId: 'training',
    ),
    Task(
      title: 'Купить корм коту!!!!',
      isCompleted: false,
      deadLine: DateTime(2025, 2, 2, 22, 22),
      isDoneInTime: false,
      categoryId: 'urgent',
      finalTime: DateTime.now(),
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
      task.isDoneInTime = task.checkIfDoneInTime();
    });
  }

  void deleteTask(String id) {
    setState(() {
      tasks.removeWhere((task) => task.id == id);
    });
  }

  void editTask(Task editTask) {
    setState(() {
      final index = tasks.indexWhere((task) => task.id == editTask.id);
      tasks[index] = editTask;
    });
  }

  void openAddSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) => AddTask(onTaskCreated: addTask),
    );
  }

  void openEditTaskSheet(String id) {
    final existingTask = tasks.firstWhere((task) => task.id == id);
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) => AddTask(
        onTaskCreated: editTask,
        existingTask: existingTask,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    tasks.sort((a, b) => a.title.compareTo(b.title));
    tasks.sort((a, b) {
      if (a.deadLine == null && b.deadLine == null) {
        return 0;
      } else if (b.deadLine != null && a.deadLine == null) {
        return 1;
      } else if (b.deadLine == null && a.deadLine != null) {
        return -1;
      } else {
        return a.deadLine!.compareTo(b.deadLine!);
      }
    });

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          'ToDo List!',
        ),
        actions: [
          DropdownMenu(
            initialSelection: selectedInfoCategory,
            width: 150,
            label: Text('Category'),
            onSelected: (value) => setState(() => selectedInfoCategory = value),
            dropdownMenuEntries: categories
                .map(
                  (category) => DropdownMenuEntry(
                    value: category.id,
                    leadingIcon: Icon(category.icon),
                    label: category.label,
                  ),
                )
                .toList(),
          ),
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
        tasks: (selectedInfoCategory == 'all_tasks')
            ? tasks
            : tasks
                .where(
                  (task) => task.categoryId == selectedInfoCategory,
                )
                .toList(),
        checkTask: changeCondition,
        deleteTask: deleteTask,
        checkDeadLine: checkDeadLine,
        onTaskEdited: openEditTaskSheet,
        isDoneInTime: isDoneInTime,
      ),
    );
  }
}
