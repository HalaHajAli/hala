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
import 'package:flutter_application/views/AdminDashboard.dart';

import 'package:get/get.dart';
import 'package:flutter_application/views/review.dart';
import 'package:flutter_application/views/picDate.dart';
import 'package:flutter_application/views/HallServicePage.dart';
import 'package:flutter_application/views/wait.dart';
import 'package:flutter_application/views/try.dart';
import 'package:flutter_application/views/guestlist.dart';
import 'package:flutter_application/views/chatt.dart';
import 'package:flutter_application/views/newser.dart';
import 'package:flutter_application/views/flower.dart';
import 'package:flutter_application/views/food.dart';
import 'package:flutter_application/views/login1.dart';

import 'package:flutter_application/views/book.dart';
import 'package:flutter_application/views/priceList.dart';
import 'package:flutter_application/views/imagePlace.dart';
import 'package:flutter_application/views/addOffer.dart';
import 'package:flutter_application/views/newser2.dart';
import 'package:flutter_application/views/offerProvider.dart';
import 'package:flutter_application/views/PackProvider.dart';
import 'package:flutter_application/views/requist.dart';
import 'package:flutter_application/views/NameProvider.dart';
import 'package:flutter_application/views/EventProvider.dart';
import 'package:flutter_application/views/gradProvider.dart';

import 'package:flutter_application/views/ReqProvider.dart';
import 'package:flutter_application/views/profile.dart';
import 'package:flutter_application/views/PlanProvider.dart';
import 'package:flutter_application/views/rev2.dart';
import 'package:flutter_application/views/NewProvider.dart';
import 'package:flutter_application/views/watingList.dart';
import 'package:flutter_application/views/exc.dart';
import 'package:flutter_application/views/loc.dart';
import 'package:flutter_application/views/profile2.dart';
import 'package:flutter_application/views/image.dart';
import 'package:flutter_application/views/userbook.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/views/chat2.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application/views/budget.dart';
import 'package:flutter_application/views/beforser.dart';
import 'dart:typed_data'; 
import 'dart:ui' as ui; 
import 'package:flutter/material.dart'; 
//import 'package:flutter_application_3/views/CameraScreen.dart'; 
 import 'package:camera/camera.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   final cameras = await availableCameras(); 
  final firstCamera = cameras.first; 

  await Firebase.initializeApp(); // Initialize Fireba
  // FirebaseFirestore.instance.enablePersistence();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDQ0P_Q8mVeV-xZz8h1Lo9AOTvdSMqafEw",
      appId: "1:217648702423:android:3893fe3c0e884836dee192",
      messagingSenderId: "217648702423",
      projectId: "monasaba-f5d96",
    ),
  );

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
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => SalesOffersProvider()),
        ChangeNotifierProvider(create: (context) => OfferProvider()),
        ChangeNotifierProvider(create: (context) => PackageProvider()),
        ChangeNotifierProvider(create: (context) => NameProvider()),
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(create: (context) => ReqProvider()),
        ChangeNotifierProvider(create: (context) => PlanProvider()),
        ChangeNotifierProvider(create: (context) => NewProvider()),
        ChangeNotifierProvider(create: (context) => WaitingListProvider()),
        ChangeNotifierProvider(create: (context) => ExecutionListProvider()),
        ChangeNotifierProvider(create: (context) => BudgetProvider()),
        ChangeNotifierProvider(create: (context) =>  GradProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // Localizations setup
        locale: const Locale('ar', 'SA'),
        textDirection: TextDirection.rtl,
        translations: Messages(),
        fallbackLocale: Locale('ar', 'SA'),

        home: Welcome (),
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
        },
      };
}
