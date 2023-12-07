import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:arkit_plugin/arkit_plugin.dart';
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
        title: Text('القاعة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF5BA581)),
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
                  style: ElevatedButton.styleFrom(primary: hasOwnPlace ? Colors.grey : Color(0xFF5BA581)),
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
                    'حمل صورة المكان الخاص بك ',
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
                              child: kIsWeb
                                  ? Container(
                                      height: 200,
                                      width: 200,
                                      color: Colors.grey[300],
                                      child: Center(
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 60,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  : Image.file(
                                      placeImage!,
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to AR view when the user uploads their own picture
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ARViewWidget(placeImage: placeImage!),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Color(0xFF5BA581)),
                    child: Text('Open AR View', style: TextStyle(fontSize: 16)),
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

class ARViewWidget extends StatefulWidget {
  final File placeImage;

  ARViewWidget({required this.placeImage});

  @override
  _ARViewWidgetState createState() => _ARViewWidgetState();
}

class _ARViewWidgetState extends State<ARViewWidget> {
  late ARKitController arkitController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR View'),
      ),
      body: kIsWeb
          ? Container(
              child: Text('AR View is not supported on Flutter Web.'),
            )
          : ARKitSceneView(
              onARKitViewCreated: onARKitViewCreated,
              enableTapRecognizer: true,
            ),
    );
  }

  void onARKitViewCreated(ARKitController controller) {
    arkitController = controller;
    // Initialize AR view and load 3D models here
    // Use widget.placeImage to access the selected image
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
          // Load image based on the platform
          kIsWeb
              ? Container(
                  height: 150,
                  width: 200,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(
                      Icons.camera_alt,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                )
              : Image.asset(
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
                  style: ElevatedButton.styleFrom(primary: Color(0xFF5BA581)),
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