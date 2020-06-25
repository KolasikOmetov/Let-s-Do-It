import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  int id;

  @HiveField(1)
  DateTime dateStart;
  @HiveField(2)
  DateTime dateFinish;

  @HiveField(3)
  String title;
  @HiveField(4)
  String description;
  @HiveField(5)
  String imageurl;

  Task(this.id, this.dateStart, this.dateFinish, this.title, this.description,
      this.imageurl);
}
