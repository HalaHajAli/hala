import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<String> _cartImages = [];

  // Getter to get the list of images in the cart
  List<String> get cartImages => _cartImages;

  // Method to add an image to the cart
  void addToCart(String imagePath) {
    _cartImages.add(imagePath);
    notifyListeners();
  }

  // You can add other methods here, such as removing items from the cart

  // For example, to remove an image from the cart
  void removeFromCart(String imagePath) {
    _cartImages.remove(imagePath);
    notifyListeners();
  }

  // Clear all items from the cart
  void clearCart() {
    _cartImages.clear();
    notifyListeners();
  }
}
