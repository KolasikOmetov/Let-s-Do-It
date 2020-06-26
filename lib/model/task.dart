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

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        dateStart = DateTime.fromMillisecondsSinceEpoch(json['date_start']),
        dateFinish = DateTime.fromMillisecondsSinceEpoch(json['date_finish']),
        title = json['name'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_start": dateStart.millisecondsSinceEpoch,
        "date_finish": dateFinish.millisecondsSinceEpoch,
        "name": title,
        "description": description
      };
}
