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


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _userImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _userImage = File(pickedImage.path);
      });
    }
  }

  void navigateToLoginPage() {
    // Navigate to the login page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Login1(),
      ),
    );
  }

  void navigateToSignUpPage() {
    // Navigate to the signup page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5BA581),
        title: Text('ملفي الشخصي'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _pickImage, // Call the image picker function
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: _userImage != null
                    ? FileImage(_userImage!)
                    : AssetImage('images/blank-profile-circle.png') as ImageProvider,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'الملف الشخصي, عزيزي الزائر!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight, // Align buttons to the maximum right
              child: Column(
                children: [
                  GestureDetector(
                    onTap: navigateToLoginPage, // Navigate to login page
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF5BA581), // Green color
                      ),
                    ),
                  ),
                  Divider( // Add a divider line
                    thickness: 1,
                    color: Color(0xFF5BA581), // Green color
                  ),
                  GestureDetector(
                    onTap: navigateToSignUpPage, // Navigate to signup page
                    child: Text(
                      'إنشاء حساب جديد',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF5BA581), // Green color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}