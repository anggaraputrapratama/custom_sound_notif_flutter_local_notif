import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationWidget {
  static final _notif = FlutterLocalNotificationsPlugin();

  static Future init({bool scheduled = false}) async {
    var initAndroidSettings =
        const AndroidInitializationSettings('mipmap/ic_launcher');
    final settings = InitializationSettings(android: initAndroidSettings);
    await _notif.initialize(settings);
  }

  static Future showNotification({
    var id = 0,
    var title,
    var body,
    var payload,
  }) async =>
      _notif.show(id, title, body, await notificationDetails());

  static notificationDetails() async {
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 1200;
    vibrationPattern[1] = 3000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;
    const sound = 'dangerous.wav';
    return NotificationDetails(
        android: AndroidNotificationDetails(
            'channel id 1d81', 'channel name 0 ',
            audioAttributesUsage: AudioAttributesUsage.notification,
            importance: Importance.high,
            enableLights: true,
            vibrationPattern: vibrationPattern,
            ledColor: Colors.red,
            playSound: true,
            ledOffMs: 100,
            ledOnMs: 500,
            sound:
                RawResourceAndroidNotificationSound(sound.split('.').first)));
  }
}
