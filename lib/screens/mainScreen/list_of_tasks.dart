import 'package:flutter/material.dart';
import 'package:letsdoit/screens/mainScreen/add_task_box.dart';
import 'package:letsdoit/screens/mainScreen/task_box.dart';

class ListOfTasks extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TaskBox('Помыть посуду', '',
                imageurl: '', id: 10),
        TaskBox('Помыть посуду', '',
                imageurl: '', id: 10),
        TaskBox('Помыть посуду', '',
                imageurl: '', id: 10),
        TaskBox('Помыть посуду', '',
                imageurl: '', id: 10),
        TaskBox('Помыть посуду', '',
                imageurl: '', id: 10),
        TaskBox('Помыть посуду', '',
                imageurl: '', id: 10),
        TaskBox('Помыть посуду', '',
                imageurl: '', id: 10),
        TaskBox('Помыть посуду', '',
                imageurl: '', id: 10),
        TaskBox('Помыть посуду', '',
                imageurl: '', id: 10),
        TaskBox('Помыть посуду', '',
                imageurl: '', id: 10),
      ]..add(AddTaskBox()),
    );
  }
}