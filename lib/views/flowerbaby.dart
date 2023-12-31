import 'package:flutter/material.dart';
import 'package:flutter_application/views/favorites_provider.dart';
import 'package:flutter_application/views/servicepage.dart'; 
import 'package:provider/provider.dart';
import 'package:flutter_application/views/CartProvider.dart';

class FlowerColorPage2 extends StatefulWidget {
  @override
  _FlowerColorPageState createState() => _FlowerColorPageState();
}

class _FlowerColorPageState extends State<FlowerColorPage2> {
  String? selectedColor;

  List<String> flowerColors = ['White', 'Pink', 'Green','Other'];
  List<String> flowerImages = [
    'images/11_white.jpg',
    'images/22_white.jpg',
    'images/33_white.jpg',
    'images/44_white.jpg',
    'images/1s_pink.jpg',
    'images/2s_pink.jpg',
    'images/3s_pink.jpg',
    'images/4s_pink.jpg',
    'images/1s_green.jpg',
    'images/2s_green.jpg',
    'images/3s_green.jpg',
    'images/4s_green.jpg',
    'images/11_other.jpg',
    'images/22_other.jpg',
    'images/33_other.jpg',
    'images/44_other.jpg',
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
          .where((imagePath) => imagePath.toLowerCase().contains(color.toLowerCase()))
          .toList();
    }
  }
   @override
  Widget build(BuildContext context) {
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
            },
            items: flowerColors.map((color) {
              return DropdownMenuItem<String>(
                value: color,
                child: Text(color),
              );
            }).toList(),
          ),
          Wrap(
            children: getFilteredFlowerImages(selectedColor)
                .map((imagePath) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImagePage(imagePath: imagePath),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add the image to favorites
                      final favoritesProvider =
                          Provider.of<FavoritesProvider>(context, listen: false);
                      favoritesProvider.addToFavorites(imagePath);
                      Navigator.pop(context);
                    },
                    child: Text('Add to Favorites'),
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
                    child: Text('Add to Cart'),
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
