import 'package:flutter/material.dart';

class ColorData {
  String selectedColor;

  ColorData({
    required this.selectedColor,
  });
}

class ColorProvider with ChangeNotifier {
  ColorData? _colorData;

  ColorData? get colorData => _colorData;

  void setSelectedColor(String color) {
    _colorData = ColorData(selectedColor: color);
    notifyListeners();
  }
}
