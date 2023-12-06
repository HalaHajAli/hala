import 'package:flutter/material.dart';
import 'package:flutter_application/views/calender.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> medCat = [
    {
      "icon": Icons.event,
      "category": "المواعيد",
    },
    {
      "icon": Icons.note,
      "category": "المهام",
    },
    {
      "icon": Icons.email,
      "category": "الطلبات",
    },
  ];

  List<Map<String, dynamic>> Events = [
    {
      "user": "المستخدم 1",
      "date": "20 أكتوبر 2023",
      "time": "10:00 ص",
    },
    {
      "user": "المستخدم 2",
      "date": "22 أكتوبر 2023",
      "time": "2:30 م",
    },
    // Add more upcoming appointments
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        _scaffoldKey.currentState?.openEndDrawer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF5BA581),
        title: Text("اسم المنسق"),
        actions: [
          IconButton(
            icon: Icon(Icons.menu), // Replace with your icon (e.g., three dashes)
            onPressed: () {
              // Handle the action here to open the End Drawer
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
endDrawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        height: 250, // Adjust the height as needed
        child: DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFF5BA581),
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/your_image.png'), // Replace with your image path
                radius: 50,
              ),
              SizedBox(height: 5),
              Text(
                'Planner Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Text(
                'planner@email.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      ListTile(
        title: Row(
          children: [
            Icon(Icons.message, color: Colors.black), // Add an icon for Messages
            SizedBox(width: 10),
            Text('الرسائل'), // Change to Arabic
          ],
        ),
        
      ),
      ListTile(
        title: Row(
          children: [
            Icon(Icons.logout, color: Colors.black), // Add an icon for Log Out
            SizedBox(width: 10),
            Text('تسجيل الخروج'), // Change to Arabic
          ],
          
        ),
        onTap: () {
          // Handle Log Out action
        },
      ),
    ],
  ),
),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          margin: EdgeInsets.only(top: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Add any additional widgets here
                ],
              ),
              SizedBox(height: 7.0),
              Text(
                'الفئة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7.0),
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
                          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage()),
              );
              break;
            case 1:
              
              break;
            case 2:
              // Add navigation for the third icon in medCat
              break;
            default:
              break;
          }
        
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
                ) 
              ),




              SizedBox(height: 1.0),
              Text(
                'الفعاليات القادمة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Column(
                children: Events.map((appointment) {
                  return Column(
                    children: <Widget>[
                      Container(
                        width: 400.0,
                        height: 183.0,
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
                                    'المستخدم: ${appointment['user']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
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
                              SizedBox(height: 10.0),
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
                                      child: Text('إلغاء'),
                                    ),
                                  ),
                                  Spacer(),
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
                                      child: Text('مكتمل'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
                    backgroundColor: Color(0xFF5BA581) ,

        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF5BA581) ,
            icon: Icon(Icons.account_circle,color: Colors.white),
            label: 'الملف الشخصي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message ,color: Colors.white),
            label: 'الرسائل',
          ),
        ],
     unselectedLabelStyle: TextStyle(color: Colors.white), // Set the color for unselected labels

        onTap: onTabTapped,
      ),
    );
  }
}