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
  // Add controllers for other fields

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with data submission
      Map<String, dynamic> packageData = {
        "username": usernameController.text,
        "name": packageNameController.text,
        "price": priceController.text,
        "mainPage": {
          "plannerName": plannerNameController.text,
          "eventName": eventNameController.text,
          "location": locationController.text,
        },
        "imagePage": {
          "images": imageController.text,
          "images": imageController2.text,
          "images": imageController3.text,
        },
        "detailsPage": {
          "details": detailsController.text,
        },
      };

      // Send data to the database (replace 'YOUR_SERVER_ENDPOINT_HERE' with actual endpoint)
      sendDataToDatabase(packageData);

      // Clear the form after submission
      _formKey.currentState!.reset();
    }
  }

  Future<void> sendDataToDatabase(Map<String, dynamic> packageData) async {
    try {
      var url = Uri.parse('http://127.0.0.1:4001/login2/package');
      final response = await http.post(
        url,
        body: jsonEncode(packageData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        // Handle successful storage
        print('Package created successfully');
      } else {
        // Handle errors
        print(
            'Failed to create the package. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    } catch (error) {
      print('Error creating package: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أضف عرض جديد'),
      ),
      body: Padding(
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
              // Add more TextFormField widgets for other fields
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
                controller:imageController2,
                decoration: InputDecoration(labelText: 'الصورة'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return;
                  }
                  return null;
                },
              ),
               TextFormField(
                controller: imageController3,
                decoration: InputDecoration(labelText: 'الصورة'),
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
                maxLines: null, // Allow multiline input
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(
                  'أدخل العرض',
                  style: TextStyle(
                      color: Color(
                        0xFF5BA581,
                      ),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
