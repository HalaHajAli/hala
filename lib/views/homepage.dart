import 'package:flutter/material.dart';
import 'package:flutter_application/views/login1.dart';
import 'package:flutter_application/views/servicepage.dart';
import 'package:flutter_application/views/signup.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 141, 230, 187)],
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
                padding: EdgeInsets.only(
                    top: 20), // Adjust the top padding as needed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                               Login1 (),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Color(0xFF5BA581), // Color of the gradient
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        child: Text(
                          'تسجيل دخول ',
                          style: TextStyle(
                              fontWeight:
                                  FontWeight.bold), // Making the text bold
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: Color(0xFF5BA581), // Color of the gradient
                        primary: Colors.white, // White background
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        child: Text(
                          ' إنشاء حساب',
                          style: TextStyle(
                              fontWeight:
                                  FontWeight.bold), // Making the text bold
                        ),
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
