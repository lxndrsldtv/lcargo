import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LCNotificationService {
  LCNotificationService() {
    const androidInitializationSettings =
        AndroidInitializationSettings('app_icon');

    final iOSInitializationSettings = DarwinInitializationSettings(
        onDidReceiveLocalNotification: _onDidReceiveLocalNotification);

    final initSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iOSInitializationSettings);

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // initializationStatus =
    _flutterLocalNotificationsPlugin
        .initialize(
          initSettings,
          onDidReceiveBackgroundNotificationResponse:
              _onDidReceiveBackgroundNotificationResponse,
          onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
        )
        .then((value) => initializationSuccess = value ?? false);
  }

  late final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  bool initializationSuccess = false;

  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    log('id: $id, title: $title, body: $body, payload: $payload',
        name: 'lCargo:LCNotoficationService:onDidReceiveLocalNotification');
  }

  static void _onDidReceiveBackgroundNotificationResponse(
      NotificationResponse notificationResponse) {
    log(notificationResponse.toString(),
        name:
            'lCargo:LCNotoficationService:onDidReceiveBackgroundNotificationResponse');
  }

  void _onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) {
    log(notificationResponse.toString(),
        name: 'lCargo:LCNotoficationService:onDidReceiveNotificationResponse');
  }

  displayLocalNotification() {
    if (!initializationSuccess) return;
    _flutterLocalNotificationsPlugin.show(
        1,
        'title',
        'body',
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'channelId',
            'channelName',
            channelDescription: 'channelDescription',
            importance: Importance.high,
            priority: Priority.max,
            ticker: 'ticker',
          ),
          // iOS: DarwinNotificationDetails()
        ),
        payload: 'payload');
  }
}
