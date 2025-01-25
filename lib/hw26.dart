import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hw26/data/task.dart';
import 'package:hw26/screens/todo_screen.dart';
import 'package:hw26/widget/add_task.dart';

class Hw26 extends StatefulWidget {
  const Hw26({super.key});

  @override
  State<Hw26> createState() => _Hw26State();
}

class _Hw26State extends State<Hw26> {
  List<Task> tasks = [
    Task(title: 'Купить Li 9)', isCompleted: false),
    Task(title: 'Доделать дз', isCompleted: false),
    Task(title: 'Создать макет сайта', isCompleted: false),
    Task(title: 'Проверить уровень масла в машине', isCompleted: false),
  ];

  void addTask(Task addTask) {
    setState(() {
      tasks.add(addTask);
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
          style: GoogleFonts.bebasNeue(fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: openAddSheet,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: TodoScreen(
        tasks: tasks,
      ),
    );
  }
}
