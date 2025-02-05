class Task {
  final String title;
  bool isCompleted;
  DateTime deadLine;
  DateTime finalTime;
  bool isDoneInTime;
  final String categoryId;

  Task({
    required this.title,
    required this.isCompleted,
    required this.deadLine,
    required this.finalTime,
    required this.isDoneInTime,
    required this.categoryId,
  });
}
