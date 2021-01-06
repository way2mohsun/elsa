import 'package:flutter/foundation.dart';
import 'package:flutterapp/todoey/modules/task.dart';

class TaskList with ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'buy eggs'),
    Task(name: 'buy bread'),
    Task(name: 'buy milk'),
  ];

  List<Task> get tasks => _tasks;

  void add({String name, bool done = false}) {
    _tasks.add(Task(name: name, done: done));
    notifyListeners();
  }

  void toggleDone({int index}) {
    _tasks[index].done = !_tasks[index].done;
    notifyListeners();
  }
}
