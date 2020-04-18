import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  // int _hour = 0;
  // int _minute = 0;

  int get taskCount {
    return _tasks.length;
  }

  //Si tratta di una lista non modificabile
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle, newTaskHour, newTaskMinute) {
    final task =
        Task(name: newTaskTitle, hour: newTaskHour, minute: newTaskMinute);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void cleanInput(TextEditingController controller) {
    controller.clear();
    notifyListeners();
  }

  // set setHour(hour) {
  //   _hour = hour;
  // }

  // set setMinute(minute) {
  //   _minute = minute;
  // }

  // int get getMinute {
  //   return _minute;
  // }

  // int get getHour {
  //   return _hour;
  // }
}
