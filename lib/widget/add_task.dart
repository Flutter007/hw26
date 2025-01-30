import 'package:flutter/material.dart';
import 'package:hw26/data/task.dart';
import 'package:hw26/helpers/formatted_datetime.dart';

class AddTask extends StatefulWidget {
  final void Function(Task newTask) onTaskCreated;
  const AddTask({super.key, required this.onTaskCreated});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var title = '';
  var selectedDeadLine = DateTime.now();
  var selectedTimeOfDeadLine = TimeOfDay.now();
  var dateControl = TextEditingController();
  var timeControl = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateControl.text = formattedDate(selectedDeadLine);
    timeControl.text = formattedTime(selectedTimeOfDeadLine);
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  void onAdd() {
    final dateTime = DateTime(
      selectedDeadLine.year,
      selectedDeadLine.month,
      selectedDeadLine.day,
      selectedTimeOfDeadLine.hour,
      selectedTimeOfDeadLine.minute,
    );
    if (title != '') {
      final newTask = Task(
        title: title,
        isCompleted: false,
        deadLine: dateTime,
        finalTime: DateTime.now(),
        isDoneInTime: false,
      );
      widget.onTaskCreated(newTask);
      onCanceled();
    } else {
      final emptyTask = Task(
        title: 'Пустая задача',
        isCompleted: false,
        deadLine: dateTime,
        finalTime: DateTime.now(),
        isDoneInTime: false,
      );
      widget.onTaskCreated(emptyTask);
    }
  }

  void onDateLineTap() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);

    final dateFromUser = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: selectedDeadLine,
    );

    if (dateFromUser != null) {
      setState(() {
        selectedDeadLine = dateFromUser;
        dateControl.text = formattedDate(dateFromUser);
      });
    }
  }

  void onTimeTap() async {
    final selectedDeadTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeOfDeadLine,
    );
    if (selectedDeadTime != null) {
      setState(() {
        selectedTimeOfDeadLine = selectedDeadTime;
        timeControl.text = formattedTime(selectedDeadTime);
      });
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
                  onTap: onDateLineTap,
                  readOnly: true,
                  controller: dateControl,
                  decoration: InputDecoration(label: Text("DeadLine's Date")),
                ),
              ),
              SizedBox(width: 15),
              SizedBox(
                width: 100,
                child: TextField(
                  onTap: onTimeTap,
                  controller: timeControl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text("DeadLine's Time"),
                  ),
                ),
              )
            ],
          ),
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade200,
                  ),
                  onPressed: onAdd,
                  child: Text('Add'),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade200,
                  ),
                  onPressed: onCanceled,
                  child: Text('Cancel'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
