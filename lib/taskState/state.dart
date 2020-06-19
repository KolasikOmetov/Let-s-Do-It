import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:letsdoit/model/task.dart';
import 'package:letsdoit/taskState/repo.dart';


class TasksState extends ChangeNotifier{
  final _taskRepository = TaskRepository();
  final List<Task> _tasks = [];
  DateTime curDate = DateTime.parse(DateTime.now().toString().substring(0, 11) + "00:00:00.000"); 

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  getTasksByCurDate(){
    _tasks..addAll(_taskRepository.getTasksByDate(curDate));
  }

  addTask(Task task){
    _taskRepository.createTask(task);
    _tasks.add(task);
    print('i added ${task.id}');
    notifyListeners();
  }

  updateTask(int id, Task task){
    _taskRepository.updateTask(id, task);
    notifyListeners();
  }

  deleteTaskById(int id){
    for(int i = 0; i < _tasks.length; i++){
      final task = _tasks[i];
      if(task.id == id){
        _tasks.remove(i);
        break;
      }
    }
    _taskRepository.deleteTaskById(id);
    print('i deleted $id');
    notifyListeners();
  }
}