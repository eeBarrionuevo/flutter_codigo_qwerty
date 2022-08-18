

import 'package:flutter/material.dart';
import 'package:qwerty/pages/calendar_page.dart';
import 'package:qwerty/pages/excel_page.dart';
import 'package:qwerty/pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Qwerty",
      home: CalendarPage(),
    );
  }
}

