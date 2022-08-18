import 'package:flutter/material.dart';
import 'package:qwerty/utils/utils_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;


  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar Page"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          TableCalendar(
            // locale: 'es',
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            headerVisible: true,
            daysOfWeekVisible: true,
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            headerStyle: HeaderStyle(
              formatButtonShowsNext: false,
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontSize: 18.0
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            onDaySelected: (selectedDay, focusedDay){
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  print(selectedDay);
                  print(focusedDay);
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
