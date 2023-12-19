import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_application/views/homepage.dart';
import 'package:flutter_application/views/login1.dart';
import 'package:flutter_application/views/signup.dart';
import 'package:flutter_application/views/flower.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/favorites_provider.dart';
import 'package:flutter_application/views/food.dart';
import 'package:flutter_application/views/CartProvider.dart';
import 'package:flutter_application/views/HallServicePage.dart';
import 'package:flutter_application/views/flowergra.dart';
import 'package:flutter_application/views/flowerbaby.dart';
import 'package:flutter_application/views/flowerbirth.dart';
import 'package:flutter_application/views/saleprovider.dart';
import 'package:flutter_application/views/serviceadmin.dart';
import 'package:flutter_application/views/guestlist.dart';





class birthdayServicePage extends StatefulWidget {
  @override
  _birthdayServicePageState createState() => _birthdayServicePageState();
}
class _birthdayServicePageState extends State<birthdayServicePage> {
 String selectedService = '';

  List<Map<String, dynamic>> serviceOptions = [
    {'text': 'تنسيق الزهور', 'icon': Icons.local_florist},
    {'text': 'قائمة الطعام', 'icon': Icons.fastfood},
    {'text': 'القاعة', 'icon': Icons.location_city},
    {'text': 'قائمة الحضور', 'icon': Icons.person},
    // Add more service options if needed
  ];

  void navigateToFoodPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodManagementPage(),
      ),
    );
  }

  void navigateToFlowerPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FlowerColorPage3(),
      ),
    );
  }

  void navigateToHallPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HallServicePage(),
      ),
    );
  }

  void navigateToGuestPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GuestListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5BA581),
        title: Text(' أعياد الميلاد '),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.green],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: serviceOptions.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedService = item['text'];
                    });
                    if (item['text'] == 'تنسيق الزهور') {
                      navigateToFlowerPage();
                    } else if (item['text'] == 'قائمة الطعام') {
                      navigateToFoodPage();
                    } else if (item['text'] == 'القاعة') {
                      navigateToHallPage();
                    } else if (item['text'] == 'قائمة الحضور') {
                      navigateToGuestPage();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the content
                    children: [
                      Icon(
                        item['icon'],
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        item['text'],
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF5BA581),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}