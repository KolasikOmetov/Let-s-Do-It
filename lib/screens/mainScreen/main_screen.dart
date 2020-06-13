import 'package:flutter/material.dart';
import 'package:letsdoit/screens/mainScreen/calendar.dart';
import 'package:letsdoit/screens/mainScreen/list_of_tasks.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff42aaff),
      appBar: AppBar(
        backgroundColor: Color(0xff2c18a7),
        title: Center(
          child: Text("Let's DO IT", 
          style: 
            TextStyle(
              fontFamily: "Balsamiq Sans",
              fontWeight: FontWeight.w800,
              fontSize: 24
            ),
          ),
        )
      ),
      body: ListOfTasks(),
      
      bottomNavigationBar: BottomAppBar(
        color:  Color(0xff2c18a7),
        child: 
        Stack(
          children: [
            Calendar(),
            Positioned(child: 
              FloatingActionButton(
                onPressed: () {
                
                },
                tooltip: 'Add',
                child: Text(
                  "+",
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Color(0xffee5df7),
                hoverColor: Color(0xff6600cc)
              ),
              bottom: 20,
              right: 20,
            )
          ],
        )
      ),
    );
  }
}