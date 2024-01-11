import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application/views/Welcome.dart';
import 'package:flutter_application/views/login1.dart';
import 'package:flutter_application/views/food.dart';
import 'package:flutter_application/views/book.dart';
import 'package:flutter_application/views/servicepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class newser2 extends StatefulWidget {
  @override
  _NewserState createState() => _NewserState();
}

class _NewserState extends State<newser2> {
  late DateTime selectedDate;
  bool isButtonClicked = false;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String calculateRemainingTime() {
    DateTime currentDate = DateTime.now();
    Duration difference = selectedDate.difference(currentDate);

    int months = difference.inDays ~/ 30;
    int weeks = (difference.inDays % 30) ~/ 7;
    int days = difference.inDays % 7;

    return '${months.toString().padLeft(2, '0')}, ${weeks.toString().padLeft(2, '0')}, ${days.toString().padLeft(2, '0')}';
  }

  String getRemainingWords() {
    return "شهر , أسبوع , يوم";
  }

  List<Map<String, dynamic>> packages = []; // Array to store the response data

  Future<void> fetchData() async {
    try {
      setState(() {
        // Disable the button on click
        isButtonClicked = true;
      });

      final response = await http
          .get(Uri.parse('http://192.168.1.4:4001/login1/offer/shahd'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData is Map<String, dynamic>) {
          setState(() {
            packages.clear(); // Clear the list before adding new data

            packages.add(jsonData);
          });

          String packageName = packages.isNotEmpty
              ? packages[0]['packages'][0]['name'] ?? 'Name not found'
              : 'No packages available';

          print('Package Name: $packageName');

          String imageUrl = packages.isNotEmpty &&
                  packages[0]['packages'].isNotEmpty &&
                  packages[0]['packages'][0]['imagePage']['images'].isNotEmpty
              ? packages[0]['packages'][0]['imagePage']['images'][0]
              : 'No image found';

          // print('Image URL: $imageUrl');

          // print('************************************************************');

          // print('Package fetched successfully: $jsonData');

          // print('************************************************************');
          // print('Packages list: $packages'); // Add this line to print packages list
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load packages');
      }
    } catch (error) {
      print('Error fetching package: $error');
      // Handle error scenario
    } finally {
      setState(() {
        // Enable the button
        isButtonClicked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5BA581),
          title: Text(
            'الأعراس',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ServicePage(
                    userType: 'Your User Type',
                    usern: "_username,",
                    ema: "_email",
                  ),
                ),
              );
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Transform.translate(
                  offset: Offset(0, -0),
                  child: Container(
                    width: 200,
                    height: 240,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF5BA581),
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 15),
                          Text(
                            DateFormat('dd-MM-yyyy').format(selectedDate),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    calculateRemainingTime().split(',')[0],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    getRemainingWords().split(',')[0],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    calculateRemainingTime().split(',')[1],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    getRemainingWords().split(',')[1],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    calculateRemainingTime().split(',')[2],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    getRemainingWords().split(',')[2],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 7),
                          IconButton(
                            icon: Icon(Icons.calendar_month),
                            onPressed: () => _selectDate(context),
                            iconSize: 30,
                            color: Color(0xFF5BA581),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'اختر التاريخ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFF5BA581),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 1),
              // ElevatedButton(
              //   onPressed: () {
              //     fetchData();
              //   },
              //   child: Text(
              //     'Your Button Text',
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white,
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     primary: Color(0xFF5BA581),
              //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //   ),
              // ),
              //
              SizedBox(height: 0), // Adjust the height as needed
              if (!isButtonClicked)
                GestureDetector(
                  onTap: fetchData,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    // decoration: BoxDecoration(
                    //   color: Color(0xFF5BA581),
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                    child: Text(
                      ' اكتشف العروض والخدمات->',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

              //     SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Transform.translate(
                  offset: Offset(0, -70),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(packages.length, (index) {
                        final packageData = packages[index]['packages'][0];
                        //  String packageName = packageData['name'] ?? 'No Name';
                        String packageDescription = packageData['detailsPage']
                                ['details'] ??
                            'No Description';
                        int packagePrice =
                            int.tryParse(packageData['price'] ?? '0') ?? 0;

                        String imageUrl =
                            packageData['imagePage']['images'].isNotEmpty
                                ? packageData['imagePage']['images'][0]
                                : 'No Image URL';

                        return PackageCard(
                          image: imageUrl,
                          title: "",
                          description: packageDescription,
                          price: packagePrice.toString(),
                          id: index + 1,
                        );
                      }),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Transform.translate(
                  offset: Offset(0, -10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        PackageCard(
                            image: 'images/food.jpg',
                            title: 'الخدمات المتوفرة',
                            description: 'بوفيه مفتوح ',
                            price: '\$1999',
                            id: 4),
                        PackageCard(
                            image: 'images/hals.png',
                            title: '',
                            description: 'حجز قاعات',
                            price: '\$999',
                            id: 5),
                        PackageCard(
                            image: 'images/tazyeen.png',
                            title: '',
                            description: 'التزيين',
                            price: '\$1499',
                            id: 6),
                        PackageCard(
                            image: 'images/cam.jpg',
                            title: '',
                            description: 'جلسات تصوير ',
                            price: '\$1999',
                            id: 7),
                        PackageCard(
                            image: 'images/dj.jpg',
                            title: '',
                            description: 'دي جي ',
                            price: '\$1999',
                            id: 7),
                      ],
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

class PackageCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final int id;

  PackageCard({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    this.id = 0,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = image.isNotEmpty ? image : 'images/nadi2.png';
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              title ?? 'No Title',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            elevation: 4,
            child: Container(
              width: 240,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  imageUrl.isNotEmpty
                      ? Image.asset(
                          imageUrl,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : Placeholder(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          description ?? 'No Description',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              price ?? 'No Price',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Perform action when tapped
                                // Navigate to package details, for instance
                              },
                              child: Icon(
                                Icons.arrow_forward,
                                size: 20,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}