import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy milk', isDone: false),
    Task(name: 'Buy eggs', isDone: false),
    Task(name: 'Buy bread', isDone: false),
  ];

  void setTaskStatus(int index, bool isDone) {
    _tasks[index].isDone = isDone;
    notifyListeners();
  }

  void addTask(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  UnmodifiableListView<Task> getTasks() => UnmodifiableListView(_tasks);

  int getTasksLength() => _tasks.length;
}
