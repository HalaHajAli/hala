import 'package:flutter/material.dart';

class GradProvider extends ChangeNotifier {
  List<String> gradList = [];

  void addToGradList(String item) {
    gradList.add(item);
    notifyListeners();
  }

  List<String> getGradList() {
    return List.from(gradList);
  }
}
