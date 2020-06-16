import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:letsdoit/screens/mainScreen/main_screen.dart';

class App extends StatefulWidget{

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme(context),
      home: FutureBuilder(
          future: Hive.openBox('tasks'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError)
                return Text(snapshot.error.toString());
              else
                return MainScreen();
            }
            else
              return Scaffold();
          }
        )
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  ThemeData _theme(BuildContext context){
    return ThemeData(
              textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Balsamiq Sans',
              bodyColor: Colors.white,
              displayColor: Color(0xff2c18a7))
              );
  }
}

