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

  _showLocalNotification() async{

    AndroidInitializationSettings _androidInitializationSettings = AndroidInitializationSettings("@mipmap/ic_launcher");

    InitializationSettings _initializationSettings = InitializationSettings(
      android: _androidInitializationSettings,
    );

    bool? res = await _flutterLocalNotificationsPlugin.initialize(_initializationSettings);

    // print(res);

    _flutterLocalNotificationsPlugin.show(
      0,
      "Hola",
      "Cuerpo",
      NotificationDetails(
        android: AndroidNotificationDetails(
          "prueba para el canal ID",
          "prueba del nombre",
        )
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
