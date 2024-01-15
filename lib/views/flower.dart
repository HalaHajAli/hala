import 'package:flutter/material.dart';
import 'package:flutter_application/views/favorites_provider.dart';
import 'package:flutter_application/views/servicepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/CartProvider.dart';
import 'package:flutter_application/views/servicepage.dart';
import 'package:flutter_application/views/priceList.dart';
import 'package:flutter_application/views/offerProvider.dart';

class FlowerColorPage extends StatefulWidget {
  @override
  _FlowerColorPageState createState() => _FlowerColorPageState();
}

String? selectedColor;

// String? selectedColorr; // Declare selectedColor at the class level

class _FlowerColorPageState extends State<FlowerColorPage> {
  bool isAdmin = true; // Set to true for demonstration purposes
  String? selectedType;

  List<String> flowerColors = ['white', 'pink', 'green', 'red', 'other'];
  List<String> flowerTypes = ['Normal', 'Artificial'];
  List<String> flowerImages = [
    'images/normal_pink.jpeg',
    'images/normal_pink.jpeg',
    'images/1_white.jpeg',
    'images/2_white.jpeg',
    'images/3_white.jpeg',
    'images/4_white.jpeg',
    'images/1_pink.jpeg',
    'images/2_pink.jpeg',
    'images/3_pink.jpeg',
    'images/4_pink.jpeg',
    'images/5_pink.jpeg',
    'images/6_pink.jpeg',
    'images/1_red.jpeg',
    'images/2_red.jpeg',
    'images/3_red.jpeg',
    'images/4_red.jpeg',
    'images/5_red.jpeg',
    'images/6_red.jpeg',
    'images/1_green.jpeg',
    'images/2_green.jpeg',
    'images/3_green.jpeg',
    'images/4_green.jpeg',
    'images/5_green.jpeg',
    'images/1_other.jpeg',
    'images/2_other.jpeg',
    'images/3_other.jpeg',
    'images/4_other.jpeg',
    'images/5_other.jpeg',
    'images/6_other.jpeg',
    'images/7_other.jpeg',
    'images/8_other.jpeg',
    'images/9_other.jpeg',
    'images/10_other.jpeg',
  ];

  List<String> getFilteredFlowerImages(String? color, String? type) {
    if (color == null && type == null) {
      return [];
    } else if (color == 'آخر') {
      return flowerImages
          .where((imagePath) => imagePath.toLowerCase().contains('other'))
          .toList();
    } else {
      var normalizedColor = color != null ? normalizeArabic(color) : null;
      return flowerImages
          .where((imagePath) =>
              (color == null ||
                  imagePath.toLowerCase().contains(normalizedColor!)) &&
              (type == null ||
                  imagePath.toLowerCase().contains(type.toLowerCase())))
          .toList();
    }
  }

  String normalizeArabic(String input) {
    final pattern = RegExp('[ء-ي]');
    return input.replaceAllMapped(
        pattern, (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0)));
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
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
              });

// Use the OfferProvider to add the selected color to the offers
                final offerProvider = Provider.of<OfferProvider>(context, listen: false);
               offerProvider.addToCart(selectedColor ?? "");
              //  Future.delayed(Duration(seconds: 10), () {
              //          Navigator.pop(context);
              //        });
         
              //print(selectedColor);
            },
            items: flowerColors.map((color) {
              return DropdownMenuItem<String>(
                value: color,
                child: Text(color),
              );
            }).toList(),
          ),
          Center(
            child: Text(
              'اختر نوع الزهور:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          DropdownButton<String>(
            value: selectedType,
            onChanged: (newType) {
              setState(() {
                selectedType = newType;
              });
            },
            items: flowerTypes.map((type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
          ),
          Wrap(
            children: (selectedColor == null && selectedType == null)
                ? [] // Display an empty list when no filter is selected
                : getFilteredFlowerImages(selectedColor, selectedType)
                    .map((imagePath) {
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
          SizedBox(height: 20), // Add some spacing
        ],
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add the image to favorites
                        final favoritesProvider =
                            Provider.of<FavoritesProvider>(context,
                                listen: false);
                        favoritesProvider.addToFavorites(imagePath);
                        Navigator.pop(context);
                      },
                      child: Text('إضافة إلى المفضلة'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add the image to the cart
                        final cartProvider =
                            Provider.of<CartProvider>(context, listen: false);
                        cartProvider.addToCart(imagePath);
                        Navigator.pop(context);
                      },
                      child: Text('إضافة إلى الحقيبة'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                    onPressed: () {
                        // Show message dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
title: Text(
  'اختيار اللون',
  style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20, // Set your desired font size
  ),
),
                            content: Text(
  'لقد تم اختيار اللون بنجاح',
  style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16, // Set your desired font size
  ),
),

                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close dialog
                                   // Navigator.pop(context); // Go to previous page
                                  },
                                  child: Text('موافق'),
                                ),
                              ],
                            );
                          },
                        );
                       Navigator.pop(context); // Close dialog

                      },
                        child: Text('اختر اللون')
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
