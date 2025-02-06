import 'package:hw26/data/categories_data.dart';
import 'package:hw26/model/task_category.dart';

class Task {
  final String title;
  bool isCompleted;
  DateTime deadLine;
  DateTime finalTime;
  bool isDoneInTime;
  String categoryId;

  Task({
    required this.title,
    required this.isCompleted,
    required this.deadLine,
    required this.finalTime,
    required this.isDoneInTime,
    required this.categoryId,
  });

  TaskCategory get category {
    return categories.firstWhere((category) => category.id == categoryId);
  }
}
