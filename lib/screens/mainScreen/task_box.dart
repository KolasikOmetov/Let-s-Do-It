import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:letsdoit/model/task.dart';
import 'package:letsdoit/screens/taskScreen/task_screen.dart';

class TaskBox extends StatefulWidget {
  final Task task;

  TaskBox(this.task);

  @override
  createState() => TaskBoxState(task);
}

class TaskBoxState extends State<TaskBox> {
  Task task;
  final newFormat = DateFormat("HH:mm");

  TaskBoxState(this.task);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => TaskScreen(task)),
          );
        },
        child: Container(
            constraints: BoxConstraints(maxHeight: 150, minHeight: 70),
            // margin: EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            color: Color(0xff6600cc),
            height: 70.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(task.title,
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .fontSize,
                                fontWeight: FontWeight.w600))),
                  ),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: Column(children: [
                        Text(newFormat.format((task.dateStart)),
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis),
                        Text(newFormat.format((task.dateFinish)),
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis)
                      ]))
                ])));
  }
}
