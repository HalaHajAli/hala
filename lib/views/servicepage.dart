import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application/views/Responsive .dart';

import 'dart:io';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_application/views/homepage.dart';
import 'package:flutter_application/views/login1.dart';
import 'package:flutter_application/views/signup.dart';
import 'package:flutter_application/views/flower.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/favorites_provider.dart';
import 'package:flutter_application/views/food.dart';
import 'package:flutter_application/views/CartProvider.dart';
import 'package:flutter_application/views/HallServicePage.dart';
import 'package:flutter_application/views/flowergra.dart';
import 'package:flutter_application/views/flowerbaby.dart';
import 'package:flutter_application/views/flowerbirth.dart';
import 'package:flutter_application/views/saleprovider.dart';
import 'package:flutter_application/views/serviceadmin.dart';
import 'package:flutter_application/views/guestlist.dart';
import 'package:flutter_application/views/baby.dart';
import 'package:flutter_application/views/birthday.dart';
import 'package:flutter_application/views/visitor.dart';
import 'package:flutter_application/views/grad.dart';
import 'package:flutter_application/views/wedding.dart';
import 'package:flutter_application/views/newser.dart';

class ServiceItem {
  final String name;
  final String description;
  final ImageProvider image;
  final Widget servicePageRoute;

  ServiceItem({
    required this.name,
    required this.description,
    required this.image,
    required this.servicePageRoute,
  });
}

class Item {
  late String expandedValue;
  late String headerValue;

  Item({String expandedValue = '', String headerValue = ''}) {
    this.expandedValue = expandedValue;
    this.headerValue = headerValue;
  }
}

class CustomServiceItem {
  final String name;
  final String description;
  final AssetImage image;
  final Widget servicePageRoute;

  CustomServiceItem({
    String name = 'Custom Service',
    String description = 'A custom service',
    AssetImage? image,
    Widget? servicePageRoute,
  })  : name = name,
        description = description,
        image = image ?? AssetImage('images/default_image.png'),
        servicePageRoute = servicePageRoute ?? Placeholder();
}

class CircularServiceButton extends StatelessWidget {
  final AssetImage image;
  final String name;

