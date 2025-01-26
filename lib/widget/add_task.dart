import 'package:flutter/material.dart';
import 'package:hw26/data/task.dart';

class AddTask extends StatefulWidget {
  final void Function(Task newTask) onTaskCreated;
  const AddTask({super.key, required this.onTaskCreated});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var title = '';

  void onCanceled() {
    Navigator.pop(context);
  }

  void onAdd() {
    if (title != '') {
      final newTask = Task(title: title, isCompleted: false);
      widget.onTaskCreated(newTask);
      onCanceled();
    } else {
      final emptyTask = Task(title: 'Пустая задача', isCompleted: false);
      widget.onTaskCreated(emptyTask);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) => setState(() {
                    title = value;
                  }),
                  decoration: InputDecoration(
                    label: Text('Title of task :'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                onPressed: onAdd,
                child: Text('Add'),
              )),
              Expanded(
                  child: ElevatedButton(
                      onPressed: onCanceled, child: Text('Cancel')))
            ],
          ),
        ],
      ),
    );
  }
}
