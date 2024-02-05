import 'package:flutter/material.dart';
import 'package:flutter_application/views/forgetpass.dart';
import 'package:flutter_application/views/servicepage.dart';
import 'package:http/http.dart' as http;
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_application/views/Responsive .dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/service2.dart';
import 'package:flutter_application/views/offerProvider.dart';
import 'package:flutter_application/views/NewProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/loc.dart';
import 'package:another_flushbar/flushbar.dart';



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

  String usernameError = '';
  String passwordError = '';

  Future<void> loginUser() async {
    if (validateInputs()) {
      try {
        var url = Uri.parse('http://192.168.1.6:4001/login1');

        var response = await http.post(
          url,
          body: {
            'username': username,
            'password': password,
          },
        ).timeout(Duration(seconds: 10));

        handleResponse(response);
      } catch (error) {
        handleGeneralError();
      }
    }
  }

  bool validateInputs() {
    bool isValid = true;

    if (username.isEmpty) {
      setState(() {
        usernameError = 'من فضلك أدخل اسم المستخدم';
      });
      isValid = false;
    } else {
      usernameError = '';
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = 'من فضلك أدخل كلمة المرور';
      });
      isValid = false;
    } else {
      passwordError = '';
    }

    return isValid;
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

void showTopNotification(String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    backgroundColor: Colors.green,
     duration: Duration(seconds: 3),
   boxShadows: [BoxShadow(color: Colors.black, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
  )..show(context);
}


  void handleResponse(http.Response response) {
    if (response.statusCode == 200) {
  //  showTopNotification('تم تسجيل الدخول بنجاح!');


          final newProvider = Provider.of<NewProvider>(context, listen: false);
      newProvider.setUsername(username);

      // Successful login
      final offerProvider = Provider.of<OfferProvider>(context, listen: false);
      offerProvider.addToCart("hala"); // planner name
         //   offerProvider.addToCart("summer2024"); // planner name

      //offerProvider.addToCart(username.toString());
      //offerProvider.addToCart("Lemon w n3n3"); // planner name

      // Flushbar(
      //   title: 'تسجيل الدخول',
      //   message: 'تم تسجيل الدخول بنجاح!',
      //   duration: Duration(seconds: 5),
      // )..show(context);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AddItemPage(),
   //  ServicePage(
          //   userType: widget.userType,
          //   usern: username,
          //   ema: '',
          // ),
        ),
      );
    } else {
      // Handle other HTTP status codes
      handleHttpError(response.statusCode);
    }
  }

  void handleHttpError(int statusCode) {
    // Handle specific HTTP status codes
    if (statusCode == 404) {
      print('User not found');
    } else {
      print('HTTP Error: $statusCode');
    }

    setState(() {
      usernameError = 'المستخدم غير موجود';
      passwordError = 'كلمة المرور غير صحيحة';
    });
  }

  void handleGeneralError() {
    
    // Handle general errors
    Flushbar(
      title: 'خطأ',
      message: 'حدث خطأ أثناء تسجيل الدخول',
      duration: Duration(seconds: 5),
    )..show(context);
  }

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
              onPressed: loginUser,
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
