import 'package:flutter/material.dart';
import 'package:letsdoit/screens/calendar.dart';
import 'package:letsdoit/screens/list_of_tasks.dart';
import 'package:letsdoit/screens/task_box.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff42aaff),
      appBar: AppBar(
        backgroundColor: Color(0xff2c18a7),
        title: Text("Let's DO IT", 
        style: 
          TextStyle(
            fontFamily: "Balsamiq Sans",
            fontWeight: FontWeight.w800,
          ),
        )
      ),
      body: TaskBox('Помыть посуду', '',
                imageurl: '', id: 10),
      bottomNavigationBar: BottomAppBar(
        color:  Color(0xff2c18a7),
        child: Calendar(),
      ),
    );
  }
}