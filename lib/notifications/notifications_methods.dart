import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:letsdoit/main.dart';
import 'package:letsdoit/model/task.dart';

class NotificationsMethods {
  static void scheduleAlarm(Task task) async {
    var scheduledNotificationDateTime = task.dateStart;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      task.title,
      task.description,
      'Channel for Alarm notification',
      icon: 'ic_launcher_web',
      sound: RawResourceAndroidNotificationSound('pu'),
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
}
