import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventRequest {
  final String plannername;
  final String username;
  final String color;
  final String food;
  final String date;
  final String time;

  EventRequest({
    required this.plannername,
    required this.username,
    required this.color,
    required this.food,
    required this.date,
    required this.time,
  });
}

class EventRequestPage extends StatefulWidget {
  @override
  _EventRequestPageState createState() => _EventRequestPageState();
}

class _EventRequestPageState extends State<EventRequestPage> {
  Future<List<EventRequest>>? futureEventRequests;

  @override
  void initState() {
    super.initState();
    // Call a function to fetch data from the database when the widget initializes
    futureEventRequests = fetchDataFromDatabase();
  }

  Future<List<EventRequest>> fetchDataFromDatabase() async {
    // Replace this with your actual API endpoint
    final apiUrl =
        'http://192.168.1.4:4001/login2/request/?plannername=kkk';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // Parse the JSON response
        final dynamic responseData = json.decode(response.body);

        // Check if the response has the "bookings" key
        if (responseData.containsKey('bookings')) {
          final List<dynamic> bookings = responseData['bookings'];

          // Convert the JSON data to a list of EventRequest objects
          final List<EventRequest> requests = bookings
              .map((data) => EventRequest(
                    plannername: data['plannername'],
                    username: data['username'],
                    color: data['color'],
                    food: data['food'],
                    date: data['date'],
                    time: data['time'],
                  ))
              .toList();

          return requests;
        } else {
          print('Invalid data format. Expected "bookings" key.');
          return [];
        }
      } else {
        print('Failed to load data. Error ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الطلبات',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF5BA581),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Add back functionality
          },
        ),
      ),
      body: FutureBuilder<List<EventRequest>>(
        future: futureEventRequests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If still waiting for data, show a loading indicator
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If an error occurs, show an error message
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // If no data is available, show a message
            return Center(child: Text('No data available.'));
          } else {
            // If data is available, build the ListView
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final EventRequest request = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(request.username),
                    subtitle: Text(
                       // 'تاريخ: ${request.date} - الوقت: ${request.time}'
                       'تفاصيل الطلب'),
                    onTap: () {
                      _showDetailsDialog(request);
                    },
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
            );
          }
        },
      ),
    );
  }

  void _acceptRequest(int index) {
    setState(() {
      // Add logic for accepting the request
    });
  }

  void _deleteRequest(int index) {
    setState(() {
      // Add logic for deleting the request
    });
  }

  void _showDetailsDialog(EventRequest request) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تفاصيل الطلب'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('المستخدم: ${request.username}'),
              Text('تاريخ: ${request.date}'),
              Text('الوقت: ${request.time}'),
              Text('اللون: ${request.color}'),
              Text('الطعام: ${request.food}'),
              // Add more details as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('إغلاق'),
            ),
          ],
        );
      },
    );
  }
}
