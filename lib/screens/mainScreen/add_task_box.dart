import 'package:flutter/material.dart';
import 'package:letsdoit/screens/mainScreen/add_window.dart';

class AddTaskBox extends StatefulWidget {
  @override
  createState() => TaskBoxState();
}

class TaskBoxState extends State<AddTaskBox> {
  TaskBoxState();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (
                    context,
                    _,
                    __,
                  ) =>
                      AddWindow()));
        },
        child: Container(
            color: Color(0xff42aaff),
            height: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.add_box, color: Colors.white),
                Text(
                  "Добавить новое задание",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ],
            )));
  }
}
