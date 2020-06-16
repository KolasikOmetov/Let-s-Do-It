import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:letsdoit/model/task.dart';


class AddTaskBox extends StatefulWidget {

  @override
  createState() =>  TaskBoxState();
}


class TaskBoxState extends State<AddTaskBox> {

  TaskBoxState();

  void addTask(Task task){
    final tasksBox = Hive.box('tasks');
    tasksBox.add(task);
    print('I added task');
  }

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: () {
          final newTask = Task(DateTime.now().millisecondsSinceEpoch, DateTime.now(), DateTime.now(), "Create app", "It's so intresting", "assets/images/water.jpg");
          addTask(newTask);
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
