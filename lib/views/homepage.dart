import 'package:flutter/material.dart';
import 'package:flutter_application/views/login.dart';
import 'package:flutter_application/views/login1.dart';
import 'package:flutter_application/views/servicepage.dart';
import 'package:flutter_application/views/signup.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                Image(
                  image: AssetImage('images/monasaba.png'),
                  width: 400,
                  height: 400,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Login1(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Color(0xFF5BA581),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 30.0),
                          child: Text(
                            'تسجيل دخول ',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                          onPrimary: Color(0xFF5BA581),
                          primary: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 30.0),
                          child: Text(
                            ' إنشاء حساب',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 90),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.arrow_downward,
                          size: 20,
                          color: Color(0xFF5BA581),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
