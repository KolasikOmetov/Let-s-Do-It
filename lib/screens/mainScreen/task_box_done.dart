import 'package:flutter/material.dart';


class TaskBoxDone extends StatefulWidget {
  final bool _done;

  TaskBoxDone(this._done);

  @override
  createState() => new TaskBoxDoneState(_done);
}

class TaskBoxDoneState extends State<TaskBoxDone> {
  bool done;

  TaskBoxDoneState(this.done);

  void pressButton() {
    setState(() {
      done = !done;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
    icon: Icon(done ? Icons.check_circle : Icons.check_circle_outline, size: 30.0, color: Colors.white),
    onPressed: pressButton);
  }
}