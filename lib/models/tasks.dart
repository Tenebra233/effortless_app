class Task {
  final String name;
  final int hour;
  final int minute;
  bool isDone;

  Task({this.name, this.isDone = false, this.minute, this.hour});

  void toggleDone() {
    isDone = !isDone;
  }
}
