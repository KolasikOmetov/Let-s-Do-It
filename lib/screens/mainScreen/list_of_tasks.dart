import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:letsdoit/model/task.dart';
import 'package:letsdoit/screens/mainScreen/task_box.dart';

class ListOfTasks extends StatefulWidget{

  @override
  _ListOfTasksState createState() => _ListOfTasksState();
}

class _ListOfTasksState extends State<ListOfTasks> {

  @override
  Widget build(BuildContext context) {
    final tasksBox = Hive.box('tasks');
    //tasksBox.watch().listen((event) { });
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tasksBox.length,
      itemBuilder: (context, index) {
        final task = tasksBox.getAt(index) as Task;
        print(task.title+task.description);
        return TaskBox(task.title, task.description, imageurl: task.imageurl, id: task.id);
      },
    );
  }
}