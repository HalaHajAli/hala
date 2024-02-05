import 'package:flutter/material.dart';
import 'package:flutter_application/views/EventProvider.dart';

class WaitingListProvider with ChangeNotifier {
  List<EventRequest> waitingList = [];

  List<EventRequest> get getWaitingList => waitingList;

  void addToWaitingList(EventRequest request) {
    waitingList.add(request);
    notifyListeners();
  }

  void clearWaitingList() {
    waitingList.clear();
    notifyListeners();
  }
}
