import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationPage extends StatefulWidget {
  const LocalNotificationPage({Key? key}) : super(key: key);

  @override
  State<LocalNotificationPage> createState() => _LocalNotificationPageState();
}

class _LocalNotificationPageState extends State<LocalNotificationPage> {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  _showLocalNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings("@mipmap/ic_launcher",);

    IOSInitializationSettings iosInitializationSettings = IOSInitializationSettings(
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    _flutterLocalNotificationsPlugin.show(
      0,
      "Hola 2323",
      "Cuerpo 23213",
      NotificationDetails(
        android: AndroidNotificationDetails(
          "prueba para el canal ID",
          "prueba del nombre",
          enableVibration: true,
          priority: Priority.max,
          importance: Importance.max,
        ),
        iOS: IOSNotificationDetails(
          threadIdentifier: "ID PRUEBA IOS",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showLocalNotification();
              },
              child: Text(
                "Show",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
