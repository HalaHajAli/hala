import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
import 'package:flutter_application/views/newser2.dart';

class ServiceItem {
  final String name;
  final String description;
  final AssetImage image;
  final Widget servicePageRoute;

  ServiceItem({
    String name = '',
   
    String description = '',
    AssetImage? image,
    Widget? servicePageRoute,
  })  : name = name,
        description = description,
        image = image ?? AssetImage('default_image.png'),
        servicePageRoute = servicePageRoute ?? Placeholder();
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



class OfferItem {
  final String title;
  final String description;
  final String imagePath;

  OfferItem({
    String title = '',
    String description = '',
    String imagePath = '',
  })  : title = title,
        description = description,
        imagePath = imagePath;
}

class SaleItem {
  final String productName;
  final double salePrice;
  final double originalPrice;
  final String imagePath;

  SaleItem({
    required this.productName,
    required this.salePrice,
    required this.originalPrice,
    required this.imagePath,
  });
}

class SquareServiceButton extends StatelessWidget {
  static const String screenRoute = 'Service_screen';

  final AssetImage image;
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
        width: 50,
        height: 100,
        padding: EdgeInsets.all(10), // Add padding to the outer square

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
              image: image,
              width: 80,
              height: 80,
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

class WaveBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: VerticalWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFF5BA581)],
            stops: [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
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
  List<ServiceItem> services = [
    ServiceItem(
      name: 'الأعراس',
      description: 'Have a nice wedding',
      image: AssetImage('images/rings.png'),
      servicePageRoute: newser2( ),

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
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the icons in the app bar
        ),
        centerTitle: true,
        title: Text(
          'أختر مناسبتك - ${widget.usern}', // Display username in the app bar title
          style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center, // Add this line

        ),
        backgroundColor: Color(0xFF5BA581),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            // Drawer Header with User Profile
            UserAccountsDrawerHeader(
              accountName: Text(
                widget.usern,
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                "${widget.usern}@gmail.com",
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('hala/images/person2.png'),
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
                    leading: Icon(Icons.message), // Icon for الرسائل
                    title: Text(
                      'الرسائل',
                      style:
                          TextStyle(color: Color.fromARGB(255, 91, 165, 129)),
                    ),
                    onTap: () {
                      // Handle messages action
                      // For example, navigate to messages page
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout), // Icon for تسجيل الخروج
                    title: Text(
                      'تسجيل الخروج ',
                      style:
                          TextStyle(color: Color.fromARGB(255, 91, 165, 129)),
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
      ),
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


          Directionality(
  textDirection: TextDirection.rtl,  
           child:GridView.builder(
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
          )
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SelectionPage()));
              break;
            case 1:
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ProfilePage()));
              break;
            case 2:
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FavoritesPage()));
              break;
            case 3:
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutUsPage()));
              break;
            case 4:
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyBagPage()));
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
              // Send a request to the planner with all items in the cart
              // You can implement this functionality here
            },
            child: Text('إرسال طلب إلى المخطط'),
          ),
        ],
      ),
    );
  }
}

class OffersListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your list of offer items
    List<OfferItem> offers = [
      OfferItem(
        title: '50% Off',
        description: 'Get a discount on all our services.',
        imagePath: 'images/s1.jpeg',
      ),
      OfferItem(
        title: 'Summer Sale',
        description: 'Enjoy our summer sale with great discounts.',
        imagePath: 'images/s.jpeg',
      ),
      // Add more offers as needed
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: offers.length,
      itemBuilder: (context, index) {
        OfferItem offer = offers[index];
        return OfferCard(offer: offer);
      },
    );
  }
}

class SalesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your list of sale items
    List<SaleItem> sales = [
      SaleItem(
        productName: 'الأعراس',
        salePrice: 299.99,
        originalPrice: 399.99,
        imagePath: 'images/ت.jpeg',
      ),
      SaleItem(
        productName: 'فلات التخرج',
        salePrice: 199.99,
        originalPrice: 399.99,
        imagePath: 'images/w.jpeg',
      ),
      // Add more sale items as needed
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sales.length,
      itemBuilder: (context, index) {
        SaleItem sale = sales[index];
        return SaleCard(sale: sale);
      },
    );
  }
}

// Rename SalesListView to getSales
List<SaleItem> getSales() {
  // Replace with your actual sales data or logic
  return [
    SaleItem(
      productName: 'wedding',
      salePrice: 299.99,
      originalPrice: 399.99,
      imagePath: 'images/ت.jpeg',
    ),
    SaleItem(
      productName: 'graduation party',
      salePrice: 199.99,
      originalPrice: 399.99,
      imagePath: 'images/w.jpeg',
    ),
    // Add more sale items as needed
  ];
}

class OfferCard extends StatelessWidget {
  final OfferItem offer;

  OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Image.asset(
            offer.imagePath,
            height: 120.0,
            width: 200.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  offer.description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SaleCard extends StatelessWidget {
  final SaleItem sale;

  SaleCard({required this.sale});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Image.asset(
            sale.imagePath,
            height: 120.0,
            width: 200.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sale.productName,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Sale Price: \$${sale.salePrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Original Price: \$${sale.originalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
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
    home: Directionality(
      textDirection: TextDirection.rtl,
      child: ServicePage(
        userType: '',
        usern: "",
        ema: "",
      ),
    ),
    routes: {
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
