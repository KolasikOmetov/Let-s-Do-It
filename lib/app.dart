import 'package:flutter/material.dart';
import 'package:letsdoit/screens/main_screen.dart';


class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme(context),
      home: MainScreen()
    );
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

