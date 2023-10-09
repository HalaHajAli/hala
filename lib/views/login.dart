import 'package:flutter/material.dart';
import 'package:flutter_application/views/signup.dart';
import 'package:flutter_application/views/servicepage.dart'; // Import the service page
import 'package:flutter_application/views/login1.dart';
import 'package:flutter_application/views/offersandsales.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image positioned at the top
          Image.asset(
            'images/monasaba.png',
            height: 400, // Adjust the height of the image
            width: 400, // Adjust the width of the image
          ),
          SizedBox(height: 50), // Adjust the spacing between the image and the first button
          // Buttons for different user types
          ElevatedButton(
            onPressed: () {
              // Navigate to the service page as a visitor
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Login1(userType: 'visitor'),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              child: Text('تسجيل الدخول كزائر'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 91, 165, 129),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Make the button oval
              ),
            ),
          ),
          SizedBox(height: 20), // Increase the spacing between the buttons
          ElevatedButton(
            onPressed: () {
              // Navigate to the service page as a planner
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Login1(userType: 'planner'),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              child: Text('تسجيل الدخول كمخطط'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 91, 165, 129),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Make the button oval
              ),
            ),
          ),
          SizedBox(height: 20), // Increase the spacing between the buttons
          ElevatedButton(
            onPressed: () {
              // Navigate to the service page as an admin
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Login1(userType: 'admin'),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              child: Text('تسجيل الدخول كمسؤول'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 91, 165, 129),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Make the button oval
              ),
            ),
          ),
          SizedBox(height: 20), // Increase the spacing between the buttons
          TextButton(
            onPressed: () {
              // Navigate to the sign-up page when the button is pressed
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
              );
            },
            style: TextButton.styleFrom(
              primary: Color.fromARGB(255, 91, 165, 129),
            ),
            child: Text('ليس لديك حساب؟ إنشاء حساب'),
          ),
        ],
      ),
    );
  }
}
