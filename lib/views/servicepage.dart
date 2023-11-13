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
  final String userType;

  ServicePage({required this.userType});

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

class _ServicePageState extends State<ServicePage> {
  List<ServiceItem> services = [
    ServiceItem(
      name: 'Wedding',
      description: 'Have a nice wedding',
      image: AssetImage('images/rings.png'),
      servicePageRoute: WeddingServicePage(),
    ),
    ServiceItem(
      name: 'graduation',
      description: 'Description for Service 2',
      image: AssetImage('images/graduation.png'),
      servicePageRoute: graduateServicePage(),
    ),
    ServiceItem(
      name: 'baby shower',
      description: 'Description for Service 3',
      image: AssetImage('images/baby-shower.png'),
      servicePageRoute: babyServicePage(),
    ),
    ServiceItem(
      name: 'birth day',
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
        title: Text('Service Page - ${widget.userType}'),
        backgroundColor: Color(0xFF5BA581),
      ),
      drawer: Drawer(
        child: ListView(
          // Your existing drawer code...
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Select a Service:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: services.map((service) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => service.servicePageRoute,
                            ),
                          );
                        },
                        child: CircularServiceButton(
                          image: service.image,
                          name: service.name,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ),
            ),
            // Display OffersListView
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Latest Offers:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200.0,
              child: OffersListView(),
            ),
            // Display SalesListView
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Recent Sales:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200.0,
              child: SalesListView(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: Color(0xFF5BA581),
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
          TabItem(icon: Icons.favorite, title: 'Favorites'),
          TabItem(icon: Icons.info, title: 'About Us'),
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

class WeddingServicePage extends StatefulWidget {
  @override
  _WeddingServicePageState createState() => _WeddingServicePageState();
}
class _WeddingServicePageState extends State<WeddingServicePage> {
  String selectedService = '';

  List<String> serviceOptions = [
    'Flower Management',
    'Food Management',
    'القاعة',
    // Add more service options if needed
  ];

void navigateToFoodPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodManagementPage(),
      ),
    );
  }
  // Function to navigate to the FlowerManagementPage
  void navigateToFlowerPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FlowerColorPage(),
      ),
    );
  }
  void navigateToHallPage() {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => HallServicePage(),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('Wedding Service Page'),
  ),
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to the Wedding Service Page!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'Select Service Item:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: serviceOptions.map((item) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedService = item;
                });
                if (item == 'Flower Management') {
                  navigateToFlowerPage();
                } else if (item == 'Food Management') {
                  navigateToFoodPage();
                } else if (item == 'القاعة') {
                  navigateToHallPage(); // Navigate to Hall Management page
                }
              },
              style: ElevatedButton.styleFrom(
                primary: selectedService == item ? Colors.green : Colors.grey,
              ),
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    ),
  ),
);
 }
}

class graduateServicePage extends StatefulWidget {
  @override
  _graduateServicePageState createState() => _graduateServicePageState();
}
class _graduateServicePageState extends State<graduateServicePage > {
  String selectedService = '';

  List<String> serviceOptions = [
    'Flower Management',
    'Food Management',
    'القاعة',
    // Add more service options if needed
  ];

void navigateToFoodPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodManagementPage(),
      ),
    );
  }
  // Function to navigate to the FlowerManagementPage
  void navigateToFlowerPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FlowerColorPage1(),
      ),
    );
  }
  void navigateToHallPage() {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => HallServicePage(),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('Wedding Service Page'),
  ),
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to the Wedding Service Page!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'Select Service Item:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: serviceOptions.map((item) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedService = item;
                });
                if (item == 'Flower Management') {
                  navigateToFlowerPage();
                } else if (item == 'Food Management') {
                  navigateToFoodPage();
                } else if (item == 'القاعة') {
                  navigateToHallPage(); // Navigate to Hall Management page
                }
              },
              style: ElevatedButton.styleFrom(
                primary: selectedService == item ? Colors.green : Colors.grey,
              ),
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    ),
  ),
);
 }
}

class babyServicePage extends StatefulWidget {
  @override
  _babyServicePageState createState() => _babyServicePageState();
}
class _babyServicePageState extends State<babyServicePage > {
  String selectedService = '';

