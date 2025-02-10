import 'package:hw26/data/categories_data.dart';
import 'package:hw26/model/task_category.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Task {
  final String id;
  final String title;
  bool isCompleted;
  DateTime? deadLine;
  DateTime? finalTime;
  bool isDoneInTime;
  String categoryId;

  Task({
    String? id,
    required this.title,
    required this.isCompleted,
    required this.isDoneInTime,
    required this.categoryId,
    this.deadLine,
    required this.finalTime,
  }) : id = id ?? uuid.v4();

  TaskCategory get category {
    return categories.firstWhere((category) => category.id == categoryId);
  }

  bool checkIfDoneInTime() {
    if (deadLine == null) {
      return true;
    }
    return finalTime!.compareTo(deadLine!) <= 0;
  }
}
