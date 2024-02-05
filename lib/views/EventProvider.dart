import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Table Calendar Example'),
        ),
        body: EventCalendar(),
      ),
    );
  }
}

class EventCalendar extends StatefulWidget {
  @override
  _EventCalendarState createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  final EventProvider eventProvider = EventProvider();
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime(2000),
          lastDay: DateTime(2050),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update the focused day to selected day
            });
          },
          calendarFormat: CalendarFormat.month,
          calendarBuilders: CalendarBuilders(
            // Add any required builders as needed
          ),
        ),
        Expanded(
          child: EventList(events: eventProvider.getEvents),
        ),
      ],
    );
  }
}

class EventList extends StatelessWidget {
  final List<EventRequest> events;

  EventList({required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(events[index].plannername),
          subtitle: Text(events[index].date),
          // ... other event details
        );
      },
    );
  }
}

class EventProvider with ChangeNotifier {
  List<EventRequest> events = [];

  List<EventRequest> get getEvents => events;

  void sendRequest(EventRequest event) {
    events.add(event);
    notifyListeners();
  }
}

class EventRequest {
  final String plannername;
  final String package;
  final String username;
  final String color;
  final String food;
  final String date;
  final String time;

  EventRequest({
    required this.plannername,
    required this.package,
    required this.username,
    required this.color,
    required this.food,
    required this.date,
    required this.time,
  });
}
