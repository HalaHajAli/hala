import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoredMessagesPage extends StatefulWidget {
  @override
  _StoredMessagesPageState createState() => _StoredMessagesPageState();
}

class _StoredMessagesPageState extends State<StoredMessagesPage> {
  final String currentUserEmail = 'shahdismail529@gmail.com'; // Replace with your email
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stored Messages'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('messages')
            .where('sender', isEqualTo: currentUserEmail)
            .orderBy('timestamp', descending: true)
            .limit(10) // Adjust the limit as needed
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var messages = snapshot.data!.docs;
          List<Widget> messageWidgets = [];
          for (var message in messages) {
            var messageText = message['text'];
            var messageSender = message['sender'];

            var messageWidget = ListTile(
              title: Text(messageText),
              subtitle: Text('Sender: $messageSender'),
            );

            messageWidgets.add(messageWidget);
          }

          return ListView(
            children: messageWidgets,
          );
        },
      ),
    );
  }
}
