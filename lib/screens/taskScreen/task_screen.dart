import 'package:flutter/material.dart';


class TaskScreen extends StatefulWidget{
  final int id;
  final String name;
  final String description;
  final DateTime dateStart;
  final DateTime dateEnd;
  

  TaskScreen(this.id, this.name, this.description, this.dateStart, this.dateEnd);

  @override
  _TaskScreenState createState() => _TaskScreenState(this.id, this.name, this.description, this.dateStart, this.dateEnd);
}

class _TaskScreenState extends State<TaskScreen> {

  int id;
  String name;
  String description;
  DateTime dateStart;
  DateTime dateEnd;

  bool _isEditing = false;

  _TaskScreenState(this.id, this.name, this.description, this.dateStart, this.dateEnd);

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nameController.text = name;
    _descriptionController.text = description;
    return Scaffold(
      backgroundColor: Color(0xff42aaff),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.delete), 
              onPressed: (){print("I switch state delete and go out");}
            ),
            IconButton(
              icon: Icon(Icons.edit), 
              onPressed: (){
                setState(() {
                  _isEditing = !_isEditing;
                });
              }
            ),
        ],),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child:
              _isEditing ? 
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Название задания'
                  ),
                  controller: _nameController
                ) 
                : 
                Text(widget.name),
          ),
          Container(
              child: 
                _isEditing ? 
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Описание задания'
                    ),
                    maxLines: null,
                    controller: _descriptionController
                  ) 
                  : 
                  Text(widget.description),
          ),
          Container(
            child: Center(
              child: _isEditing ? Text("Date Picker") : Text(widget.dateStart.toUtc().toString()),
            )
          ),
          Container(
            child: Center(
              child: _isEditing ? Text("Date Picker") : Text(widget.dateEnd.toUtc().toString()),
            )
          ),
        ],),
    );
  }
}