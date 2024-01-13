import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application/views/homepage.dart';
import 'package:flutter_application/views/Responsive .dart';

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
    return Responsive(
      mobile: WelcomePageMobile(descriptions: descriptions, imageAssets: imageAssets),
      desktop: WelcomePageDesktop(descriptions: descriptions, imageAssets: imageAssets),
    );
  }
}

class WelcomePageMobile extends StatelessWidget {
  final List<String> descriptions;
  final List<String> imageAssets;

  WelcomePageMobile({required this.descriptions, required this.imageAssets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0), // Adjust top padding as needed
          child: Column(
            children: <Widget>[
              CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return WelcomeImage(
                    imageAsset: imageAssets[index],
                    description: descriptions[index],
                    width: 300.0,
                    height: 200.0,
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
                      horizontal: 200.0,
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

class WelcomePageDesktop extends StatelessWidget {
  final List<String> descriptions;
  final List<String> imageAssets;

  WelcomePageDesktop({required this.descriptions, required this.imageAssets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return WelcomeImage(
                  imageAsset: imageAssets[index],
                  description: descriptions[index],
                  width: 600.0,
                  height: 400.0,
                );
              },
              options: CarouselOptions(
                height: 600.0,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0), // Adjust top padding as needed
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
                    horizontal: 300.0,
                    vertical: 16.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'أنطلق',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color.fromARGB(255, 91, 165, 129),
                  ),
                ),
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
