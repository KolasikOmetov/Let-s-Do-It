import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'app.dart';

void main() async {
  // Directory doc = await getApplicationDocumentsDirectory();
  // Hive.init(doc.path);
  runApp(App());
}
