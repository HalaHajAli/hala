import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PackageEntryForm extends StatefulWidget {
  @override
  _PackageEntryFormState createState() => _PackageEntryFormState();
}

class _PackageEntryFormState extends State<PackageEntryForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController packageNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController plannerNameController = TextEditingController();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController imageController2 = TextEditingController();
  TextEditingController imageController3 = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      List<String> images = [
        imageController.text,
        imageController2.text,
        imageController3.text,
      ];

      Map<String, dynamic> packageData = {
        "username": usernameController.text,
        "name": packageNameController.text,
        "price": priceController.text,
        "mainPage": {
          "plannerName": plannerNameController.text,
          "eventName": eventNameController.text,
          "location": locationController.text,
        },
        "imagePage": {"images": images},
        "detailsPage": {
          "details": detailsController.text,
        },
      };

      sendDataToDatabase(packageData);

      _formKey.currentState!.reset();
    }
  }

  Future<void> sendDataToDatabase(Map<String, dynamic> packageData) async {
    try {
      var url = Uri.parse('http://192.168.1.4:4001/login2/package');
      final response = await http.post(
        url,
        body: jsonEncode(packageData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        print('Package created successfully');
         _showSuccessDialog();
      } else {
        print('Failed to create the package. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    } catch (error) {
      print('Error creating package: $error');
    }
  }
void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
     title: Text('النتيحة',style:TextStyle(  color:Colors.black,
                      fontWeight: FontWeight.bold,fontSize: 18)),
          content: Text('تم إضافة العرض بنجاح',
          style:TextStyle(  color:Colors.black,
                      fontWeight: FontWeight.bold,fontSize: 18) ,),
          actions: <Widget>[
            TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
             _formKey.currentState!.reset();
            },
              child: Text('موافق'),
            ),
          ],
        );
      },
    );
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أضف عرض جديد'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: 'اسم المستخدم'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ادخل اسم المستخدم';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: packageNameController,
                  decoration: InputDecoration(labelText: 'اسم العرض '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ادخل اسم العرض ';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'السعر'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ادخل سعر العرض ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: plannerNameController,
                  decoration: InputDecoration(labelText: 'اسم المخطط'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ادخل اسم المخطط';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: eventNameController,
                  decoration: InputDecoration(labelText: 'اسم الشركة '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ادخل اسم الشركة';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(labelText: 'الموقع '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ادخل موقع الشركة';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: imageController,
                  decoration: InputDecoration(labelText: 'الصورة'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: imageController2,
                  decoration: InputDecoration(labelText: 'الصورة 2'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: imageController3,
                  decoration: InputDecoration(labelText: 'الصورة 3'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: detailsController,
                  decoration: InputDecoration(labelText: 'تفاصيل '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ادخل تفاصيل الحدث';
                    }
                    return null;
                  },
                  maxLines: null,
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    'أدخل العرض',
                    style: TextStyle(
                      color: Color(0xFF5BA581),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
