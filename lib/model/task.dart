import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final DateTime dateStart;
  @HiveField(2)
  final DateTime dateFinish;

  @HiveField(3)
  final String title;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String imageurl;

  Task(this.id, this.dateStart, this.dateFinish, this.title, this.description,
      this.imageurl);
}
