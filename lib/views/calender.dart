import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(CalendarApp());
}

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'المواعيد',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        hintColor: Color(0xFF5BA581),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CalendarPage(),
    );
  }
}

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
    _events = {
      DateTime.now(): [Event('حدث 1'), Event('حدث 2')],
      DateTime.now().add(Duration(days: 1)): [Event('حدث 3')],
      DateTime.now().add(Duration(days: 3)): [Event('حدث 4')],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المواعيد'),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
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
                  borderRadius: BorderRadius.circular(5.0),
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
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  final event = events.firstOrNull;
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF5BA581),
                    ),
                    width: 6.0,
                    height: 6.0,
                  );
                },
              ),
              locale: 'ar',
             // direction: TextDirection.rtl,
              daysOfWeekHeight: 50, // Adjust this value as needed
            ),
            SizedBox(height: 20),
            _buildEventList(),
          ],
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _events[_selectedDay]?.length ?? 0,
      itemBuilder: (context, index) {
        final event = _events[_selectedDay]![index];
        return ListTile(
          title: Text(event.title, style: TextStyle(color: Color(0xFF5BA581))),
          trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF5BA581)),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(event.title),
                  content: Text('Details for ${event.title}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}

class Event {
  final String title;
  Event(this.title);
}
