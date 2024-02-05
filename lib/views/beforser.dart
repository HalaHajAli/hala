import 'package:flutter/material.dart';
import 'package:flutter_application/views/dj.dart';
import 'package:flutter_application/views/photo.dart';
import 'package:flutter_application/views/guestlist.dart';
import 'package:flutter_application/views/flowergra.dart';
import 'package:flutter_application/views/HallServicePage.dart';
import 'package:flutter_application/views/food.dart';

class MyHomePagee extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagee> {
  List<String> selectedServices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 91, 165, 129),
        title: Text(
          'Your App Name',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
                'images/gd.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 10),
              Text(
                'اختر الخدمات:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              for (var service in services.keys)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedServices.contains(service)) {
                        selectedServices.remove(service);
                      } else {
                        selectedServices.add(service);
                      }
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              (services[service] ?? const {})['icon'] ?? Icons.error,
                              size: 30,
                              color: services[service]?['color'] as Color? ?? Colors.black,
                            ),
                            SizedBox(width: 10),
                            Text(
                              service,
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        if (selectedServices.contains(service))
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FlowerColorPage1()));
          if (selectedServices.isNotEmpty) {
            // Navigate to the pages corresponding to the selected services
            for (String selectedService in selectedServices) {
         //     navigateToPage(context, selectedService);
            }
          } else {
            // Handle case where no service is selected
            // You can show a message or take any other action
          }
        },
        child: Icon(Icons.arrow_forward, color: Colors.white),
        backgroundColor: Color.fromARGB(255, 91, 165, 129),
      ),
    );
  }

//   void navigateToPage(BuildContext context, String selectedService) {
//     switch (selectedService) {
//       case 'تنسيق الزهور':
//         Navigator.push(context, MaterialPageRoute(builder: (context) => FlowerColorPage1()));
//         break;
//       case 'القاعة':
//         Navigator.push(context, MaterialPageRoute(builder: (context) => HallServicePage()));
//         break;
//       case 'قائمة الحضور':
//         Navigator.push(context, MaterialPageRoute(builder: (context) => GuestListPage()));
//         break;
//       case 'الدي جي':
//         Navigator.push(context, MaterialPageRoute(builder: (context) => DjServicesPage()));
//         break;
//       case 'التصوير':
//         Navigator.push(context, MaterialPageRoute(builder: (context) => PhotographyGardensPage()));
//         break;
//  case 'الطعام':
//     Navigator.push(context, MaterialPageRoute(builder: (context) => FoodManagementPage()));
//     break;    }
//   }

  // Define your list of services with icons and colors
  Map<String, Map<String, dynamic>> services = {
    'تنسيق الزهور': {'icon': Icons.local_florist, 'color': Color(0xFFFF0000)}, // Red
    'قائمة الطعام': {'icon': Icons.restaurant_menu, 'color': Color(0xFF0000FF)}, // Blue
    'القاعة': {'icon': Icons.location_on, 'color': Color(0xFFFFA500)}, // Orange
    'قائمة الحضور': {'icon': Icons.people, 'color': Color(0xFF800080)}, // Purple
   // 'مصمم الحفل': {'icon': Icons.palette, 'color': Color(0xFF008000)}, // Green
    'التصوير': {'icon': Icons.camera, 'color': Color(0xFF008080)}, // Teal
    'الدي جي': {'icon': Icons.audiotrack, 'color': Color(0xFFFFC0CB)}, // Pink
  };
}

// class FlowerColorPage1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flower Color Page'),
//       ),
//       body: Center(
//         child: Text('This is the Flower Color Page'),
//       ),
//     );
//   }
// }

// class HallServicePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hall Service Page'),
//       ),
//       body: Center(
//         child: Text('This is the Hall Service Page'),
//       ),
//     );
//   }
// }

// class GuestListPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Guest List Page'),
//       ),
//       body: Center(
//         child: Text('This is the Guest List Page'),
//       ),
//     );
//   }
// }

// class DjServicesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DJ Services Page'),
//       ),
//       body: Center(
//         child: Text('This is the DJ Services Page'),
//       ),
//     );
//   }
// }

// class PhotographyGardensPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Photography Gardens Page'),
//       ),
//       body: Center(
//         child: Text('This is the Photography Gardens Page'),
//       ),
//     );
//   }
// }
