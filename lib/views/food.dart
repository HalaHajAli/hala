import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Restaurant {
  final String name;
  final String contactInfo;
  final String facebookLink;
  final String instagramLink;
   final String imagePath;


  Restaurant({
    required this.name,
    required this.contactInfo,
    required this.facebookLink,
    required this.instagramLink,
      required this.imagePath // New property for image path

  });
}

class SweetsPlace {
  final String name;
  final String contactInfo;
  final String facebookLink;
  final String instagramLink;
   final String imagePath;

  SweetsPlace({
    required this.name,
    required this.contactInfo,
    required this.facebookLink,
    required this.instagramLink,
       required this.imagePath
  });
}

class FoodManagementPage extends StatelessWidget {
  
  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'مطعم w',
      contactInfo: 'الهاتف: 123-456-7890',
      facebookLink: 'https://www.facebook.com/wrestaurantpal?mibextid=ZbWKwL',
      instagramLink: 'https://instagram.com/wrestaurantpal?igshid=MXFibnI0ZHB3NWgxcg==',
            imagePath:'images/w2.png'

    ),
    Restaurant(
      name: 'إكليل الورد' ,
       contactInfo: 'الهاتف: 123-456-7890',
      facebookLink: 'https://www.facebook.com/ekleel.alward.ps1?mibextid=ZbWKwL',
      instagramLink: 'https://instagram.com/ekleel.alward.ps?igshid=ZXljMDdwYjlnNXZr',
             imagePath:'images/e.png'
    ),
    Restaurant(
      name:' ليمون ونعنع',
     contactInfo: 'الهاتف: 123-456-7890',
      facebookLink: 'https://www.facebook.com/ekleel.alward.ps1?mibextid=ZbWKwL',
      instagramLink: 'https://instagram.com/ekleel.alward.ps?igshid=ZXljMDdwYjlnNXZr',
             imagePath:'images/l.png'

    ),
       Restaurant(
      name: 'ورد',
     contactInfo: 'الهاتف: 123-456-7890',
      facebookLink: 'https://www.facebook.com/ekleel.alward.ps1?mibextid=ZbWKwL',
      instagramLink: 'https://instagram.com/ekleel.alward.ps?igshid=ZXljMDdwYjlnNXZr',
            imagePath:'images/wa.png'

    ),   Restaurant(
      name: 'ألف ليلة وليلة',
   contactInfo: 'الهاتف: 123-456-7890',
      facebookLink: 'https://www.facebook.com/ekleel.alward.ps1?mibextid=ZbWKwL',
      instagramLink: 'https://instagram.com/ekleel.alward.ps?igshid=ZXljMDdwYjlnNXZr',
            imagePath:'images/a.png'

    ),
    // Add more restaurants as needed
  ];

  final List<SweetsPlace> sweetsPlaces = [
    SweetsPlace(
      name: 'حلويات السرايا',
      contactInfo: 'الهاتف: 123-456-7890',
      facebookLink: 'https://www.facebook.com/alsaraya.sweets?mibextid=ZbWKwL',
      instagramLink: 'https://instagram.com/saraya_sweets?igshid=MW9iYnFvZHV6Mm03MA==',
     imagePath:'images/s.png'
    ),
    SweetsPlace(
      name: 'حلويات أبو سير',
   contactInfo: 'الهاتف: 123-456-7890',
      facebookLink: 'https://www.facebook.com/sardchocolate?mibextid=ZbWKwL',
      instagramLink: 'https://instagram.com/sardchocolate.ps?igshid=cGZkbmF0NzFncmQ1',
     imagePath:'images/abo.png'

    ),
    SweetsPlace(
      name: 'جاتوه لبنان',   contactInfo: 'الهاتف: 123-456-7890',
      facebookLink: 'https://www.facebook.com/sardchocolate?mibextid=ZbWKwL',
      instagramLink: 'https://instagram.com/sardchocolate.ps?igshid=cGZkbmF0NzFncmQ1',
     imagePath:'images/leb.png'

    ),
    // Add more sweets places as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة المطاعم',
         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.white),

        ),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'المطاعم',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF5BA581)),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return RestaurantCard(restaurant: restaurant);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'الحلويات',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF5BA581)),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: sweetsPlaces.length,
              itemBuilder: (context, index) {
                final sweetsPlace = sweetsPlaces[index];
                return SweetsPlaceCard(sweetsPlace: sweetsPlace);
              },
            ),
          ],
        ),
      ),
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
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    launch(restaurant.instagramLink);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/instagram.png',
                      height: 30,
                      width: 30,
                    ),
                  ),

                  
                ),

                   CircleAvatar(
        radius: 60, // Adjust the radius as needed
              backgroundImage: AssetImage(restaurant.imagePath),
      ),
      Container(
  alignment: Alignment.bottomLeft,
  child: Padding(
    padding: const EdgeInsets.all(16.0), // Adjust the padding values as needed
    child: ElevatedButton(
      onPressed: () {
        // Add your book functionality here
      },

      style: ElevatedButton.styleFrom(
        primary: Color(0xFF5BA581), // Change the button's background color
        onPrimary: Colors.white, // Change the button's text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Adjust the padding
      ),
      child: Text('احجز'
      ),
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
                      height: 30,
                      width: 30,
                         // Change icon color
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    launch(sweetsPlace.instagramLink);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/instagram.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                 SizedBox(width: 10),
      CircleAvatar(
        radius: 60, // Adjust the radius as needed
              backgroundImage: AssetImage( sweetsPlace.imagePath),
      ),
      
Container(
  alignment: Alignment.bottomRight,
  child: Padding(
    padding: const EdgeInsets.all(16.0), // Adjust the padding values as needed
    child: ElevatedButton(
      onPressed: () {
        // Add your book functionality here
      },

      style: ElevatedButton.styleFrom(
        primary: Color(0xFF5BA581), // Change the button's background color
        onPrimary: Colors.white, // Change the button's text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Adjust the padding
      ),
      child: Text('احجز'),
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
