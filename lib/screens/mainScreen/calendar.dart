import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';

class Calendar extends StatefulWidget{
  
  Calendar();

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return 
        DatePicker(
          DateTime.now(),
          width:90,
          height:120,
          initialSelectedDate: DateTime.now(),
          locale: "ru_RU",
          dateTextStyle: TextStyle(
            color: Color(0xffffffff),
            fontFamily: "Balsamiq Sans",
            fontWeight: FontWeight.w700,
            fontSize: 24
          ),
          dayTextStyle: TextStyle(
            color: Color(0xffffffff),
            fontFamily: "Balsamiq Sans",
            fontWeight: FontWeight.w400,
            fontSize: 20
          ),
          monthTextStyle: TextStyle(
            color: Color(0xffffffff),
            fontFamily: "Balsamiq Sans",
            fontWeight: FontWeight.w400,
            fontSize: 20
          ),
          selectionColor: Color(0xffce4de7),
          onDateChange: (date) {
            // // New date selected
            // setState(() {
            //   _selectedValue = date;
            // });
          },
        );
  }
}