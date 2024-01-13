import 'package:flutter/material.dart';
import 'package:flutter_application/views/forgetpass.dart';
import 'package:flutter_application/views/servicepage.dart';
import 'package:http/http.dart' as http;
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_application/views/Responsive .dart';

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
    return Responsive(
      mobile: buildLoginBody(),
      desktop: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: buildLoginBody(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                'images/monasaba.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoginBody() {
    return SingleChildScrollView(
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
                        : Color.fromARGB(255, 91, 165, 129),
                  ),
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
                        : Color.fromARGB(255, 91, 165, 129),
                  ),
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
                usernameError = '';
              }
              if (password.isEmpty) {
                setState(() {
                  passwordError = 'من فضلك أدخل كلمة المرور';
                });
              } else {
                passwordError = '';
              }

              if (username.isNotEmpty && password.isNotEmpty) {
                var url = Uri.parse('http://127.0.0.1:4001/login1');
                var response = await http.post(
                  url,
                  body: {
                    'username': username,
                    'password': password,
                  },
                );

                if (response.statusCode == 200) {
                  Flushbar(
                    title: 'تسجيل الدخول',
                    message: 'تم تسجيل الدخول بنجاح!',
                    duration: Duration(seconds: 5),
                  )..show(context);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ServicePage(
                        userType: widget.userType,
                        usern: username,
                        ema: email,
                      ),
                    ),
                  );
                } else {
                  Flushbar(
                    title: 'خطأ',
                    message: 'المستخدم غير موجود أو كلمة المرور غير صحيحة',
                    duration: Duration(seconds: 5),
                  )..show(context);

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
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
    );
  }
}
