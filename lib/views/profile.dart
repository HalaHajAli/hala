import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "John Doe"; // Replace with the user's name
  String userEmail = "john.doe@example.com"; // Replace with the user's email
  String userPhone = "123-456-7890"; // Replace with the user's phone number

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Handle the picked image, e.g., upload it to a server
      print("Image path: ${pickedFile.path}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("مرحباً $userName"),
        backgroundColor: Color.fromARGB(255, 91, 165, 129), // Set app bar color to green
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  _pickImage();
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/blank-profile-circle.png'), // Replace with the user's profile image
                ),
              ),
              SizedBox(height: 8), // Add a small gap between image and name
              Align(
                alignment: Alignment.center,
                child: Text(
                  userName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 100, // Adjust the height of the container as needed
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 91, 165, 129),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "الإيميل :$userEmail",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "رقم الهاتف$userPhone",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}