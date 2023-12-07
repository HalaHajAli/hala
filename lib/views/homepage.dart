import 'package:flutter/material.dart';
import 'package:flutter_application/views/login.dart';
import 'package:flutter_application/views/servicepage.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.green],
            stops: [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your logo here
              Image(
                image: AssetImage('images/monasaba.png'),
                width: 400, // Adjust the width as needed
                height: 400, // Adjust the height as needed
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(top: 20), // Adjust the top padding as needed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ServicePage(userType: 'Your User Type'),
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
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF5BA581),
                        onPrimary: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                        child: Text('تسجيل دخول'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaveBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: VerticalWaveClipper(),
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}

class VerticalWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.25, 0);
    path.quadraticBezierTo(
      size.width * 0.35,
      size.height * 0.25,
      size.width * 0.25,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.15,
      size.height * 0.75,
      size.width * 0.25,
      size.height,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
