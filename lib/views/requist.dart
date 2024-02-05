import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/NameProvider.dart';
import 'package:flutter_application/views/EventProvider.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_application/views/exc.dart';
import 'package:flutter_application/views/watingList.dart';

class EventRequestPage extends StatefulWidget {
  @override
  _EventRequestPageState createState() => _EventRequestPageState();
}

class _EventRequestPageState extends State<EventRequestPage> {
  List<EventRequest> eventRequests = [];

  @override
  void initState() {
    super.initState();
    NameProvider packageProvider =
        Provider.of<NameProvider>(context, listen: false);

    fetchDataFromDatabase(packageProvider);
  }


 Future<void> fetchDataFromDatabase(NameProvider nameProvider) async {
  final apiUrl = 'http://192.168.1.6:4001/login2/request/';
  EventProvider eventProvider = Provider.of<EventProvider>(context, listen: false);

  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body);
    print('Raw JSON Response: $responseData');

      if (responseData != null && responseData.containsKey('bookings')) {
        final List<dynamic> bookings = responseData['bookings'];
        final List<EventRequest> requests = bookings
            .map((data) => EventRequest(
                  plannername: data['plannername'],
                  package: data['packagename'],
                  username: data['username'],
                  color: data['color'],
                  food: data['food'],
                  date: data['date'],
                  time: data['time'],
                ))
            .toList();

        setState(() {
          eventRequests = requests;
        }); 

        for (EventRequest request in requests) {
          Provider.of<EventProvider>(context, listen: false).sendRequest(request);

          print('Printing values for EventRequest:');
          print('Planner Name: ${request.plannername}');
          print('Planner Name: ${request.package}');
          print('Username: ${request.username}');
          print('Color: ${request.color}');
          print('Food: ${request.food}');
          print('Date: ${request.date}');
          print('Time: ${request.time}');

          // Check if the date is within the last two months
          DateTime requestDate = DateTime.parse(request.date);
          DateTime currentDate = DateTime.now();
          DateTime twoMonthsAgo = currentDate.add(Duration(days: 60));

          if (requestDate.isBefore(twoMonthsAgo)) {
            Provider.of<ExecutionListProvider>(context, listen: false).addToExecutionList(request);
        //    print('Added to Execution List: $request');
          } else {
            Provider.of<WaitingListProvider>(context, listen: false).addToWaitingList(request);
            print('Added to Waiting List: $request');

          }
        }
      } else {
        print('Invalid data format. Expected "bookings" key.');
      }
    } else {
      print('Failed to load data. Error ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching data: $error');
  }
}





  @override
  Widget build(BuildContext context) {
    NameProvider packageProvider = Provider.of<NameProvider>(context);

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
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: eventRequests.length,
        itemBuilder: (context, index) {
          final EventRequest request = eventRequests[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(packageProvider.getUsername),
              subtitle: Text('تفاصيل الطلب'),
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
      ),
    );
  }

 void _acceptRequest(int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('تأكيد القبول'),
        content: Text("تم نأكيد الطلب"),
        actions: [
          TextButton(
            onPressed: () {
              _handleMoveToWaitingList(index);
              setState(() {
                eventRequests.removeAt(index); // Remove the item from the list
              });
              Navigator.of(context).pop();
            },
            child: Text('موافق'),
          ),
        
        ],
      );
    },
  );
}


 void _deleteRequest(int index) async {
  // Get the request to be deleted
 // EventRequest requestToDelete = eventRequests[index];

  setState(() {
  //  eventRequests.removeAt(index);
  });

  // Send an email to the user
  // sendEmailToUser(requestToDelete);

}


  void _handleMoveToWaitingList(int index) {
  
  }

  void _handleMoveToExecution(int index) {
  
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
                          Text('اسم العرض: ${request.package}'),

              Text('تاريخ: ${request.date}'),
              Text('الوقت: ${request.time}'),
              Text('اللون: ${request.color}'),
              Text('الطعام: ${request.food}'),
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

// void sendEmailToUser(EventRequest request) async {
//   // Set up the SMTP server configuration
// final smtpServer = SmtpServer('smtp.gmail.com',
//     username: 's11923615@stu.najah.edu',
//     password: "WpL\$67045",
//     port: 465,
//     ssl: true,
//   );

//   // Create the email message
//   var message = Message()
//     ..from = Address('s11923615@stu.najah.edu', 'hala') // Set sender's email
// ..recipients.add('shahdismail529@gmail.com') // Set recipient's email
// ..subject = 'Your request has been declined'
// ..text = 'Dear shahdismail529@gmail.com,\n\n' // Use the specific recipient email
//     'We regret to inform you that your request has been declined.\n'
//     'Thank you for using our service.';
// try {
//   final sendReport = await send(message, smtpServer);
//   print('Message sent: ' + sendReport.toString());
// } catch (e) {
//   print('Error sending email: $e');
// }


