import 'package:flutter/material.dart';
import 'package:flutter_application/views/favorites_provider.dart';
import 'package:flutter_application/views/servicepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/CartProvider.dart';
import 'package:flutter_application/views/ReqProvider.dart';
import 'package:flutter_application/views/food.dart';
import 'package:flutter_application/views/gradProvider.dart';

class FlowerColorPage1 extends StatefulWidget {
  @override
  _FlowerColorPageState createState() => _FlowerColorPageState();
}

class _FlowerColorPageState extends State<FlowerColorPage1> {
  String? selectedColor;

  List<String> flowerColors = ['White', 'Gold', 'Black', 'Other'];
  List<String> flowerImages = [
    'images/1w_white.jpeg',
    'images/2w_white.jpeg',
    'images/3w_white.jpeg',
    'images/4w_white.jpeg',
    'images/5w_white.jpeg',
    'images/6w_white.jpeg',
    'images/7w_white.jpeg',
    'images/8w_white.jpeg',
    'images/1g_gold.jpeg',
    'images/2g_gold.jpeg',
    'images/3g_gold.jpeg',
    'images/4g_gold.jpeg',
    'images/5g_gold.jpeg',
    'images/1b_black.jpeg',
    'images/2b_black.jpeg',
    'images/3b_black.jpeg',
    'images/4b_black.jpeg',
    'images/5b_black.jpeg',
    'images/6b_black.jpeg',
    'images/1c_other.jpeg',
    'images/2c_other.jpeg',
    'images/3c_other.jpeg',
    'images/4c_other.jpeg',
    'images/5c_other.jpeg',
    'images/6c_other.jpeg',
    'images/7c_other.jpeg',
    'images/8c_other.jpeg',
  ];

  List<String> getFilteredFlowerImages(String? color) {
    if (color == null || color.isEmpty) {
      return [];
    } else if (color == 'Other') {
      return flowerImages
          .where((imagePath) => imagePath.toLowerCase().contains('other'))
          .toList();
    } else {
      return flowerImages
          .where((imagePath) =>
              imagePath.toLowerCase().contains(color.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final reqProvider = Provider.of<ReqProvider>(context, listen: false);
    final gradProvider = Provider.of<GradProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(''),
        ),
        backgroundColor: Color(0xFF5BA581),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyBagPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              'أختر لون الزهور:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          DropdownButton<String>(
            value: selectedColor,
            onChanged: (newColor) {
              setState(() {
                selectedColor = newColor;
            gradProvider.addToGradList('نوع المناسبة :حفل تخرج');

                gradProvider.addToGradList('اللون: $newColor');
                print(
                    newColor); // Add the text label when storing in GradProvider
              });
            },
            items: flowerColors.map((color) {
              return DropdownMenuItem<String>(
                value: color,
                child: Text(color),
              );
            }).toList(),
          ),
          Wrap(
            children: getFilteredFlowerImages(selectedColor).map((imagePath) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FullScreenImagePage(imagePath: imagePath),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 50, // Set the width to your desired size
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodManagementPage(),
                ),
              );
            },
            icon: Icon(Icons.arrow_forward,
                size: 20, color: Colors.white), // Adjust the size as needed
            label: Text('',
                style:
                    TextStyle(fontSize: 14)), // Adjust the font size as needed
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 91, 165, 129),
            ),
          ),
        ),
      ),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imagePath;

  FullScreenImagePage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Hero(
                tag: imagePath,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final favoritesProvider = Provider.of<FavoritesProvider>(
                          context,
                          listen: false);
                      favoritesProvider.addToFavorites(imagePath);
                      Navigator.pop(context);
                    },
                    child: Text('إضافة إلى المفضلة'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final cartProvider =
                          Provider.of<CartProvider>(context, listen: false);
                      cartProvider.addToCart(imagePath);
                      Navigator.pop(context);
                    },
                    child: Text('إضافة إلى الحقيبة'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
        backgroundColor: Color.fromARGB(255, 91, 165, 129),
      ),
      body: Center(
        child: Text('Content of the Next Page'),
      ),
    );
  }
}
