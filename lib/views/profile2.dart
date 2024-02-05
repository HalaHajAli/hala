import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/views/NewProvider.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage2 extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage2> {
  String userName = '';
  String userEmail = '';
  String userPhone = '';
  String plannerSalary = '';
  List<Map<String, dynamic>> reviews = [];
  ImagePicker _picker = ImagePicker();
  PickedFile? _pickedFile;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      NewProvider nameProvider = Provider.of<NewProvider>(context, listen: false);
      await fetchUserData(nameProvider.getUsername);
      await fetchReviews(nameProvider.getUsername);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> fetchUserData(String username) async {
    try {
      var url = Uri.parse('http://192.168.1.6:4001/login1/profile/$username');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = jsonDecode(response.body);

        if (userData.containsKey('planner')) {
          Map<String, dynamic> userMap = Map<String, dynamic>.from(userData['planner']);
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

  Future<void> _changeProfilePicture() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
 title: Text(
    'الصفحة الشخصية',
    style: TextStyle(color: Colors.white), // Set the text color to white
  ),        backgroundColor: Color.fromARGB(255, 91, 165, 129),
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
                      child: _pickedFile != null
                          ? Image.file(
                              File(_pickedFile!.path),
                              fit: BoxFit.cover,
                              width: 160,
                              height: 160,
                            )
                          : Image.asset(
                              'images/peaple2.png',
                              fit: BoxFit.cover,
                              width: 160,
                              height: 160,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 95,
                    child: GestureDetector(
                      onTap: _changeProfilePicture,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 24,
                          color: Colors.white,
                        ),
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
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,),
                    ),
                    Text(
                      "الإيميل: $userEmail",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "رقم الهاتف: $userPhone",
                      style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: plannerSalary,
                onChanged: (value) {
                  setState(() {
                    plannerSalary = value;
                  });
                },
                decoration: InputDecoration(
                //  labelText: 'سعر الشغل',
                  border: OutlineInputBorder(),
                ),
              ),
              // Display static reviews
              // if (reviews.isNotEmpty)
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SizedBox(height: 16),
              //       Text(
              //         'آراء العملاء:',
              //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //       ),
              //       SizedBox(height: 8),
              //       // Static reviews with person icon, star rating, and comment
              //       for (var review in reviews)
              //         Container(
              //           margin: EdgeInsets.only(bottom: 16),
              //           padding: EdgeInsets.all(8),
              //           decoration: BoxDecoration(
              //             border: Border.all(color: Colors.grey),
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 children: [
              //                   Icon(Icons.person, size: 20),
              //                   SizedBox(width: 8),
              //                   Text('shahd',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              //                 ],
              //               ),
              //               SizedBox(height: 8),
              //               Row(
              //                 children: [
              //                   Icon(Icons.star, color: Colors.yellow, size: 20),
              //                   SizedBox(width: 8),
              //                   Text('التقييم: 5',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              //                 ],
              //               ),
              //               SizedBox(height: 8),
              //               Text('very good team ,thank you', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              //             ],
              //           ),
              //         ),
              //     ],
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
