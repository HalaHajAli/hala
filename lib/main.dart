import 'package:flutter/material.dart';
import 'package:flutter_application/views/Welcome.dart';
import 'package:flutter_application/views/login.dart';
import 'package:flutter_application/views/signup.dart';
import 'package:flutter_application/views/homepage.dart';
import 'package:flutter_application/views/plannerpage.dart';
import 'dart:io';
import 'package:flutter_application/views/plannersign.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
