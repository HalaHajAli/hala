import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application/views/login.dart';
import 'package:flutter_application/views/login1.dart';
import 'package:flutter_application/views/homepage.dart';


import 'dart:async';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _imageOffset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _imageOffset = Tween<Offset>(
      begin: Offset(0, 1), // Image starts off-screen at the bottom
      end: Offset(0, 0), // Image ends at the center
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation when the widget is built
    _controller.forward();

    // Delay navigation to the Login page after animation completes
    Timer(Duration(seconds: 3), () {
      Get.to(() => SelectionPage()); // Navigate to the Login page
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SlideTransition(
          position: _imageOffset,
          child: Image.asset('images/monasaba.png'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
