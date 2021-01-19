import 'package:day_selector/day_selector.dart';
import 'package:flutter/material.dart';
import 'package:demo_jb/api/date_api/variable.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demo_jb/api/date_api/calander_page.dart';
import 'package:table_calendar/table_calendar.dart';

class DateApiHomePage extends StatefulWidget {
  @override
  _DateApiHomePageState createState() => _DateApiHomePageState();
}

class _DateApiHomePageState extends State<DateApiHomePage> {
  bool isFill = false;
  bool yearFill = false;
  bool dayFill = false;
  final TextEditingController _controller = TextEditingController();
  void get(day) async {
    http.Response response = await http.get(
        "https://kkbhimani.000webhostapp.com/api/calendar.php?arg_year=$year&arg_day_of_weak=$selectedValue");
    data = json.decode(response.body)[1].toString();
    print(data);
    try {} catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Date API",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 100.0,
                margin: EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 230,
                      height: 220,
                      child: TextField(
                        controller: _controller,
                        onSubmitted: (value) {
                          setState(() {
                            year = value;
                            if (yearFill == true && dayFill == true) {
                              isFill = true;
                            } else {
                              isFill = false;
                            }
                            if (_controller.text == null) {
                              yearFill = false;
                            } else {
                              isFill = true;
                            }
                          });
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          icon: Text("Year"),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Year',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text("Select First Day of Week!"),
              Container(
                height: 90.0,
                margin: EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 336,
                      height: 100,
                      child: DaySelector(
                        value: null,
                        color: Colors.white,
                        mode: DaySelector.modeFull,
                        onChange: (value) {
                          setState(() {
                            dayFill = true;
                            if (DaySelector.monday & value ==
                                DaySelector.monday) {
                              selectedDayValue = 1;
                              selectedDay = 'monday';
                            }
                            if (DaySelector.tuesday & value ==
                                DaySelector.tuesday) {
                              selectedDayValue = 2;
                              int _getWeekdayNumber(StartingDayOfWeek weekday) {
                                return StartingDayOfWeek.values
                                        .indexOf(weekday) +
                                    1;
                              }

                              ;
                            }
                            if (DaySelector.wednesday & value ==
                                DaySelector.wednesday) {
                              selectedDayValue = 3;
                              selectedDay = 'wednesday';
                            }
                            if (DaySelector.thursday & value ==
                                DaySelector.thursday) {
                              selectedDayValue = 4;
                              selectedDay = 'thursday';
                            }
                            if (DaySelector.friday & value ==
                                DaySelector.friday) {
                              selectedDayValue = 5;
                              selectedDay = 'friday';
                            }
                            if (DaySelector.saturday & value ==
                                DaySelector.saturday) {
                              selectedDayValue = 6;
                              selectedDay = 'saturday';
                            }
                            if (DaySelector.sunday & value ==
                                DaySelector.sunday) {
                              selectedDayValue = 7;
                              selectedDay = 'sunday';
                            }
                            selectedValue = selectedDayValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Visibility(
                  visible: isFill,
                  child: RaisedButton(
                      color: Colors.white,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        get(selectedValue);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CalenderPage()));
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
