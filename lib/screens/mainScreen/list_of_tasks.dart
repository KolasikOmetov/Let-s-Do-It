import 'package:flutter/material.dart';
import 'package:letsdoit/screens/mainScreen/task_box.dart';
import 'package:letsdoit/taskState/state.dart';
import 'package:provider/provider.dart';

class ListOfTasks extends StatefulWidget {
  ListOfTasks();

  @override
  _ListOfTasksState createState() => _ListOfTasksState();
}

class _ListOfTasksState extends State<ListOfTasks> {
  _ListOfTasksState();

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksState>(builder: (context, state, child) {
      print("i rebuild");
      state.getTasksByCurDate();
      return ListView.builder(
        shrinkWrap: true,
        itemCount: state.tasks.length,
        itemBuilder: (context, index) {
          final task = state.tasks[index];
          return Dismissible(
              background: Container(
                  color: Color(0xffce4de7),
                  child: Center(
                    child: Text(
                      "Удаляем...",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w400),
                    ),
                  )),
              key: UniqueKey(),
              onDismissed: (direction) {
                state.deleteTaskById(task.id);
              },
              child: TaskBox(task));
        },
      );
    });
  }
}
