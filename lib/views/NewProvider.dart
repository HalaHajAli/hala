import 'package:flutter/material.dart';

class NewProvider extends ChangeNotifier {
String name = "";
  String get getUsername => name;


  void setUsername(String newUsername) {
    name = newUsername;
    notifyListeners();
    print('Username set in Provider: $name');
  }
  // Add other methods or properties as needed
}