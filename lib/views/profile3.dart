import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/views/NameProvider.dart';
import 'package:flutter_application/views/image.dart';
import 'package:flutter_application/views/servicepage.dart';

class ProfilePage3 extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage3> {
  String userName = '';
  String userEmail = '';
  String userPhone = '';
  String plannerSalary = '6000'; // Set a fixed salary
  List<Map<String, dynamic>> reviews = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      NameProvider nameProvider =
          Provider.of<NameProvider>(context, listen: false);
      await fetchUserData(nameProvider.getUsername);
      await fetchReviews(nameProvider.getUsername);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> fetchUserData(String plannername) async {
    try {
      var url =
          Uri.parse('http://192.168.1.6:4001/login2/profile/$plannername');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = jsonDecode(response.body);

        if (userData.containsKey('planner')) {
          Map<String, dynamic> userMap =
              Map<String, dynamic>.from(userData['planner']);
          setState(() {
            userName = userMap['username'].toString() ?? '';
            userEmail = userMap['email'].toString() ?? '';
            userPhone = userMap['mobile'].toString() ?? '';
          });
          print('Fetched User Data: $userName, $userEmail, $userPhone');
        } else {
          print('Error: Planner key not found in response');
        }
      } else {
        print('Error fetching user data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> fetchReviews(String plannername) async {
    try {
      var url = Uri.parse('http://192.168.1.6:4001/login2/reviews/');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        dynamic reviewsData = jsonDecode(response.body);

        if (reviewsData is List) {
          setState(() {
            reviews = List<Map<String, dynamic>>.from(reviewsData);
          });
        } else if (reviewsData is Map<String, dynamic>) {
          setState(() {
            reviews = [reviewsData];
          });
        } else {
          print('Error: Reviews data is not a List or Map');
        }
      } else {
        print('Error fetching reviews. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching reviews: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الصفحة الشخصية',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 91, 165, 129),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.asset(
                        'images/peaple2.png',
                        fit: BoxFit.cover,
                        width: 160,
                        height: 160,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: Text(
                  userName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 26),
              Container(
                height: 130,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 91, 165, 129),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "للتواصل",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "الإيميل: $userEmail",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "رقم الهاتف: $userPhone",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: plannerSalary,
                readOnly: true, // Make the salary field read-only
                decoration: InputDecoration(
                  labelText: 'سعر الشغل',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              if (reviews.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'آراء العملاء:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    for (var review in reviews)
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'shahd',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'التقييم:4',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'very good team ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تأكيد الحجز'),
          content: Text('هل أنت متأكد أنك تريد حجز الخدمة؟'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Navigate to the service page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServicePage( userType: "",usern: "",ema: ""     ),
                  ),
                );
              },
              child: Text('حجز'),
            ),
          ],
        );
      },
    );
  },
  style: ElevatedButton.styleFrom(
    primary: Color(0xFF5BA581),
    padding: EdgeInsets.all(8),
  ),
  child: Text(
    'حجز',
    style: TextStyle(
      color: Colors.white,
      fontFamily: 'Arabic',
      fontWeight: FontWeight.bold,
    ),
  ),
),

                  ElevatedButton(
                   onPressed: () {
                       Navigator.push(
                             context,
                           MaterialPageRoute(
                       builder: (context) => ImageCollagePage(),
                                 ),
                                        );  },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5BA581),
                      padding: EdgeInsets.all(8),
                    ),
                    child: Text(
                             'عرض الأعمال السابقة',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Arabic',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
