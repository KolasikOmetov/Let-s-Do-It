import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'app.dart';
import 'model/task.dart';

void main() async {
  final doc = await getApplicationDocumentsDirectory();
  Hive.init(doc.path);
  Hive.registerAdapter(TaskAdapter());
  runApp(App());
}
