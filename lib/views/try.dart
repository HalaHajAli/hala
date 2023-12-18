import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application/views/homepage.dart';
class WelcomePage extends StatelessWidget {
  // Dummy data for descriptions
  final List<String> descriptions = [
    'أهلاً بك في مُناسبة',
    'صمم مناسبتك معنا',
    'لدينا تجد طلبك ',
  ];

  // Dummy data for image assets
  final List<String> imageAssets = [
    'images/welcome1.jpg',
    'images/welcome2.jpg',
    'images/welcome3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white, Colors.green], // Colors to blend
            stops: [0.0, 0.5, 1.0], // Adjust stops as needed
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  WaveBackground(),
                  CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      return WelcomeImage(
                        imageAsset: imageAssets[index],
                        description: descriptions[index],
                      );
                    },
                    options: CarouselOptions(
                      height: 600.0, // Adjust the height as needed
                      enlargeCenterPage: false,
                      enableInfiniteScroll: false,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SelectionPage(),
                  ),
                );
                },
                child: Text('أنطلق'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeImage extends StatelessWidget {
  final String imageAsset;
  final String description;

  WelcomeImage({required this.imageAsset, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomImage(
          imageAsset: imageAsset,
          width: double.infinity,
          height: 300.0, // Adjust the height as needed
        ),
        SizedBox(height: 16),
        Text(
          description,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class CustomImage extends StatelessWidget {
  final String imageAsset;
  final double width;
  final double height;

  CustomImage({required this.imageAsset, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0), // Adjust the corner radius as needed
      child: Image(
        image: AssetImage(imageAsset),
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}

class WaveBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        color: Colors.transparent, // No need for a background color here
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.15,
      size.width * 0.5,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.35,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
