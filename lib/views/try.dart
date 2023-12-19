import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application/views/homepage.dart';

class WelcomePage extends StatelessWidget {
  final List<String> descriptions = [
    'أهلاً بك في مُناسبة',
    'صمم مناسبتك معنا',
    'لدينا تجد طلبك ',
  ];

  final List<String> imageAssets = [
    'images/welcome1.jpg',
    'images/welcome2.jpg',
    'images/welcome3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 91, 165, 129)],
            stops: [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return WelcomeImage(
                    imageAsset: imageAssets[index],
                    description: descriptions[index],
                  );
                },
                options: CarouselOptions(
                  height: 400.0,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SelectionPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Set button background color to green
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.2,
                      vertical: 16.0,
                    ),
                  ),
                  child: Text(
                    'أنطلق',
                    style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 91, 165, 129)), // Set text color to white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeImage extends StatelessWidget {
  final String imageAsset;
  final String description;

  WelcomeImage({
    required this.imageAsset,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomImage(
          imageAsset: imageAsset,
          width: 300.0,
          height: 200.0,
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

  CustomImage({
    required this.imageAsset,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image(
        image: AssetImage(imageAsset),
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
