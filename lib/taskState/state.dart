import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:letsdoit/model/task.dart';
import 'package:letsdoit/notifications/notifications_methods.dart';
import 'package:letsdoit/taskState/repo.dart';

class TasksState extends ChangeNotifier {
  final _taskRepository = TaskRepository();
  List<Task> _tasks = [];
  DateTime _curDate = DateTime.parse(
      DateTime.now().toString().substring(0, 11) + "00:00:00.000");

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  DateTime get curDate => _curDate;

  getTasksByCurDate() {
    _tasks = _taskRepository.getTasksByDate(_curDate);
    _tasks.sort((a, b) => a.id.compareTo(b.id));
  }

  setCurDate(DateTime date) {
    _curDate = date;
    notifyListeners();
  }

  addTask(Task task) {
    _taskRepository.createTask(task);
    NotificationsMethods.scheduleTask(task);
    print('i added ${task.id}');
    notifyListeners();
  }

  updateTask(int oldId, int newId, Task task) {
    var updatedTask = _taskRepository.updateTask(oldId, newId, task);
    NotificationsMethods.deleteNotificationChannel(oldId.toString());
    NotificationsMethods.scheduleTask(updatedTask);
    notifyListeners();
  }

  deleteTaskById(int id) {
    for (int i = 0; i < _tasks.length; i++) {
      final task = _tasks[i];
      if (task.id == id) {
        _tasks.remove(i);
        break;
      }
    }
    _taskRepository.deleteTaskById(id);
    NotificationsMethods.deleteNotificationChannel(id.toString());
    print('i deleted $id');
    notifyListeners();
  }

  bool containTaskById(int id) {
    for (int i = 0; i < _tasks.length; i++) {
      final task = _tasks[i];
      if (task.id == id) {
        print('i found $id');
        return true;
      }
    }
    print("i didn't find $id");
    return false;
  }
}
