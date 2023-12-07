import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Restaurant {
  final String name;
  final String contactInfo;
  final String facebookLink;
  final String instagramLink;

  Restaurant({
    required this.name,
    required this.contactInfo,
    required this.facebookLink,
    required this.instagramLink,
  });
}

class SweetsPlace {
  final String name;
  final String contactInfo;
  final String facebookLink;
  final String instagramLink;

  SweetsPlace({
    required this.name,
    required this.contactInfo,
    required this.facebookLink,
    required this.instagramLink,
  });
}

class FoodManagementPage extends StatelessWidget {
  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'W Restaurant',
      contactInfo: 'Phone: 123-456-7890',
      facebookLink: 'https://www.facebook.com/wrestaurantpal?mibextid=ZbWKwL',
      instagramLink: 'https://instagram.com/wrestaurantpal?igshid=MXFibnI0ZHB3NWgxcg==',
    ),
    Restaurant(
      name: 'Ekleel Alward',
      contactInfo: 'Phone: 987-654-3210',
      facebookLink: 'https://www.facebook.com/ekleel.alward.ps1?mibextid=ZbWKwL',
      instagramLink: 'https://instagram.com/ekleel.alward.ps?igshid=ZXljMDdwYjlnNXZr',
    ),
    // Add more restaurants as needed
  ];

  final List<SweetsPlace> sweetsPlaces = [
    SweetsPlace(
      name: 'حلويات السرايا',
      contactInfo: 'Phone: 111-222-3333',
      facebookLink: 'https://www.facebook.com/alsaraya.sweets?mibextid=ZbWKwL',
      instagramLink: 'https://instagram.com/saraya_sweets?igshid=MW9iYnFvZHV6Mm03MA==',
    ),
    SweetsPlace(
      name: 'Sard chocolate',
      contactInfo: 'Phone: 444-555-6666',
      facebookLink: 'https://www.facebook.com/sardchocolate?mibextid=ZbWKwL',
      instagramLink: 'https://instagram.com/sardchocolate.ps?igshid=cGZkbmF0NzFncmQ1',
    ),
    // Add more sweets places as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة الطعام'),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: Column(
        children: [
          Text(
            'المطاعم',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF5BA581)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return RestaurantCard(restaurant: restaurant);
              },
            ),
          ),
          Text(
            'الحلويات',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF5BA581)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sweetsPlaces.length,
              itemBuilder: (context, index) {
                final sweetsPlace = sweetsPlaces[index];
                return SweetsPlaceCard(sweetsPlace: sweetsPlace);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              restaurant.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(restaurant.contactInfo),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    launch(restaurant.facebookLink);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/facebook.png',
                      height: 30, // Adjust the height as needed
                      width: 30,  // Adjust the width as needed
                    ),
                  ),
                ),
                SizedBox(width: 10), // Add some spacing between the icons
                GestureDetector(
                  onTap: () {
                    launch(restaurant.instagramLink);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/instagram.png',
                      height: 30, // Adjust the height as needed
                      width: 30,  // Adjust the width as needed
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SweetsPlaceCard extends StatelessWidget {
  final SweetsPlace sweetsPlace;

  SweetsPlaceCard({required this.sweetsPlace});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              sweetsPlace.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(sweetsPlace.contactInfo),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    launch(sweetsPlace.facebookLink);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/facebook.png',
                      height: 30, // Adjust the height as needed
                      width: 30,  // Adjust the width as needed
                    ),
                  ),
                ),
                SizedBox(width: 10), // Add some spacing between the icons
                GestureDetector(
                  onTap: () {
                    launch(sweetsPlace.instagramLink);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/instagram.png',
                      height: 30, // Adjust the height as needed
                      width: 30,  // Adjust the width as needed
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
