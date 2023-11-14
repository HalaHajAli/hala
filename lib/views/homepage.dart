import 'package:flutter/material.dart';
import 'package:flutter_application/views/login.dart';
import 'package:flutter_application/views/servicepage.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Option'),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo here
            Image(
              image: AssetImage('images/monasaba.png'),
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            Row( // Use Row for horizontal layout
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded( // Wrap the first button in an Expanded widget
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                         builder: (context) => ServicePage(userType: 'Your User Type'), // Provide a user type here
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Color(0xFF5BA581),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                      child: Text('إكتشف'),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Adjust the spacing between buttons
                Expanded( // Wrap the second button in an Expanded widget
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5BA581),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                      child: Text('تسجيل دخول'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
