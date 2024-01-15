import 'package:flutter/material.dart';


  class OfferProvider with ChangeNotifier {
  List<String> _offer = [];

  // Getter to get the list of images in the cart
  List<String> get offer =>_offer ;

  // Method to add an image to the cart
  void addToCart(String imagePath) {
  _offer.add(imagePath);
    notifyListeners();
  }


  
  }