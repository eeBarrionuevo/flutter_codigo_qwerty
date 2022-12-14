

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qwerty/pages/calendar_page.dart';
import 'package:qwerty/pages/excel_page.dart';
import 'package:qwerty/pages/home_page.dart';
import 'package:qwerty/pages/local_notification_page.dart';
import 'package:qwerty/utils/push_notification_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PushNotificationService.initializedApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Qwerty",
      home: LocalNotificationPage(),
    );
  }
}

