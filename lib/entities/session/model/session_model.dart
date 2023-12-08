import 'package:flutter/material.dart';
import 'package:gravity_simulator/entities/session/types/auth_info_dto.dart';
import 'package:gravity_simulator/shared/api/service_api.dart';
import 'package:gravity_simulator/shared/lib/local_storage/key_store.dart';
import 'package:gravity_simulator/shared/lib/local_storage/storage.dart';

class SessionModel with ChangeNotifier {
  final ServiceApi _serviceApi = ServiceApi();
  final Storage _storage = Storage();

  bool _isAuth = false;

  void authFx(String login, String password, Function onSuccessed, Function onFailure) async {
    final res = await _serviceApi.auth({"login": login, "password": password});
    if (res.statusCode == 200) {
      _isAuth = true;
      AuthInfoDTO authInfo = AuthInfoDTO.fromJson(res.body?['data']);
      _storage.set(KeyStore.token, authInfo.token);
        onSuccessed();
    } else {
      _isAuth = false;
        onFailure();
    }
    notifyListeners();
  }

  bool getIsAuth() {
    return _isAuth;
  }

}
