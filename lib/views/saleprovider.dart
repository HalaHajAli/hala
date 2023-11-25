import 'package:flutter/foundation.dart';
import 'package:flutter_application/views/serviceadmin.dart';


class AdminProvider extends ChangeNotifier {
  List<SaleItem> sales = [];
  List<OfferItem> offers = [];

  void addSale(SaleItem sale) {
    sales.add(sale);
    notifyListeners();
  }

  void addOffer(OfferItem offer) {
    offers.add(offer);
    notifyListeners();
  }
}
