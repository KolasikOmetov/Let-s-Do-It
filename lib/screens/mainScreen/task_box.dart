import 'package:flutter/material.dart';
import 'package:letsdoit/screens/mainScreen/task_box_done.dart';
import 'package:letsdoit/screens/taskScreen/task_screen.dart';


class TaskBox extends StatefulWidget {
  String _title;
  String _text;
  String _imageurl;
  int _id;
  bool _done;

  TaskBox(this._title, this._text, {String imageurl, int id}) {
    _imageurl = imageurl;
    _id = id;
    _done = false;
  }

  @override
  createState() =>  TaskBoxState(_title, _text, _imageurl, _id, _done);
}



class TaskBoxState extends State<TaskBox> {
  String title;
  String text;
  String imageurl;
  int id;
  bool done;

  TaskBoxState(this.title, this.text, this.imageurl, this.id, this.done);

  @override
  Widget build(BuildContext context) {
    return
    Dismissible(
      background: 
      Container(
        color: Color(0xffce4de7),
        child: Center(
          child: Text("Удаляем...",
          style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400),  
          ),
        )
      ),
      key: UniqueKey(),
      onDismissed: (direction) {
        //res.delete();
      },
      child:
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskScreen(5, "name", "description", DateTime.now(), DateTime.now())),
            );
          },
        child: 
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            color: Color(0xff6600cc),
            height: 70.0,
            child: Row(children: [
              (imageurl != null && imageurl != '') ? Image.network(imageurl, width: 100.0, height: 100.0, fit: BoxFit.cover) : Container(),
              Expanded(child:  
                Container(padding:  EdgeInsets.all(5.0), child:  Column(children: [
                    Text(title,  
                      style:  
                        TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600
                        ), 
                      overflow: TextOverflow.ellipsis
                    )
                    ]
                  )
                )
              ), TaskBoxDone(done)
            ])
          )
        )
      );
  }
}
