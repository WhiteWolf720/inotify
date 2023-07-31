import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin notificationPlugin=FlutterLocalNotificationsPlugin();
Future<void> startiNOTIFY() async{
  const AndroidInitializationSettings initialConfig=AndroidInitializationSettings('app_icon');
  const InitializationSettings initializationSettings=InitializationSettings(android: initialConfig);
  await notificationPlugin.initialize(initializationSettings);
}
Future<void> inotifyExe() async{
  const AndroidNotificationDetails androidDetails=AndroidNotificationDetails('channel_id', 'channel_name');
  const NotificationDetails notificationDetails=NotificationDetails(android: androidDetails);
  await notificationPlugin.show(2, "Got 'Em", "Los Air Jordan 1 'Lost And Found' son tuyos", notificationDetails);
}