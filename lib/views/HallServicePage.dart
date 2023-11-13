import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/CartProvider.dart';


class HallServicePage extends StatefulWidget {
  @override
  _HallServicePageState createState() => _HallServicePageState();
}

class _HallServicePageState extends State<HallServicePage> {
  bool hasOwnPlace = false;
  File? placeImage;

  Future<void> _pickPlaceImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        placeImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hall Service Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Hall Service Page!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 20),
            Text(
              'Do you have a place for the party?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      hasOwnPlace = true;
                      placeImage = null; // Clear previously selected image
                    });
                  },
                  style: ElevatedButton.styleFrom(primary: hasOwnPlace ? Colors.grey : Colors.green),
                  child: Text('Yes, I have a place', style: TextStyle(fontSize: 16)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      hasOwnPlace = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(primary: !hasOwnPlace ? Colors.grey : Colors.green),
                  child: Text('No, show me available places', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            if (hasOwnPlace)
              Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Upload a picture of your place:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: _pickPlaceImage,
                    child: placeImage == null
                        ? Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.camera_alt,
                                size: 60,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                placeImage!,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Select a place from the application:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // Implement a list of available places and their details here
                  // For example, you can use a ListView to display the available places.
                  // Each item in the list can represent a place that the user can select.
                  // Here, we show placeholder cards for available places.
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        PlaceItemCard(
                          placeName: 'Gardens Palace',
                          placeDescription: 'Beautiful garden setting for outdoor events.',
                          placeImage: 'images/ج.jpeg',
                        ),
                        PlaceItemCard(
                          placeName: 'Crystal Ballroom',
                          placeDescription: 'Elegant and spacious ballroom for large gatherings.',
                          placeImage: 'images/golden.jpeg',
                        ),
                        // Add more place items as needed
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class PlaceItemCard extends StatelessWidget {
  final String placeName;
  final String placeDescription;
  final String placeImage;

  PlaceItemCard({
    required this.placeName,
    required this.placeDescription,
    required this.placeImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            placeImage,
            height: 150,
            width: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  placeName,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  placeDescription,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                ElevatedButton(
  onPressed: () {
    // Call a function to add the place's image path to the cart
    CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addToCart(placeImage);
  },
  style: ElevatedButton.styleFrom(primary: Colors.green),
  child: Text('Add to Cart', style: TextStyle(fontSize: 16)),
)

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Place {
  final String name;
  final String description;
  final String image;

  Place({
    required this.name,
    required this.description,
    required this.image,
  });
}
