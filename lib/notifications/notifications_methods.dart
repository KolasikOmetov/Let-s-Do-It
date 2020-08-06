import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:letsdoit/main.dart';
import 'package:letsdoit/model/task.dart';

class NotificationsMethods {
  static scheduleTask(Task task) async {
    var scheduledNotificationDateTime = task.dateStart;

    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      task.id.toString(),
      task.title,
      task.description,
      icon: 'ic_launcher_web',
      sound: RawResourceAndroidNotificationSound('pu'),
      vibrationPattern: vibrationPattern,
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher_web'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'pu.mp3',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        task.title,
        task.description,
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  static deleteNotificationChannel(String channelId) async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.deleteNotificationChannel(channelId);
  }
}
