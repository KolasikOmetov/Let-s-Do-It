import 'package:flutter/material.dart';
import 'package:letsdoit/screens/task_box.dart';

class ListOfTasks extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
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
      ],
    );
  }
}