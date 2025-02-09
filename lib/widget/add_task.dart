import 'package:flutter/material.dart';
import 'package:hw26/data/categories_data.dart';
import 'package:hw26/model/task.dart';
import 'package:hw26/helpers/formatted_datetime.dart';

class AddTask extends StatefulWidget {
  final void Function(Task newTask) onTaskCreated;
  final Task? existingTask;
  const AddTask({super.key, required this.onTaskCreated, this.existingTask});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var title = '';
  DateTime? selectedDeadLine = DateTime.now();
  TimeOfDay? selectedTimeOfDeadLine = TimeOfDay.now();
  String? selectedCategory;

  final dateControl = TextEditingController();
  final timeControl = TextEditingController();
  final titleControl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingTask != null) {
      final existingTask = widget.existingTask!;
      titleControl.text = existingTask.title;
      selectedDeadLine = existingTask.deadLine;
      selectedTimeOfDeadLine = TimeOfDay.fromDateTime(existingTask.deadLine!);
      selectedCategory = existingTask.categoryId;
    }

    if (selectedDeadLine != null) {
      dateControl.text = formattedDate(selectedDeadLine!);
    }
    if (selectedTimeOfDeadLine != null) {
      timeControl.text = formattedTime(selectedTimeOfDeadLine!);
    }
  }

  void clearTimeText() {
    setState(() {
      dateControl.text = '';
      timeControl.text = '';
      selectedDeadLine = null;
      selectedTimeOfDeadLine = null;
    });
  }

  @override
  void dispose() {
    dateControl.dispose();
    timeControl.dispose();
    titleControl.dispose();
    super.dispose();
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  void onAdd() {
    DateTime? dateTime;
    if (selectedDeadLine != null && selectedTimeOfDeadLine != null) {
      dateTime = DateTime(
        selectedDeadLine!.year,
        selectedDeadLine!.month,
        selectedDeadLine!.day,
        selectedTimeOfDeadLine!.hour,
        selectedTimeOfDeadLine!.minute,
      );
    }

    final newTask = Task(
      id: widget.existingTask?.id,
      title: titleControl.text.trim(),
      isCompleted: false,
      deadLine: dateTime,
      finalTime: DateTime.now(),
      isDoneInTime: false,
      categoryId: selectedCategory!,
    );
    widget.onTaskCreated(newTask);
    onCanceled();
  }

  void onDateLineTap() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);

    final dateFromUser = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: selectedDeadLine ?? DateTime.now(),
    );

    if (dateFromUser != null) {
      setState(() {
        selectedDeadLine = dateFromUser;
        dateControl.text = formattedDate(dateFromUser);
      });
    }
  }

  bool isWrongFilled() {
    return titleControl.text.trim().isEmpty || selectedCategory == null;
  }

  void onTimeTap() async {
    final selectedDeadTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeOfDeadLine!,
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
    final theme = Theme.of(context);
    final bottomInsetCheck = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + bottomInsetCheck),
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
              ),
              IconButton(
                  onPressed: clearTimeText, icon: Icon(Icons.close_outlined))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: titleControl,
                  decoration: InputDecoration(
                    label: Text('Title of task :'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          DropdownMenu(
            expandedInsets: EdgeInsets.zero,
            keyboardType: TextInputType.text,
            initialSelection: selectedCategory,
            label: Text('Category : '),
            inputDecorationTheme: theme.inputDecorationTheme,
            onSelected: (value) => setState(() => selectedCategory = value),
            dropdownMenuEntries: categories
                .where((task) => task.id != 'all_tasks')
                .map(
                  (category) => DropdownMenuEntry(
                      value: category.id,
                      leadingIcon: Icon(category.icon),
                      label: category.label),
                )
                .toList(),
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
                  onPressed: isWrongFilled() ? null : onAdd,
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
