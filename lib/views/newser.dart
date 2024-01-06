import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application/views/Welcome.dart';
import 'package:flutter_application/views/login1.dart';
import 'package:flutter_application/views/food.dart';
import 'package:flutter_application/views/book.dart';
import 'package:flutter_application/views/servicepage.dart';

class newser extends StatefulWidget {
  @override
  //final String username; // Add a parameter to accept the username

  //const newser({Key? key, required this.username}) : super(key: key);

  _NewserState createState() => _NewserState();
}

class _NewserState extends State<newser> {
  
  late DateTime selectedDate;

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
                  offset: Offset(0, -20),
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
              SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Transform.translate(
                  offset: Offset(0, -50),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        PackageCard(
                            image: 'images/garden1.png',
                            title: 'عروض الأعراس',
                            description: 'Package 1 Description',
                            price: '\$999',
                            id: 1),
                        PackageCard(
                            image: 'images/nadi2.png',
                            title: '',
                            description: 'Package 2 Description',
                            price: '\$1499',
                            id: 2),
                        PackageCard(
                            image: 'images/roz.png',
                            title: '',
                            description: 'Package 3 Description',
                            price: '\$1999',
                            id: 3),

                      ],
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

  const PackageCard({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              title,
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
                  Image.asset(
                    image,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          description,
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
                              price,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _navigateToPackageDetails(context);
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

  void _navigateToPackageDetails(BuildContext context) {
    switch (id) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WeddingView(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login1(),
          ),
        );
        break;

      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login1(),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodManagementPage(),
          ),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login1(),
          ),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login1(),
          ),
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login1(),
          ),
        );
        break;

      default:
        // Handle default case or do nothing
        break;
    }
  }
}