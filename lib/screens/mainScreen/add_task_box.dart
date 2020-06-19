import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:letsdoit/model/task.dart';
import 'package:letsdoit/taskState/state.dart';
import 'package:provider/provider.dart';


class AddTaskBox extends StatefulWidget {

  @override
  createState() =>  TaskBoxState();
}


class TaskBoxState extends State<AddTaskBox> {

  TaskBoxState();


  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: () {
          final tasksBox = Hive.box('tasks');
          // final newTask = Task(tasksBox.length, DateTime.now(), DateTime.now(), "Create app", "It's so intresting", "");
          // tasksBox.add(newTask);
          Provider.of<TasksState>(context, listen: false).addTask(
            Task(tasksBox.length, DateTime.now(), DateTime.now(), "Create app", "It's so intresting", "")
            );
        },
      child: 
        Container(
          color: Color(0xff42aaff),
          height: 70.0,
          child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add_box, color: Colors.white),
                    Text("Добавить новое задание",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400),  
                      ),
                  ],
            )
        )
      );
  }
}
