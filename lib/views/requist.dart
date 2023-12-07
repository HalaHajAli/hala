import 'package:flutter/material.dart';

class EventRequest {
  final String userName;
  final String details;

  EventRequest({required this.userName, required this.details});
}

class EventRequestPage extends StatefulWidget {
  @override
  _EventRequestPageState createState() => _EventRequestPageState();
}

class _EventRequestPageState extends State<EventRequestPage> {
  List<EventRequest> eventRequests = [
    EventRequest(userName: 'المستخدم 1', details: 'تفاصيل الحدث 1'),
    EventRequest(userName: 'المستخدم 2', details: 'تفاصيل الحدث 2'),
    // Add more requests as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الطلبات',
          style: TextStyle(color: Colors.white), // Change title color to white
        ),
        backgroundColor: Color(0xFF5BA581),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Add back functionality
          },
        ),
      ),
      body: ListView.builder(
        itemCount: eventRequests.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(eventRequests[index].userName),
              subtitle: Text(eventRequests[index].details),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.check, color: Colors.green),
                    onPressed: () {
                      _acceptRequest(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _deleteRequest(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _acceptRequest(int index) {
    setState(() {
      eventRequests.removeAt(index);
    });
  }

  void _deleteRequest(int index) {
    setState(() {
      eventRequests.removeAt(index);
    });
  }
}
