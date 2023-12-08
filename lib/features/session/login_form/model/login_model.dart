import 'package:flutter/material.dart';

class LoginFormModel with ChangeNotifier {
  String login = '';
  String password = '';

  void setLogin(String login) {
    this.login = login;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }
}