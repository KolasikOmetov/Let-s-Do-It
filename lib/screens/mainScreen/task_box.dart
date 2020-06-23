import 'package:flutter/material.dart';
import 'package:letsdoit/model/task.dart';
import 'package:letsdoit/screens/taskScreen/task_screen.dart';

class TaskBox extends StatefulWidget {
  Task task;

  TaskBox(this.task);

  @override
  createState() => TaskBoxState(task);
}

class TaskBoxState extends State<TaskBox> {
  Task task;

  TaskBoxState(this.task);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TaskScreen(
                    5, "name", "description", DateTime.now(), DateTime.now())),
          );
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            color: Color(0xff6600cc),
            height: 70.0,
            child: Row(children: [
              (task.imageurl != null && task.imageurl != '')
                  ? Image.network(task.imageurl,
                      width: 100.0, height: 100.0, fit: BoxFit.scaleDown)
                  : Container(),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Column(children: [
                        Text(task.title,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis)
                      ])))
            ])));
  }
}
