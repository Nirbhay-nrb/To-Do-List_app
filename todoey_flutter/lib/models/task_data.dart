import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
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

  void setList() async {
    int count = 0;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    for (int i = 0; i < _tasks.length; i++) {
      final d2a = _tasks[i].name;
      preferences.setString('task$i', d2a);
      count++;
    }
    preferences.setInt('length', count);
  }

  void getList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int length = await preferences.getInt('length') ?? 0;
    for (int i = 0; i < length; i++) {
      String newTaskTitle = await preferences.getString('task$i');
      bool isChecked = await preferences.getBool('tasks$i') ?? false;
      final task = Task(name: newTaskTitle, isDone: isChecked);
      _tasks.add(task);
    }
    notifyListeners();
  }

  void setIsChecked() async {
    int count = 0;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    for (int i = 0; i < _tasks.length; i++) {
      final d2a = _tasks[i].isDone;
      preferences.setBool('tasks$i', d2a);
      count++;
    }
    preferences.setInt('length', count);
  }
}
