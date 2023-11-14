import 'package:flutter/material.dart';
import 'package:flutter_application/views/signup.dart';
import 'package:flutter_application/views/login1.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image positioned at the top
            Image.asset(
              'images/monasaba.png',
              height: screenHeight * 0.3, // Responsive height
              width: screenWidth * 0.6, // Responsive width
            ),
            SizedBox(height: screenHeight * 0.05), // Responsive spacing

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
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.2, // Responsive width
                  vertical: screenHeight * 0.02, // Responsive height
                ),
                child: Text('تسجيل الدخول كزائر'),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 91, 165, 129),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.05), // Responsive shape
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing

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
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.2, // Responsive width
                  vertical: screenHeight * 0.02, // Responsive height
                ),
                child: Text('تسجيل الدخول كمخطط'),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 91, 165, 129),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.05), // Responsive shape
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing

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
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.2, // Responsive width
                  vertical: screenHeight * 0.02, // Responsive height
                ),
                child: Text('تسجيل الدخول كمسؤول'),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 91, 165, 129),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.05), // Responsive shape
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing

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
      ),
    );
  }
}
