import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> favoriteImages = [];

  void addToFavorites(String imagePath) {
    favoriteImages.add(imagePath);
    notifyListeners();
  }

  void removeFromFavorites(String imagePath) {
    favoriteImages.remove(imagePath);
    notifyListeners();
  }
}
