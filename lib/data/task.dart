class Task {
  final String title;
  bool isCompleted;
  final DateTime deadLine;
  final DateTime finalTime;

  Task(
      {required this.title,
      required this.isCompleted,
      required this.deadLine,
      required this.finalTime});
}
