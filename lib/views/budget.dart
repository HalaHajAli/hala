import 'package:flutter/material.dart';

class BudgetProvider with ChangeNotifier {
  String _budget = '';

  String get budget => _budget;

  set budget(String value) {
    _budget = value;
    notifyListeners();
  }
}
