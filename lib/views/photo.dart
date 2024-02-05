import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/CartProvider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_application/views/ReqProvider.dart';

class PhotographyGardensPage extends StatefulWidget {
  @override
  _PhotographyGardensPageState createState() => _PhotographyGardensPageState();
}

class _PhotographyGardensPageState extends State<PhotographyGardensPage> {
  bool hasOwnPlace = false;
  File? placeImage;

  Future<void> _pickPlaceImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        placeImage = File(pickedFile.path);
        hasOwnPlace = true; // Set hasOwnPlace to true when an image is picked
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5BA581),
        centerTitle: true,
        title: Text('حدائق التصوير', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'هل لديك المكان الخاص بك ؟',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      hasOwnPlace = true;
                      placeImage = null;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: hasOwnPlace ? Color(0xFF5BA581) : Colors.grey,
                    onPrimary: Colors.white,
                  ),
                  child: Text('نعم, لدي مكاني الخاص ', style: TextStyle(fontSize: 16)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      hasOwnPlace = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: !hasOwnPlace ? Color(0xFF5BA581) : Colors.grey,
                    onPrimary: Colors.white,
                  ),
                  child: Text('لا , أرني ما المتاح لديك', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            if (hasOwnPlace)
              Center(
                child: Column(
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
                              child: kIsWeb
                                  ? Image.network(
                                      placeImage!.path,
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    )
                                  : ClipRRect(
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
                    if (placeImage != null)
                      ElevatedButton(
                        onPressed: () {
                          CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);
                          cartProvider.addToCart(placeImage!.path);
                        },
                        style: ElevatedButton.styleFrom(primary: Color(0xFF5BA581)),
                        child: Text(' إضافة للحقيية', style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                  ],
                ),
              )
            else
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'أختر من الأماكن المتاحة لدينا ',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          PlaceItemCard(
                            placeName: 'MasterOne studio',
                            placeDescription: 'من أفضل أماكن التصوير المتواجدة في المنطقة , ذات طابع راقي وجذاب ',
                            placeImage: 'images/master.png',
                            facebookLink: 'https://www.facebook.com/garden1',
                          ),
                          PlaceItemCard(
                            placeName: 'Saraya studio',
                            placeDescription: 'يتميز هذا المكان برقيه وألوانه المميزة التي تضفي جمالاً وحيوية لصور مناسبتك ',
                            placeImage: 'images/sar.png',
                            facebookLink: 'https://www.facebook.com/garden2',
                          ),
                          // Add more items as needed
                        ],
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

class PlaceItemCard extends StatelessWidget {
  final String placeName;
  final String placeDescription;
  final String placeImage;
  final String facebookLink;

  PlaceItemCard({
    required this.placeName,
    required this.placeDescription,
    required this.placeImage,
    required this.facebookLink,
  });

  @override
  Widget build(BuildContext context) {
    final reqProvider = Provider.of<ReqProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(placeName),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(placeDescription),
              ],
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        reqProvider.addReq(placeName);
                        print('$placeName');
                      },
                      style: ElevatedButton.styleFrom(primary: Color(0xFF5BA581)),
                      icon: Icon(Icons.radio_button_checked, size: 24, color: Colors.white,),
                      label: Text('احجز', style: TextStyle(fontSize: 16, color: Colors.white),),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);
                        cartProvider.addToCart(placeImage);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(primary: Color(0xFF5BA581)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_outline_outlined, size: 24, color: Colors.white),
                          SizedBox(width: 8),
                          Text(' المفضلة', style: TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            kIsWeb
                ? Image.network(
                    placeImage,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    placeImage,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                placeName,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
