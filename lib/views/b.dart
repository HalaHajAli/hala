import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

      if (_isDesigner) {
        final bool isPlannerSaved = await registerPlanner();
        if (isPlannerSaved) {
          // Handle navigation for planner registration success
          print('Planner registered successfully');
        } else {
          // Handle planner registration failure
          print('Planner registration failed');
        }
      } else {
        final bool isValid = await registerUser();
        if (isValid) {
          // Handle navigation for user registration success
          print('User registered successfully');
        } else {
          // Handle user registration failure
          print('User registration failed');
        }
      }
    }
  }

  Future<bool> registerPlanner() async {
    final url = 'http://127.0.0.1:4001/registerPlanner';
    final Map<String, dynamic> plannerData = {
      'username': _username,
      'password': _password,
      'email': _email,
      'mobile': _mobile,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(plannerData),
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

  Future<bool> registerUser() async {
    final url = 'http://127.0.0.1:4001/registerUser';
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
        title: Text('Sign Up'),
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
                  labelText: 'Username',
                  prefixIcon: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value!;
                  },
                ),
                SizedBox(height: 10),
                // Other form fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I am a designer',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: _isDesigner,
                      onChanged: (value) {
                        setState(() {
                          _isDesigner = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SignUpPage(),
  ));
}
