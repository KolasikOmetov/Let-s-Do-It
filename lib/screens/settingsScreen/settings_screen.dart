import 'package:flutter/material.dart';
import 'package:letsdoit/screens/settingsScreen/app_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff42aaff),
      appBar: AppBar(
          backgroundColor: Color(0xff2c18a7),
          title: Center(
            child: Text(
              "Настройки",
              style: TextStyle(
                  fontFamily: "Balsamiq Sans",
                  fontWeight: FontWeight.w800,
                  fontSize: 24),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              AppIcon(),
              Text("Let's Do It"),
            ],
          ),
          SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(color: Theme.of(context).accentColor),
                    child: SelectableText(
                        "Приложение \"Let's Do It\" предназначено для создания списка дел на день.\n\nРазработчик приложения: Омётов Николай.\n\nEmail: N.O.DJ@yandex.ru",
                        showCursor: true,
                        toolbarOptions: ToolbarOptions(copy: true),
                        cursorColor: Color(0xffce4de7),
                        cursorWidth: 5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FloatingActionButton(
                          heroTag: 'btnGitHub',
                          backgroundColor: Colors.black,
                          child: Icon(AntDesign.github),
                          onPressed: () =>
                              launch('https://github.com/KolasikOmetov')),
                      FloatingActionButton(
                          heroTag: 'btnVK',
                          backgroundColor: Colors.lightBlue[900],
                          child: Icon(Fontisto.vk),
                          onPressed: () =>
                              launch('https://vk.com/nodjmusician')),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
