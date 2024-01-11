import 'package:flutter/material.dart';
import 'package:flutter_application/views/forgetpass.dart';
import 'package:flutter_application/views/servicepage.dart'; // Import the service page
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/views/signup.dart';

class Login1 extends StatefulWidget {
  final String userType;
  final String usern;
  final String email;
  const Login1({
    Key? key,
    this.userType = 'زائر',
    this.usern = '',
       this.email = '',

  }) : super(key: key);

  @override
  _Login1State createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  String username = '';
  String password = '';
    String email = '';

  String usernameError = '';
  String passwordError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/monasaba.png',
              height: 400,
              width: 400,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'اسم المستخدم',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                        color: usernameError.isNotEmpty
                            ? Colors.red
                            : Color.fromARGB(255, 91, 165, 129)),
                  ),
                  errorText: usernameError.isNotEmpty ? usernameError : null,
                ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                    usernameError = '';
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                        color: passwordError.isNotEmpty
                            ? Colors.red
                            : Color.fromARGB(255, 91, 165, 129)),
                  ),
                  errorText: passwordError.isNotEmpty ? passwordError : null,
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                    passwordError = '';
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (username.isEmpty) {
                  setState(() {
                    usernameError = 'من فضلك أدخل اسم المستخدم';
                  });
                } else {
                  // Check username separately here if needed
                  usernameError =
                      ''; // Reset error message if username is not empty
                }
                if (password.isEmpty) {
                  setState(() {
                    passwordError = 'من فضلك أدخل كلمة المرور';
                  });
                } else {
                  // Check password separately here if needed
                  passwordError =
                      ''; // Reset error message if password is not empty
                }

                if (username.isNotEmpty && password.isNotEmpty) {
                  var url = Uri.parse('http://192.168.1.4:4001/login1');
                  var response = await http.post(
                    url,
                    body: {
                      'username': username,
                      'password': password,
                    },
                  );

                  if (response.statusCode == 200) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ServicePage(
                          userType: widget.userType,
                          usern: username,
                          ema:email,
                        ),
                      ),
                    );
                  } else {
                    // Set error messages based on server response if needed
                    setState(() {
                      usernameError = 'المستخدم غير موجود';
                      passwordError = 'كلمة المرور غير صحيحة';
                    });
                  }
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 91, 165, 129),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
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
      ),
    );
  }
}
