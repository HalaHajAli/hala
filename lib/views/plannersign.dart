import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email = '';
  String _username = '';
  String _password = '';
  String _confirmPassword = '';
  String _phoneNumber = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      // Check if passwords match
      if (_password != _confirmPassword) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Password Mismatch'),
              content: Text('The entered passwords do not match.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }

      // Perform registration logic here
      print('إيميل: $_email');
      print('إسم المستخدم: $_username');
      print('كلمة المرور: $_password');
      print('رقم الهاتف: $_phoneNumber');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التسجيل'),
        backgroundColor: Color(0xFF5BA581), // Set the AppBar color to green
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'إسم المستخدم',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xFF5BA581)),
                  ),
                  errorText: _username.isEmpty ? null : null,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'من فضلك أدخل إسم المستخدم';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value ?? '';
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xFF5BA581)),
                  ),
                  errorText: _password.isEmpty ? null : (_password.length < 6 ? 'كلمة المرور يجب أن تتكون من 6 أحرف على الأقل' : null),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'كلمة المرور يجب أن تتكون من 6 أحرف على الأقل';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value ?? '';
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'تأكيد كلمة المرور',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xFF5BA581)),
                  ),
                  errorText: _confirmPassword.isEmpty ? null : (_confirmPassword != _password ? 'كلمات المرور غير متطابقة' : null),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value != _password) {
                    return 'كلمات المرور غير متطابقة';
                  }
                  return null;
                },
                onSaved: (value) {
                  _confirmPassword = value ?? '';
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'إيميل',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xFF5BA581)),
                  ),
                  errorText: _email.isEmpty ? null : (!_email.contains('@') ? 'عنوان إيميل غير صالح' : null),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'من فضلك أدخل عنوان إيميل صالح';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value ?? '';
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'رقم الهاتف',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xFF5BA581)),
                  ),
                  errorText: _phoneNumber.isEmpty ? null : null,
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'من فضلك أدخل رقم الهاتف';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value ?? '';
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5BA581),
                ),
                child: Text('تسجيل'),
              ),
            ],
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 6a71350e6bc95347455be93d60908f0f04965542
