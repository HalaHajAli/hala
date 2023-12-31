import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application/views/login1.dart';
import 'package:flutter_application/views/servicepage.dart';
import 'package:flutter_application/views/plannerpage.dart';
import 'package:flutter_application/views/login.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _username = '';
  String _password = '';
  String _confirmPassword = '';
  String _email = '';
  String _mobile = '';

  bool _isDesigner = false;
  bool _showErrors = false;




  void _submitForm() async {
  setState(() {
    _showErrors = true;
  });

  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();

    final bool isUserRegistered = await registerUser();
    if (isUserRegistered) {
      if (_isDesigner) {
        final bool isPlannerSaved = await registerPlanner();
        if (isPlannerSaved) {
          // Navigator code to move to the next page after successful registration
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login(
                email: _email,
               usern: _username,
            )),
          );
        } else {
          print('Planner registration failed');
        }
      } else {
        
 if (isUserRegistered) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login1()),
      );
    }


        
      }
    } else {
      print('User registration failed');
    }
  }
}

  Future<bool> registerPlanner() async {
    final url = 'http://127.0.0.1:4001/regplanner';
    final Map<String, dynamic> userData = {
      'username': _username,
      'password': _password,
      'email': _email,
      'mobile': _mobile,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  void handleIsDesignerToggle() async {
    if (_isDesigner) {
      final bool isPlannerSaved = await registerPlanner();
      if (isPlannerSaved) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>HomePage()),
        );
      } else {
        print('Planner registration failed');
      }
    } else {
      // For regular users, nothing specific on switch toggle
    }
  }

  Future<bool> registerUser() async {
    final url = 'http://127.0.0.1:4001/register';
    final Map<String, dynamic> userData = {
      'username': _username,
      'password': _password,
      'email': _email,
      'mobile': _mobile,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Widget _buildRoundedField({
    required String labelText,
    IconData? prefixIcon,
    bool obscureText = false,
    required String? Function(String?) validator,
    required void Function(String?) onSaved,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          ),
          obscureText: obscureText,
          validator: _showErrors ? validator : null,
          onSaved: onSaved,
        ),
        if (_showErrors && validator(_showErrors ? '' : null) != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              validator('')!,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التسجيل'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildRoundedField(
                  labelText: 'اسم المستخدم',
                  prefixIcon: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      //  return 'الرجاء إدخال اسم المستخدم';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value!;
                  },
                ),
                SizedBox(height: 10),
                _buildRoundedField(
                  labelText: 'كلمة المرور',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // return 'الرجاء إدخال كلمة المرور';
                    } else if (value.length < 6) {
                      return 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                SizedBox(height: 10),
                _buildRoundedField(
                  labelText: 'تأكيد كلمة المرور',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // return 'الرجاء تأكيد كلمة المرور';
                    } else if (value != _password) {
                      return 'كلمات المرور غير متطابقة';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _confirmPassword = value!;
                  },
                ),
                SizedBox(height: 10),
                _buildRoundedField(
                  labelText: 'البريد الإلكتروني',
                  prefixIcon: Icons.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // return 'الرجاء إدخال البريد الإلكتروني';
                    } else if (!value.contains('@')) {
                      return 'بريد إلكتروني غير صحيح';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: 10),
                _buildRoundedField(
                  labelText: 'رقم الجوال',
                  prefixIcon: Icons.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      //return 'الرجاء إدخال رقم الجوال';
                    } else if (value.length < 10) {
                      return 'يجب أن يحتوي رقم الجوال على 10 أرقام على الأقل';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _mobile = value!;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'أنا مصمم',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: _isDesigner,
                      onChanged: (value) {
                        setState(() {
                          _isDesigner = value;
                        });

                       // handleIsDesignerToggle();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 91, 165, 129)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(70, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'تسجيل',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login1(
                                email: _email,
                                usern: _username,
                              )),
                    );
                  },
                  child: Text(
                    'هل لديك حساب؟ تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                if (_showErrors && !_formKey.currentState!.validate())
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    // Show an error message here if needed
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
