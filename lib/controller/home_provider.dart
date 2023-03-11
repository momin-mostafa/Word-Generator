import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int counter = 0;
  incrementCounter() {
    counter++;
    notifyListeners();
  }
}
