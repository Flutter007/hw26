import 'package:flutter/material.dart';
import 'package:hw26/screens/todo_screen.dart';

class Hw26 extends StatefulWidget {
  const Hw26({super.key});

  @override
  State<Hw26> createState() => _Hw26State();
}

class _Hw26State extends State<Hw26> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List!'),
      ),
      body: TodoScreen(),
    );
  }
}
