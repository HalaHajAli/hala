import 'package:flutter/material.dart';

class PackageProvider extends ChangeNotifier {
  List<Package> _packages = [];

  List<Package> get packages => _packages;

  void setPackages(List<Package> packages) {
    _packages = packages;
    notifyListeners();
        print('Packages set in Provider: $_packages');

  }

  // Add other methods or properties as needed
}
class Package {
  String packageName;
  int packagePrice;
  Map<String, dynamic> mainPage;
  Map<String, dynamic> imagePage;
  Map<String, dynamic> detailsPage;

  Package({
    required this.packageName,
    required this.packagePrice,
    required this.mainPage,
    required this.imagePage,
    required this.detailsPage,
  });
}
