import 'package:flutter/material.dart';
import 'dart:math'; // Import the dart:math library for generating random numbers

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  String email = '';
  String verificationCode = ''; // Store the verification code here
  String errorMessage = ''; // Store error message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('نسيت كلمة المرور؟'),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'أدخل عنوان البريد الإلكتروني الخاص بك لإعادة تعيين كلمة المرور:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              // Email input field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xFF5BA581)),
                  ),
                  errorText: errorMessage, // Display error message
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    email = value;
                    // Clear error message when the user enters text
                    errorMessage = '';
                  });
                },
              ),
              SizedBox(height: 20),
              // Button to send verification code
              ElevatedButton(
                onPressed: () {
                  if (email.isEmpty) {
                    // Show an error message if the email is empty
                    setState(() {
                      errorMessage = 'يجب أن تقوم بإدخال البريد الإلكتروني';
                      verificationCode = ''; // Clear verification code
                    });
                  } else {
                    // Generate and send the verification code
                    sendVerificationCode(email);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5BA581),
                ),
                child: Text('إرسال رمز التحقق'),
              ),
              // Display the verification code (for testing purposes)
              if (verificationCode.isNotEmpty)
                Text('رمز التحقق: $verificationCode'),
            ],
          ),
        ),
      ),
    );
  }

  // Function to send the verification code
  void sendVerificationCode(String email) {
    // In this example, we'll generate a random 6-digit code for simplicity
    final random = Random();
    final code = List.generate(6, (index) => random.nextInt(10)).join();

    // TODO: Implement your code to send the generated code to the entered email.
    // This might involve using a third-party service or sending an email with the code.

    // For testing purposes, we'll display the code in the UI.
    setState(() {
      verificationCode = code;
    });
  }
}
