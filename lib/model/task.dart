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
    required this.deadLine,
    required this.finalTime,
    required this.isDoneInTime,
    required this.categoryId,
  }) : id = id ?? uuid.v4();

  TaskCategory get category {
    return categories.firstWhere((category) => category.id == categoryId);
  }
}
