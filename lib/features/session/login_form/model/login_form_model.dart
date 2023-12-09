import 'package:flutter/material.dart';
import 'package:gravity_simulator/entities/session/model/session_service.dart';
import 'package:gravity_simulator/entities/session/types/auth_dto.dart';

class LoginFormModel with ChangeNotifier {
  final SessionService _sessionService = SessionService();
  String login = '';
  String password = '';
  String errorMessage = '';

  void setLogin(String login) {
    this.login = login;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  Future<bool> auth() async {
    AuthDTO authDTO = AuthDTO(login, password);
    bool success = await _sessionService.authFx(authDTO);
    return success;
  }

}