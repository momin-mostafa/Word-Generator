import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  int counter = 0;
  List favourite = [];
  addToFavourite(int i) {
    favourite.add(i);
    notifyListeners();
  }

  debug() {
    if (kDebugMode) {
      print("App Debug ==> ${favourite.length}");
      print(favourite);
    }
  }
}
