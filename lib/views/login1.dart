import 'package:flutter/material.dart';
import 'package:flutter_application/views/forgetpass.dart';
import 'package:flutter_application/views/servicepage.dart';

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
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String usernameError = '';
  String passwordError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Color.fromARGB(255, 91, 165, 129)),
                ),
                errorText: usernameError.isNotEmpty ? usernameError : null,
              ),
              onChanged: (value) {
                setState(() {
                  usernameError = '';
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Color.fromARGB(255, 91, 165, 129)),
                ),
                errorText: passwordError.isNotEmpty ? passwordError : null,
             
             
              ),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  passwordError = '';
                });
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String username = _usernameController.text.trim();
              String password = _passwordController.text.trim();

              if (username.isEmpty) {
                setState(() {
                  usernameError = 'Please enter your username';
                });
              }
              if (password.isEmpty) {
                setState(() {
                  passwordError = 'Please enter your password';
                });
              }
              if (username.isNotEmpty && password.isNotEmpty) {
                if (username == 'hala' && password == '123') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ServicePage(userType: widget.userType),
                    ),
                  );
                } else {
                  setState(() {
                    usernameError = 'Invalid username';
                    passwordError = 'Incorrect password';
                  });
                }
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              child: Text('Login as ${widget.userType}'),
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
            child: Text('Forgot your password?'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
