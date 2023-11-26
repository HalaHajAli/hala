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
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_application/views/serviceadmin.dart';
import 'package:flutter_application/views/servicepage.dart';







import 'package:get/get.dart';

void main() {
  initializeDateFormatting('ar_SA', null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()), // Provide your CartProvider
        ChangeNotifierProvider(create: (context) => SalesOffersProvider()), // Provide your CartProvider


        // You can add more providers if needed
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // Localizations setup
        locale: const Locale('ar', 'SA'), // Set the initial locale to Arabic
        textDirection: TextDirection.rtl, // Set the initial text direction to RTL
        translations: Messages(), // Custom translation for Arabic
        fallbackLocale: Locale('ar', 'SA'),

        home: Welcome(), // Set your initial page here
      ),
    );
  }
}

// Custom translations for Arabic
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar_SA': {
          'title': 'عنوان',
          // Add more translations as needed
        },
      };
}
