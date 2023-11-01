import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> medCat = [
    {
      "icon": Icons.event,
      "category": "Appointments",
    },
    {
      "icon": Icons.note,
      "category": "Tasks",
    },
    {
      "icon": Icons.email,
      "category": "Requests",
    },
  ];

  List<Map<String, dynamic>> Events = [
    {
      "user": "User 1",
      "date": "Oct 20, 2023",
      "time": "10:00 AM",
    },
    {
      "user": "User 2",
      "date": "Oct 22, 2023",
      "time": "2:30 PM",
    },
    // Add more upcoming appointments
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          margin: EdgeInsets.only(top: 40.0), // Shift everything down
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Planner Name',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/download.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Text(
                'Category',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 60.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: medCat.length,
                  itemBuilder: (context, index) {
                    bool isSelected = false;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            isSelected ? Colors.green : Color(0xFF5BA581),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 20,
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              medCat[index]['icon'],
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              medCat[index]['category'],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 40.0), // space

              // Upcoming Appointments
              Text(
                'Upcoming Events',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
                            SizedBox(height: 20.0), // space

              Column(
                children: Events.map((appointment) {
                  return Column(
                    children: <Widget>[
                      Container( //// the outer container
                        width: 400.0,
                        height: 180.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF5BA581)),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'User: ${appointment['user']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Container( // New container for date and time
                                width: 400,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xFF5BA581),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.all(20.0),
                                margin: EdgeInsets.only(top: 15.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.calendar_today, color: Colors.white, size: 18),
                                    SizedBox(width: 8),
                                    Text(appointment['date'], style: TextStyle(color: Colors.white)),
                                    SizedBox(width: 20),
                                    Icon(Icons.access_time, color: Colors.white, size: 18),
                                    SizedBox(width: 8),
                                    Text(appointment['time'], style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.0), // Add space between inner box and buttons
                             
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 140,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add your cancel logic here
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.red),
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                      ),
                                    ),
                                    child: Text('Cancel'),
                                  ),
                                ),
                                Spacer(), // Spacer pushes the second button to the right
                                Container(
                                  width: 145,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add your completed logic here
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                      ),
                                    ),
                                    child: Text('Completed'),
                                  ),
                                ),
                              ],
                            ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0), // Add space between appointments
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
