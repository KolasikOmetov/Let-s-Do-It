import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:letsdoit/taskState/state.dart';
import 'package:provider/provider.dart';

class Calendar extends StatefulWidget {
  Calendar();

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now().add(Duration(days: -2)),
      width: 90,
      height: 120,
      initialSelectedDate: DateTime.now(),
      locale: "ru_RU",
      dateTextStyle: TextStyle(
          color: Color(0xffffffff),
          fontFamily: "Balsamiq Sans",
          fontWeight: FontWeight.w700,
          fontSize: 20),
      dayTextStyle: TextStyle(
          color: Color(0xffffffff),
          fontFamily: "Balsamiq Sans",
          fontWeight: FontWeight.w400,
          fontSize: 16),
      monthTextStyle: TextStyle(
          color: Color(0xffffffff),
          fontFamily: "Balsamiq Sans",
          fontWeight: FontWeight.w400,
          fontSize: 16),
      selectionColor: Color(0xffce4de7),
      onDateChange: (date) {
        Provider.of<TasksState>(context, listen: false).setCurDate(date);
      },
    );
  }
}
