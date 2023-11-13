import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_application/views/Welcome.dart';
import 'package:flutter_application/views/login.dart';
import 'package:flutter_application/views/signup.dart';
import 'package:flutter_application/views/homepage.dart';
import 'package:flutter_application/views/plannerpage.dart';
import 'package:flutter_application/views/plannersign.dart';
import 'package:flutter_application/views/calender.dart';

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
      // Localizations setup
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('ar', 'SA'), // Arabic (Saudi Arabia)
      ],
      locale: const Locale('ar', 'SA'), // Set the initial locale to Arabic
      textDirection: TextDirection.rtl, // Set the initial text direction to RTL

      //home: CalendarPage (),
    );
  }
}
