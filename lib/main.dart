import 'package:flutter/material.dart';

class NewsBoxFavourit extends StatefulWidget {
  final int _num;
  final bool _done;

  NewsBoxFavourit(this._num, this._done);

  @override
  createState() => new NewsBoxFavouritState(_num, _done);
}

class NewsBoxFavouritState extends State<NewsBoxFavourit> {
  int num;
  bool done;

  NewsBoxFavouritState(this.num, this.done);

  void pressButton() {
    setState(() {
      done = !done;

      if(done) num++;
      else num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
    new IconButton(
    icon: new Icon(done ? Icons.check_circle : Icons.check_circle_outline, size: 30.0, color: Colors.blue[500]),
    onPressed: pressButton);
  }
}

class NewsBox extends StatefulWidget {
  String _title;
  String _text;
  String _imageurl;
  int _num;
  bool _done;

  NewsBox(this._title, this._text, {String imageurl, int num = 0}) {
    _imageurl = imageurl;
    _num = num;
    _done = false;
  }

  @override
  createState() => new NewsBoxState(_title, _text, _imageurl, _num, _done);
}

class NewsBoxState extends State<NewsBox> {
  String title;
  String text;
  String imageurl;
  int num;
  bool done;

  NewsBoxState(this.title, this.text, this.imageurl, this.num, this.done);

  @override
  Widget build(BuildContext context) {
    if (imageurl != null && imageurl != '') return new Container(
        color: Colors.black12,
        height: 70.0,
        child: new Row(children: [
          new Image.network(imageurl, width: 100.0, height: 100.0, fit: BoxFit.cover,),
          new Expanded(child: new Container(padding: new EdgeInsets.all(5.0), child: new Column(children: [
            new Text(title,  style: new TextStyle(fontSize: 25.0), overflow: TextOverflow.ellipsis)
          ]
          ))
          ), new NewsBoxFavourit(num, done)
        ])
    );

    return new Container(
        color: Colors.black12,
        height: 70.0,
        child: new Row(children: [
          new Expanded(child: new Container(padding: new EdgeInsets.all(20.0), child:
            new Text(title, style: new TextStyle(fontSize: 25.0), overflow: TextOverflow.ellipsis)
          )
          ),  new NewsBoxFavourit(num, done)
        ])
    );
  }
}

void main() =>  runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(),
            body: new MyBody()
        )
    )
);

class MyBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new NewsBox('Помыть посуду', '',
        imageurl: '', num: 10);
  }
}