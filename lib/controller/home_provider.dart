import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  int counter = 0;
  List favourite = [];
  List word = [];
  Future apiFetch() async {
    List temp = [];
    var response =
        await http.get(Uri.parse('https://random-word-api.herokuapp.com/all'));
    print(response.body);
    for (var element in jsonDecode(response.body)) {
      temp.add(element);
    }
    word = temp;
    notifyListeners();
  }

  addToFavourite(String i) {
    favourite.add(i);
    notifyListeners();
  }

  debug() {
    if (kDebugMode) {
      favourite = [];
      apiFetch();
      print("App Debug ==> ${favourite.length}");
      print("App Debug ==> ${word.length}");
      print(favourite);
    }
    notifyListeners();
  }
}
