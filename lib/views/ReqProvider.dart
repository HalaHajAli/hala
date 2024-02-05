import 'package:flutter/material.dart';


  class ReqProvider with ChangeNotifier {
  List<String> _req = [];

  // Getter to get the list of images in the cart
  List<String> get  req =>_req ;

  // Method to add an image to the cart
  void addReq(String imagePath) {
  _req.add(imagePath);
    notifyListeners();
  }


  
  }