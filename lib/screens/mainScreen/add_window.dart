import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:letsdoit/model/task.dart';
import 'package:letsdoit/taskState/state.dart';
import 'package:provider/provider.dart';

class AddWindow extends StatefulWidget {
  @override
  _AddWindowState createState() => _AddWindowState();
}

class _AddWindowState extends State<AddWindow> {
  int id;
  String name = '';
  String description = '';
  DateTime dateStart;
  DateTime dateEnd;
  String imageurl = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xff2c18a7),
      title: Text("Добавляем новое задание"),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: 'Название задания',
                  hintStyle: TextStyle(color: Theme.of(context).accentColor)),
              onChanged: (value) => name = value,
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: 'Описание задания',
                    hintStyle: TextStyle(color: Theme.of(context).accentColor)),
                onChanged: (value) => description = value,
                maxLines: null),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                "Время",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
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
                      time: Provider.of<TasksState>(context, listen: false)
                          .curDate,
                      normalTextStyle:
                          TextStyle(fontSize: 20, color: Colors.white),
                      highlightedTextStyle:
                          TextStyle(fontSize: 20, color: Color(0xffce4de7)),
                      spacing: 25,
                      itemHeight: 40,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        dateStart = time;
                      },
                    ),
                  ],
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Конец"),
                    TimePickerSpinner(
                      time: Provider.of<TasksState>(context, listen: false)
                          .curDate,
                      normalTextStyle:
                          TextStyle(fontSize: 20, color: Colors.white),
                      highlightedTextStyle:
                          TextStyle(fontSize: 20, color: Color(0xffce4de7)),
                      spacing: 25,
                      itemHeight: 40,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        dateEnd = time;
                      },
                    ),
                  ],
                )
            ]),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
            child: Text('Отмена'),
            onPressed: () {
              Navigator.pop(context);
            }),
        FlatButton(
            child: Text('ОК'),
            onPressed: () {
              if (name == "") {
                return showToast("Вы не ввели название задания");
              }
              if (dateEnd.isBefore(dateStart) ||
                  dateEnd.isAtSameMomentAs(dateStart)) {
                return showToast(
                    "Времена не могут совпадать или быть в обратном порядке");
              }
              id = (dateStart.millisecondsSinceEpoch / 60000).round();
              if (Provider.of<TasksState>(context, listen: false)
                  .containTaskById(id)) {
                return showToast("У вас уже установлено задание на это время");
              }
              Provider.of<TasksState>(context, listen: false).addTask(
                  Task(id, dateStart, dateEnd, name, description, imageurl));
              Navigator.pop(context);
              return showToast("Задание было добавлено");
            })
      ],
    );
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
}
