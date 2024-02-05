import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/CartProvider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_application/views/ReqProvider.dart';

class DjServicesPage extends StatefulWidget {
  @override
  _DjServicesPageState createState() => _DjServicesPageState();
}

class _DjServicesPageState extends State<DjServicesPage> {
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
        backgroundColor: Color(0xFF5BA581),
        centerTitle: true,
        title: Text('خدمات الدي جي', style: TextStyle(color: Colors.white)),
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
            if (placeImage != null)
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
                        child: Text('إضافة للحقيية', style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                  ],
                ),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 240, // Adjust the height as needed
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        DjItemCard(
                          djName: 'DJ BASHAR',
                          djDescription: 'توفير خدمات الدي جي لجميع المناسبات',
                          djImage: 'images/bash.png',
                          instagramLink: '',
                        ),
                        DjItemCard(
                          djName: 'DJ SALEEM',
                          djDescription: 'تأمين الموسيقى المثالية لفعاليتك',
                          djImage: 'images/sal.jpeg',
                          instagramLink: '',
                        ),
                        // Add more DJ items as needed
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

class DjItemCard extends StatelessWidget {
  final String djName;
  final String djDescription;
  final String djImage;
  final String instagramLink;

  DjItemCard({
    required this.djName,
    required this.djDescription,
    required this.djImage,
    required this.instagramLink,
  });

  @override
  Widget build(BuildContext context) {
    final reqProvider = Provider.of<ReqProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(djName),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(djDescription),
                SizedBox(height: 8),
                Text('Instagram: $instagramLink'),
              ],
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        Provider.of<ReqProvider>(context, listen: false);
                        reqProvider.addReq(djName);
                        print('$djName');
                      },
                      style: ElevatedButton.styleFrom(primary: Color(0xFF5BA581)),
                      icon: Icon(Icons.radio_button_checked, size: 24, color: Colors.white),
                      label: Text('احجز', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);
                        cartProvider.addToCart(djImage);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(primary: Color(0xFF5BA581)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite, size: 24, color: Colors.white),
                          SizedBox(width: 8),
                          Text('المفضلة', style: TextStyle(fontSize: 16, color: Colors.white)),
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
                    djImage,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    djImage,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                djName,
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
