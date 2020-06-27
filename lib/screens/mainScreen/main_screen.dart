import 'package:flutter/material.dart';
import 'package:letsdoit/screens/mainScreen/calendar.dart';
import 'package:letsdoit/screens/mainScreen/list_of_tasks.dart';
import 'package:letsdoit/screens/settingsScreen/settings_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff42aaff),
      appBar: AppBar(
          backgroundColor: Color(0xff2c18a7),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: Text(
                  "Let's DO IT",
                  style: TextStyle(
                      fontFamily: "Balsamiq Sans",
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
                ),
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
              )
            ],
          )),
      body: ListOfTasks(),
      bottomNavigationBar: BottomAppBar(
          color: Color(0xff2c18a7),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Calendar(),
          )),
    );
  }
}
