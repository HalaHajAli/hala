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


void main()  async {
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
        ChangeNotifierProvider(create: (context) =>PackageProvider()), 

        // You can add more providers if needed
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // Localizations setup
        locale: const Locale('ar', 'SA'), 
        textDirection: TextDirection.rtl, 
        translations: Messages(), 
        fallbackLocale: Locale('ar', 'SA'),

        home:Welcome(), 
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