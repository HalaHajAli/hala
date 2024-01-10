import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application/views/homepage.dart';

class WelcomePage extends StatelessWidget {
  static const String screenRoute = 'welcome_screen';

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
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color.fromARGB(255, 91, 165, 129)],
              stops: [0.0, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: <Widget>[
              CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return WelcomeImage(
                    imageAsset: imageAssets[index],
                    description: descriptions[index],
                    width: 300.0, // Adjust width as needed
                    height: 200.0, // Adjust height as needed
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
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.2,
                      vertical: 16.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'أنطلق',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 91, 165, 129),
                    ),
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
  final double width;
  final double height;

  WelcomeImage({
    required this.imageAsset,
    required this.description,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomImage(
            imageAsset: imageAsset,
            width: width,
            height: height,
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 91, 165, 129),
            ),
          )
        ],
      ),
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
