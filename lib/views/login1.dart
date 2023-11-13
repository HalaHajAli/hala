import 'package:flutter/material.dart';
import 'package:flutter_application/views/forgetpass.dart';
import 'package:flutter_application/views/servicepage.dart'; // Import the service page


class Login1 extends StatefulWidget {
  final String userType;

  const Login1({
    Key? key,
    this.userType = 'visitor', // Set a default value
  }) : super(key: key);

  @override
  _Login1State createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  String username = '';
  String password = '';
  String usernameError = ''; // Error message for username
  String passwordError = ''; // Error message for password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image positioned at the top
          Image.asset(
            'images/monasaba.png',
            height: 400, // Adjust the height of the image
            width: 400, // Adjust the width of the image
          ),
          SizedBox(height: 20), // Adjust the spacing between the image and the input fields
          // Username input field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Color.fromARGB(255, 91, 165, 129)),
                ),
                errorText: usernameError.isNotEmpty ? usernameError : null, // Display username error message
              ),
              onChanged: (value) {
                setState(() {
                  username = value;
                  // Clear error message when the user enters text
                  usernameError = '';
                });
              },
            ),
          ),
          SizedBox(height: 20), // Adjust the spacing between the input fields
          // Password input field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Color.fromARGB(255, 91, 165, 129)),
                ),
                errorText: passwordError.isNotEmpty ? passwordError : null, // Display password error message
              ),
              obscureText: true, // Hide the password
              onChanged: (value) {
                setState(() {
                  password = value;
                  // Clear error message when the user enters text
                  passwordError = '';
                });
              },
            ),
          ),
          SizedBox(height: 20), // Adjust the spacing between the input fields
          // Oval-shaped login button
          ElevatedButton(
            onPressed: () {
              if (username.isEmpty) {
                setState(() {
                  usernameError = '  من فضلك أدخل إسم المستخدم ';
                });
              }
              if (password.isEmpty) {
                setState(() {
                  passwordError = '  من فضلك أدخل كلمة المرور ';
                });
              }
              if (username.isNotEmpty && password.isNotEmpty) {
                // Check if username and password match the condition
                if (username == 'hala' && password == '123') {
                  // Navigate to the service page
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ServicePage(userType: widget.userType),
                    ),
                  );
                } else {
                  // Handle incorrect username or password
                  setState(() {
                    usernameError = 'المستخدم غير موجود';
                    passwordError = 'كلمة المرور غير صحيحة';
                  });
                }
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              child: Text('تسجيل الدخول كـ ${widget.userType}'), // Display the user type
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 91, 165, 129),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Make the button oval
              ),
            ),
          ),
          SizedBox(height: 10), // Adjust the spacing between the login button and the forget password button
          // Forget Password button
          TextButton(
            onPressed: () {
              // Navigate to the forget password page when the button is pressed
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ForgetPasswordPage(),
                ),
              );
            },
            style: TextButton.styleFrom(
              primary: Color.fromARGB(255, 91, 165, 129),
            ),
            child: Text('نسيت كلمة المرور؟'),
          ),
        ],
      ),
    );
  }
}
