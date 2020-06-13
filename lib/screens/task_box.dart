import 'package:flutter/material.dart';
import 'package:letsdoit/screens/task_box_done.dart';


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
    if (imageurl != null && imageurl != '') return  Container(
        color: Color(0xff6600cc),
        height: 70.0,
        child: Row(children: [
          Image.network(imageurl, width: 100.0, height: 100.0, fit: BoxFit.cover),
          Expanded(child:  Container(padding:  EdgeInsets.all(5.0), child:  Column(children: [
            Text(title,  style:  TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600
              ), overflow: TextOverflow.ellipsis)
          ]
          ))
          ), TaskBoxDone(done)
        ])
    );

    return Container(
        color: Color(0xff6600cc),
        height: 70.0,
        child: Row(children: [
          Expanded(child: Container(padding: EdgeInsets.all(20.0), child:
            Text(title, 
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600
              ), 
              overflow: TextOverflow.ellipsis)
          )
          ),  TaskBoxDone(done)
        ])
    );
  }
}