  CircularServiceButton({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Colors.green,
              width: 2,
            ),
          ),
          child: Center(
            child: Image(
              image: image,
              height: 60,
              width: 60,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ServicePage extends StatefulWidget {
  static const String screenRoute = 'Service_screen';

  final String userType;
  final String usern; // Keep the usern parameter
  final String ema;

  ServicePage({required this.userType, required this.usern, required this.ema});

  @override
  _ServicePageState createState() => _ServicePageState();
}





class SquareServiceButton extends StatelessWidget {
  final ImageProvider image; // Specify ImageProvider type
  final String name;
  final VoidCallback onTap;

  const SquareServiceButton({
    required this.image,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 120,
        padding: EdgeInsets.all(10),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: image, // No need to cast, it should work with any ImageProvider
              width: 60,
              height: 60,
            ),
            SizedBox(height: 5),
            Text(
              name,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
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

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.75);

    final firstControlPoint = Offset(size.width / 4, size.height);
    final firstEndPoint = Offset(size.width / 2.25, size.height * 0.85);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    final secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height * 0.6);
    final secondEndPoint = Offset(size.width, size.height * 0.75);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _ServicePageState extends State<ServicePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<ServiceItem> services = [
    ServiceItem(
      name: 'الأعراس',
      description: 'Have a nice wedding',
      image: AssetImage('images/rings.png'),
      servicePageRoute: WeddingServicePage(),
    ),
    ServiceItem(
      name: 'التخرج',
      description: 'Description for Service 2',
      image: AssetImage('images/graduation.png'),
      servicePageRoute: graduateServicePage(),
    ),
    ServiceItem(
      name: 'baby shower',
      description: 'Description for Service 3',
      image: AssetImage('images/baby-shower.png'),
      servicePageRoute: BabyServicePage(),
    ),
    ServiceItem(
      name: 'عيد الميلاد',
      description: 'Description for Service 3',
      image: AssetImage('images/happy-birthday.png'),
      servicePageRoute: birthdayServicePage(),
    ),
  ];

  File? imageFile;

  Future<void> _pickImage() async {
    // Your _pickImage method implementation
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        'أختر مناسبتك',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0xFF5BA581),
      leading: Responsive.isMobile(context)
          ? IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            )
          : null,
    ),
    endDrawer: Responsive.isDesktop(context)
        ? Drawer(
            child: Column(
              children: [
                // Drawer Header with User Profile
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'User Name',
                    style: TextStyle(color: Colors.white),
                  ),
                  accountEmail: Text(
                    'user@example.com',
                    style: TextStyle(color: Colors.white),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('path/to/profile_image.jpg'),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 91, 165, 129),
                  ),
                ),
                // Drawer Body
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text(
                          'تسجيل الخروج ',
                          style: TextStyle(color: Color.fromARGB(255, 91, 165, 129)),
                        ),
                        onTap: () {
                          // Implement logout logic here
                          // For example, navigate to the login page
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Login1()),
                          );
                        },
                      ),
                      // Add other drawer items as needed
                    ],
                  ),
                ),
              ],
            ),
          )
        : null,
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WaveBackground(), // Add the wavy background at the top
          SizedBox(height: 2),
          Text(
            '',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 2),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns
              crossAxisSpacing: 25.0, // Adjust the spacing between columns
              mainAxisSpacing: 25.0, // Adjust the spacing between rows
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              return SquareServiceButton(
                image: services[index].image,
                name: services[index].name,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => services[index].servicePageRoute,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    ),
    bottomNavigationBar: ConvexAppBar(
      style: TabStyle.reactCircle,
      backgroundColor: Color(0xFF5BA581),
      items: [
        TabItem(icon: Icons.home, title: 'الرئيسية'),
        TabItem(icon: Icons.person, title: 'صفحتك الشخصية'),
        TabItem(icon: Icons.favorite, title: 'الفضلة'),
        TabItem(icon: Icons.info, title: ' من نحن'),
        TabItem(icon: Icons.shopping_cart, title: 'حقيبتي'),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectionPage()));
            break;
          case 1:
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
            break;
          case 2:
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoritesPage()));
            break;
          case 3:
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUsPage()));
            break;
          case 4:
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyBagPage()));
            break;
          default:
            // Handle other cases if needed
            break;
        }
      },
    ),
  );
}
}
class UserProfilePage extends StatelessWidget {
  static const routeName = '/userProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Text('This is the User Profile Page'),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('المفضلة'),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: Column(
        children: [
          Center(
            child: Text(''),
          ),
          SizedBox(height: 20),
          Text(
            '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Wrap(
            children: favoritesProvider.favoriteImages
                .map(
                  (imagePath) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      imagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        actions: [
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () {
              // Add your contact us functionality here
              // For example, you can navigate to a contact page
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.green],
            stops: [
              0.5,
              1.0
            ], // Adjust the stops to control the gradient transition
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'أهلاً بك في مناسبة',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors
                      .black, // Adjust text color to be visible on the gradient background
                ),
              ),
              SizedBox(height: 20),
              Text(
                ' ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '  ',
                style: TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              Text(
                'مهمتنا',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'تصميم مناسبتك بأقل الأسعار وبمساعدة أفضل المصممين ',
                style: TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider =
        Provider.of<CartProvider>(context); // Access the CartProvider

    // Get the list of images from the cart
    List<String> cartImages = cartProvider.cartImages;

    return Scaffold(
      appBar: AppBar(
        title: Text('حقيبتي '),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: Column(
        children: [
          Text('', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    2, // You can adjust the number of columns as needed
              ),
              itemCount: cartImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // You can implement actions when clicking on an image
                  },
                  child: Image.asset(cartImages[index]),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
            },
            child: Text('إرسال طلب إلى المخطط'),
          ),
        ],
      ),
    );
  }
}




class MyApp extends StatelessWidget {
  static List<String> favoriteImages = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      initialRoute: '/',
      routes: {
        '/': (context) => ServicePage(
              userType: '',
              usern: "",
              ema: "",
            ),
        UserProfilePage.routeName: (context) => UserProfilePage(),
      },
      theme: ThemeData(
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
    );
  }
}
