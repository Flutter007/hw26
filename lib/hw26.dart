import 'package:flutter/material.dart';
import 'package:hw26/model/destination.dart';
import 'package:hw26/model/task.dart';
import 'package:hw26/screens/statistic_screen.dart';
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
  int currentIndex = 0;
  List<Task> tasks = [
    Task(
      title: 'Продать Li 9',
      isCompleted: false,
      isDoneInTime: false,
      categoryId: 'work',
      deadLine: null,
      finalTime: DateTime.now().subtract(Duration(days: 1)),
    ),
    Task(
      title: 'Доделать Flutter HomeWork',
      isCompleted: false,
      deadLine: DateTime(2025, 4, 4, 4, 4),
      finalTime: DateTime.now().subtract(Duration(days: 2)),
      isDoneInTime: false,
      categoryId: 'study',
    ),
    Task(
      title: 'Обсудить с коллегой макет сайта',
      isCompleted: false,
      deadLine: DateTime(2025, 1, 1, 1, 1),
      finalTime: DateTime.now().subtract(Duration(days: 3)),
      isDoneInTime: false,
      categoryId: 'meeting',
    ),
    Task(
      title: 'Сделать Кардио-Тренировку',
      isCompleted: false,
      deadLine: DateTime(2025, 2, 2, 2, 2),
      finalTime: DateTime.now().subtract(Duration(days: 4)),
      isDoneInTime: false,
      categoryId: 'training',
    ),
    Task(
      title: 'Купить корм коту!!!!',
      isCompleted: false,
      deadLine: DateTime(2025, 3, 3, 3, 3),
      isDoneInTime: false,
      categoryId: 'urgent',
      finalTime: DateTime.now().subtract(Duration(days: 5)),
    ),
    Task(
      title: 'Закончить курс Flutter',
      isCompleted: false,
      isDoneInTime: false,
      categoryId: 'study',
      deadLine: null,
      finalTime: DateTime.now().subtract(Duration(days: 6)),
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

  void updateIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Destination> get destinations {
    return [
      Destination(
        screenTitle: Text('ToDo list!'),
        screen: TodoScreen(
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
        appBarActions: [
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
          ),
        ],
        navLabel: 'Tasks',
        navIcon: Icons.task_outlined,
        navSelectedIcon: Icons.task_rounded,
      ),
      Destination(
        screenTitle: Text('Statistics!'),
        screen: StatisticScreen(tasks: tasks),
        navLabel: 'Stat',
        navIcon: Icons.bar_chart,
        navSelectedIcon: Icons.bar_chart_outlined,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    tasks.sort((a, b) {
      if (a.deadLine == null && b.deadLine == null) {
        return a.title.compareTo(b.title);
      } else if (a.deadLine == null) {
        return 1;
      } else if (b.deadLine == null) {
        return -1;
      } else {
        return a.deadLine!.compareTo(b.deadLine!);
      }
    });
    final destination = destinations[currentIndex];

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          title: destination.screenTitle,
          actions: destination.appBarActions,
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.indigo.withAlpha(85),
          indicatorColor: Colors.white,
          selectedIndex: currentIndex,
          height: 65,
          onDestinationSelected: updateIndex,
          destinations: destinations
              .map(
                (destination) => NavigationDestination(
                  icon: Icon(
                    destination.navIcon,
                    size: 30,
                  ),
                  label: destination.navLabel,
                  selectedIcon: Icon(
                    destination.navSelectedIcon,
                    size: 30,
                  ),
                ),
              )
              .toList(),
        ),
        body: destination.screen);
  }
}