  List<String> serviceOptions = [
    'Flower Management',
    'Food Management',
    'القاعة',
    // Add more service options if needed
  ];

void navigateToFoodPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodManagementPage(),
      ),
    );
  }
  // Function to navigate to the FlowerManagementPage
  void navigateToFlowerPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FlowerColorPage2(),
      ),
    );
  }
  void navigateToHallPage() {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => HallServicePage(),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('baby shower Service Page'),
  ),
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to the baby shower Service Page!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'Select Service Item:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: serviceOptions.map((item) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedService = item;
                });
                if (item == 'Flower Management') {
                  navigateToFlowerPage();
                } else if (item == 'Food Management') {
                  navigateToFoodPage();
                } else if (item == 'القاعة') {
                  navigateToHallPage(); // Navigate to Hall Management page
                }
              },
              style: ElevatedButton.styleFrom(
                primary: selectedService == item ? Colors.green : Colors.grey,
              ),
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    ),
  ),
);
 }
}

class birthdayServicePage extends StatefulWidget {
  @override
  _birtdayServicePageState createState() => _birtdayServicePageState();
}
class _birtdayServicePageState extends State<birthdayServicePage > {
  String selectedService = '';

  List<String> serviceOptions = [
    'Flower Management',
    'Food Management',
    'القاعة',
    // Add more service options if needed
  ];

void navigateToFoodPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodManagementPage(),
      ),
    );
  }
  // Function to navigate to the FlowerManagementPage
  void navigateToFlowerPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FlowerColorPage3(),
      ),
    );
  }
  void navigateToHallPage() {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => HallServicePage(),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('birth day Service Page'),
  ),
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to the birth day Service Page!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'Select Service Item:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: serviceOptions.map((item) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedService = item;
                });
                if (item == 'Flower Management') {
                  navigateToFlowerPage();
                } else if (item == 'Food Management') {
                  navigateToFoodPage();
                } else if (item == 'القاعة') {
                  navigateToHallPage(); // Navigate to Hall Management page
                }
              },
              style: ElevatedButton.styleFrom(
                primary: selectedService == item ? Colors.green : Colors.grey,
              ),
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    ),
  ),
);
 }
}

class DecorationItem extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;

  DecorationItem({
    String name = '',
    String description = '',
    String imagePath = 'default_image.png',
  })  : name = name,
        description = description,
        imagePath = imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
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
        title: Text('Favorites'),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Welcome to the Favorites Page!'),
          ),
          SizedBox(height: 20),
          Text(
            'Favorite Images:',
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
      ),
      body: Center(
        child: Text('Welcome to the About Us Page!'),
      ),
    );
  }
}

class MyBagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context); // Access the CartProvider

    // Get the list of images from the cart
    List<String> cartImages = cartProvider.cartImages;

    return Scaffold(
      appBar: AppBar(
        title: Text('حقيبتي (My Bag)'),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: Column(
        children: [
          Text('Items in My Bag:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // You can adjust the number of columns as needed
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
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _userImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _userImage = File(pickedImage.path);
      });
    }
  }

  void navigateToLoginPage() {
    // Navigate to the login page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Login1(),
      ),
    );
  }

  void navigateToSignUpPage() {
    // Navigate to the signup page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5BA581),
        title: Text('ملفي الشخصي'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _pickImage, // Call the image picker function
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: _userImage != null
                    ? FileImage(_userImage!)
                    : AssetImage('images/blank-profile-circle.png') as ImageProvider,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'الملف الشخصي, عزيزي الزائر!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight, // Align buttons to the maximum right
              child: Column(
                children: [
                  GestureDetector(
                    onTap: navigateToLoginPage, // Navigate to login page
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF5BA581), // Green color
                      ),
                    ),
                  ),
                  Divider( // Add a divider line
                    thickness: 1,
                    color: Color(0xFF5BA581), // Green color
                  ),
                  GestureDetector(
                    onTap: navigateToSignUpPage, // Navigate to signup page
                    child: Text(
                      'إنشاء حساب جديد',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF5BA581), // Green color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
      initialRoute: '/',
      routes: {
        '/': (context) => ServicePage(userType: 'Your User Type'),
        UserProfilePage.routeName: (context) => UserProfilePage(),
      },
    );
  }
}