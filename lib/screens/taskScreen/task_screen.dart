import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:letsdoit/model/task.dart';
import 'package:letsdoit/taskState/state.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  final Task task;

  TaskScreen(this.task);

  @override
  _TaskScreenState createState() => _TaskScreenState(task);
}

class _TaskScreenState extends State<TaskScreen> {
  Task task;
  DateTime prevDate;
  final newFormat = DateFormat("HH:mm");

  bool _isEditing = false;

  _TaskScreenState(this.task);

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Widget showToast(String message) {
    return Flushbar(
      message: message,
      duration: Duration(seconds: 3),
      backgroundColor: Color(0xffce4de7),
      margin: EdgeInsets.all(8),
      borderRadius: 8,
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    prevDate = task.dateStart;
    _nameController.text = task.title;
    _descriptionController.text = task.description;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: Color(0xff2c18a7),
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          if (_isEditing) {
                            return showToast(
                                "Сначала выйдите из режима редактирования");
                          }
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/", (Route<dynamic> route) => false);
                          return null;
                        }),
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          Provider.of<TasksState>(context, listen: false)
                              .deleteTaskById(task.id);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/", (Route<dynamic> route) => false);
                        }),
                  ],
                ),
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      if (_isEditing) {
                        if (task.title == "") {
                          return showToast("Вы не ввели название задания");
                        }
                        if (task.dateFinish.isBefore(task.dateStart) ||
                            task.dateFinish.isAtSameMomentAs(task.dateStart)) {
                          return showToast(
                              "Времена не могу совпадать или быть в обратном порядке");
                        }
                        if (prevDate != task.dateStart) {
                          final testId =
                              (task.dateStart.millisecondsSinceEpoch / 60000)
                                  .round();
                          if (Provider.of<TasksState>(context, listen: false)
                              .containTaskById(testId)) {
                            return showToast(
                                "У вас уже установлено задание на это время");
                          } else {
                            Provider.of<TasksState>(context, listen: false)
                                .updateTask(task.id, testId, task);
                            task.id = testId;
                            setState(() {
                              _isEditing = false;
                            });
                            return null;
                          }
                        }
                        Provider.of<TasksState>(context, listen: false)
                            .updateTask(task.id, task.id, task);
                        setState(() {
                          _isEditing = false;
                        });
                        return null;
                      } else {
                        setState(() {
                          _isEditing = true;
                        });
                        return null;
                      }
                    }),
              ],
            ),
          ),
          body: _isEditing
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Color(0xff6600cc)),
                          child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Название задания',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).accentColor)),
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .fontSize),
                              controller: _nameController,
                              onChanged: (value) => task.title = value)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          "Описание",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontSize,
                              color: Theme.of(context).accentColor),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor),
                          child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Описание задания',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).accentColor)),
                              maxLines: null,
                              controller: _descriptionController,
                              onChanged: (value) => task.description = value)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          "Время",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontSize,
                              color: Theme.of(context).accentColor),
                        ),
                      ),
                      Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Начало"),
                    TimePickerSpinner(
                      time: task.dateStart,
                      normalTextStyle:
                          TextStyle(fontSize: 20, color: Colors.white),
                      highlightedTextStyle:
                          TextStyle(fontSize: 20, color: Color(0xffce4de7)),
                      spacing: 25,
                      itemHeight: 40,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        task.dateStart = time;
                      },
                    ),
                  ],
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Конец"),
                    TimePickerSpinner(
                      time: task.dateFinish,
                      normalTextStyle:
                          TextStyle(fontSize: 20, color: Colors.white),
                      highlightedTextStyle:
                          TextStyle(fontSize: 20, color: Color(0xffce4de7)),
                      spacing: 25,
                      itemHeight: 40,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        task.dateFinish = time;
                      },
                    ),
                  ],
                )
            ]),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Color(0xff6600cc)),
                            child: Text(task.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .fontSize))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          "Описание",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontSize,
                              color: Theme.of(context).accentColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration:
                            BoxDecoration(color: Theme.of(context).accentColor),
                        child: task.description == ''
                            ? Text("Нет описания")
                            : SelectableText(task.description,
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(copy: true),
                            cursorColor: Color(0xffce4de7),
                            cursorWidth: 5,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          "Время",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontSize,
                              color: Theme.of(context).accentColor),
                        ),
                      ),
                      Container(
                          child: Center(
                        child: Text("С " + newFormat.format((task.dateStart))),
                      )),
                      Container(
                          child: Center(
                        child:
                            Text("До " + newFormat.format((task.dateFinish))),
                      )),
                    ],
                  ),
                )),
    );
  }
}
