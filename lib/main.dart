import 'package:flutter/material.dart';
import 'package:flutter_application/views/Welcome.dart';
import 'package:flutter_application/views/login.dart';
import 'package:flutter_application/views/signup.dart';
import 'package:flutter_application/views/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart'; // Import the provider package

import 'package:get/get.dart';
import 'package:flutter_application/views/favorites_provider.dart';
import 'package:flutter_application/views/CartProvider.dart';
import 'package:flutter_application/views/plannerpage.dart';
import 'package:flutter_application/views/calender.dart';

import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil with a design size (width and height)
    ScreenUtil.init(context, designSize: Size(750, 1334));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()), // Provide your CartProvider
    
        // You can add more providers if needed
      ],
    
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // Localizations setup
      localizationsDelegates: const [
      ],
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('ar', 'SA'), // Arabic (Saudi Arabia)
      ],
      locale: const Locale('ar', 'SA'), // Set the initial locale to Arabic
      textDirection: TextDirection.rtl, // Set the initial text direction to RTL

      home: CalendarPage (),
    );
  }
}
