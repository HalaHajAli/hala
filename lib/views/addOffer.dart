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
  // Add controllers for other fields

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with data submission
      Map<String, dynamic> packageData = {
        "username": usernameController.text,
        "name": packageNameController.text,
        // Add other fields to the package data
      };

      // Send data to the database (replace 'YOUR_SERVER_ENDPOINT_HERE' with actual endpoint)
      sendDataToDatabase(packageData);

      // Clear the form after submission
      _formKey.currentState!.reset();
    }
  }

  Future<void> sendDataToDatabase(Map<String, dynamic> packageData) async {
    try {
      var url = Uri.parse('YOUR_SERVER_ENDPOINT_HERE');
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
        print('Failed to create the package. Status Code: ${response.statusCode}');
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
        title: Text('Enter Package Details'),
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
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              // Add other TextFormField widgets for other fields
              TextFormField(
                controller: packageNameController,
                decoration: InputDecoration(labelText: 'Package Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a package name';
                  }
                  return null;
                },
              ),
              // Add more TextFormField widgets for other fields

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
