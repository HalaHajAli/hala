import 'package:flutter/material.dart';

class MyMessagesPage extends StatelessWidget {
  // Sample list of planner names, associated IDs, and profile picture asset paths
  final List<Map<String, dynamic>> planners = [
    {'name': ' حلا علي ', 'id': 1, 'profilePicture': 'images/blank-profile-circle.png'},
    {'name': ' شهد إسماعيل', 'id': 2, 'profilePicture': 'images/blank-profile-circle.png'},
    {'name': ' شهد علي', 'id': 3, 'profilePicture': 'images/blank-profile-circle.png'},
    // Add more planner names, IDs, and profile picture asset paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5BA581),
        centerTitle: true,
        title: Text('الرسائل'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: planners.length,
        itemBuilder: (BuildContext context, int index) {
          return PlannerTile(planner: planners[index]);
        },
      ),
    );
  }
}

class PlannerTile extends StatelessWidget {
  final Map<String, dynamic> planner;

  PlannerTile({required this.planner});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                // Implement navigation to chat with the planner
                // You can use the planner['id'] to identify the specific planner
                // and navigate accordingly.
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(plannerId: planner['id'])));
              },
            ),
            Row(
              children: [
                Text(planner['name']),
                SizedBox(width: 8.0),
                CircleAvatar(
                  backgroundImage: AssetImage(planner['profilePicture']),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
