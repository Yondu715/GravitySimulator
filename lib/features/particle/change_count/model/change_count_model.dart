import 'package:flutter/material.dart';

class ChangeCountModel with ChangeNotifier {
  String count = "";

  void setCount(String count) {
    this.count = count;
    notifyListeners();
  }
}
