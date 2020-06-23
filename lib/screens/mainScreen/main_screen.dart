import 'package:flutter/material.dart';
import 'package:letsdoit/screens/mainScreen/add_task_box.dart';
import 'package:letsdoit/screens/mainScreen/calendar.dart';
import 'package:letsdoit/screens/mainScreen/list_of_tasks.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff42aaff),
      appBar: AppBar(
          backgroundColor: Color(0xff2c18a7),
          title: Center(
            child: Text(
              "Let's DO IT",
              style: TextStyle(
                  fontFamily: "Balsamiq Sans",
                  fontWeight: FontWeight.w800,
                  fontSize: 24),
            ),
          )),
      body: Column(
        children: <Widget>[ListOfTasks(), AddTaskBox()],
      ),
      bottomNavigationBar:
          BottomAppBar(color: Color(0xff2c18a7), child: Calendar()),
    );
  }
}
