import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/views/Responsive .dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  List<Map<String, dynamic>> plannersData = [];

  @override
  void initState() {
    super.initState();
    _firstDay = DateTime(2022);
    _lastDay = DateTime(2027);
    _focusedDay = DateTime.now().isBefore(_lastDay)
        ? DateTime.now()
        : _lastDay; // Ensure focusedDay is within the valid range
  }

  Future<void> fetchPlanners() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:4001/planners'),
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      List<dynamic> data = json.decode(response.body);

      // Update the state with the fetched planner data
      setState(() {
        plannersData = List<Map<String, dynamic>>.from(data);
      });
    } else {
      // Handle error
      print('Error fetching planners: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar
          if (Responsive.isDesktop(context))
            Container(
              width: 250,
              color: Color.fromARGB(255, 91, 165, 129),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Sidebar Item with Button to Fetch Planners
                  SidebarItemWithButton(
                    title: 'المصممين',
                    icon: Icons.person,
                    onPressed: () {
                      fetchPlanners();
                    },
                  ),
                  SidebarItem(title: 'العملاء', icon: Icons.people),
                  SidebarItem(title: 'الخدمات', icon: Icons.settings),
                  SidebarItem(title: 'الطلبات', icon: Icons.shopping_cart),
                  SidebarItem(title: 'الإحصائيات', icon: Icons.bar_chart),
                  // ... Add more sidebar items as needed
                ],
              ),
            ),

          // Center Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 91, 165, 129),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'وصف عن التطبيق',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        // Add more app info if needed
                      ],
                    ),
                  ),

                  // DataTable for Planners
                  DataTable(
                    dividerThickness: 1.0,
                    columns: [
                      DataColumn(label: Text('الاسم')),
                      DataColumn(label: Text('الايميل')),
                      DataColumn(label: Text('الهاتف')),
                    ],
                    rows: plannersData.map((planner) => DataRow(
                      cells: [
                        DataCell(Text(planner['username'])),
                        DataCell(Text(planner['email'])),
                        DataCell(Text(planner['mobile'])),
                      ],
                    )).toList(),
                  ),
                ],
              ),
            ),
          ),

          // Right Container with Calendar and Admin Info (if desktop)
            if (Responsive.isDesktop(context))
            Container(
              width: 400, // Adjust the width as needed
              color: Color.fromARGB(255, 91, 165, 129), // Green background color
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'التاريخ: ${_focusedDay.day}/${_focusedDay.month}/${_focusedDay.year}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Calendar
                          TableCalendar(
                            focusedDay: _focusedDay,
                            firstDay: _firstDay,
                            lastDay: _lastDay,
                            calendarFormat: CalendarFormat.month,
                            headerStyle: HeaderStyle(
                              formatButtonTextStyle: TextStyle().copyWith(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                              formatButtonDecoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                            calendarStyle: CalendarStyle(
                              selectedDecoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              todayDecoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                            ),
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _focusedDay = focusedDay;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Container with admin info and details
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 400, // Match the width of the right side
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'معلومات الإداري',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Add admin info and details here
                        SizedBox(height: 10),
                        Text('اسم الإداري: John Doe'),
                        Text('البريد الإلكتروني: admin@example.com'),
                        Text('رقم الهاتف: 123456789'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const SidebarItem({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class SidebarItemWithButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const SidebarItemWithButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0,
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
