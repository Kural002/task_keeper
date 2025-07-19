import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/local_storage_service.dart';

class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];
  final _storage = LocalStorageService();

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title: title));
    _saveAndNotify();
  }

  void toggleTask(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    _saveAndNotify();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    _saveAndNotify();
  }

  Future<void> loadTasks() async {
    final loaded = await _storage.loadTasks();
    _tasks.clear();
    _tasks.addAll(loaded);
    notifyListeners();
  }

  Future<void> _saveAndNotify() async {
    await _storage.saveTasks(_tasks);
    notifyListeners();
  }
}
