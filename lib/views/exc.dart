import 'package:flutter/material.dart';
import 'package:flutter_application/views/EventProvider.dart';



class ExecutionListProvider with ChangeNotifier {
  List<EventRequest> executionList = [];

  List<EventRequest> get getExecutionList => executionList;

  void addToExecutionList(EventRequest request) {
    executionList.add(request);
    notifyListeners();
  }

    void clearExecutionList() {
    executionList.clear();
    notifyListeners();
  }
}
