import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late Map<DateTime, List<Event>> _events;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    DateTime lastDay = DateTime.utc(2023, 12, 31);

    if (!_focusedDay.isBefore(lastDay)) {
      _focusedDay = lastDay.subtract(Duration(days: 1));
    }

    _events = {
      DateTime.utc(2023, 11, 4): [
        Event('تفاصيل الحدث 1', DateTime(2023, 11, 4, 9, 0), 'وصف الحدث 1'),
        Event('تفاصيل الحدث 2', DateTime(2023, 11, 4, 15, 30), 'وصف الحدث 2'),
      ],
      DateTime.utc(2023, 11, 6): [
        Event('تفاصيل الحدث 3', DateTime(2023, 11, 6, 12, 0), 'وصف الحدث 3'),
      ],
      DateTime.utc(2023, 12, 10): [
        Event('تفاصيل الحدث 4', DateTime(2023, 12, 10, 11, 0), 'وصف الحدث 4'),
      ],
      DateTime.utc(2023, 12, 15): [
        Event('تفاصيل الحدث 5', DateTime(2023, 12, 15, 14, 30), 'وصف الحدث 5'),
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('تقويم المناسبات'),
          backgroundColor: Color(0xFF5BA581),
          titleSpacing: 50.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TableCalendar(
                locale: 'ar',
                firstDay: DateTime.utc(2021, 1, 1),
                lastDay: DateTime.utc(2023, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });

                  if (_events[selectedDay] != null &&
                      _events[selectedDay]!.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("الأحداث في $selectedDay"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _events[selectedDay]!.map((event) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(event.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      'التاريخ: ${event.dateTime.day}/${event.dateTime.month}/${event.dateTime.year}'),
                                  Text('الوقت: ${event.dateTime.hour}:${event.dateTime.minute}'),
                                  Text(event.description),
                                  SizedBox(height: 10),
                                  Divider(),
                                  SizedBox(height: 10),
                                ],
                              );
                            }).toList(),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('إغلاق'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                eventLoader: (day) {
                  return _events[day] ?? [];
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Color(0xFF5BA581),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFF5BA581).withOpacity(0.5),
                    shape: BoxShape.rectangle,
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayTextStyle: TextStyle(color: Colors.white),
                  defaultTextStyle: TextStyle(color: Colors.black),
                ),
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  titleTextStyle: TextStyle().copyWith(color: Color(0xFF5BA581)),
                  formatButtonVisible: false,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle().copyWith(color: Color(0xFF5BA581)),
                  weekendStyle: TextStyle().copyWith(color: Color(0xFF5BA581)),
                ),
                daysOfWeekHeight: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Event {
  final String title;
  final DateTime dateTime;
  final String description;

  Event(this.title, this.dateTime, this.description);
}
