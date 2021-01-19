import 'package:flutter/material.dart';
import 'package:demo_jb/api/date_api/variable.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPage extends StatefulWidget {
  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  CalendarController _calendarController = CalendarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 50.0),
              width: 330.0,
              child: TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.selectedDay,
                calendarController: _calendarController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
