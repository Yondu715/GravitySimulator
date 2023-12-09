import 'package:dio/dio.dart';
import 'package:gravity_simulator/entities/session/types/auth_dto.dart';
import 'package:gravity_simulator/entities/session/types/auth_info_dto.dart';
import 'package:gravity_simulator/shared/api/service_api.dart';
import 'package:gravity_simulator/shared/api/types/response.dart';
import 'package:gravity_simulator/shared/lib/local_storage/key_store.dart';
import 'package:gravity_simulator/shared/lib/local_storage/storage.dart';

class SessionService {
  final ServiceApi _serviceApi = ServiceApi();
  final Storage _storage = Storage();

  static final SessionService _instance = SessionService._singleton();
  factory SessionService() {
    return _instance;
  }
  SessionService._singleton() {
    _serviceApi.addInterceptor(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String token = await _storage.get<String>(KeyStore.token, KeyStore.tokenDefault);
        if (token != '') {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ));
  }

  Future<bool> authFx(AuthDTO authDTO) async {
    CustomResponse res = await _serviceApi.auth(authDTO.toJson());
    if (res.statusCode == 200) {
      AuthInfoDTO authInfo = AuthInfoDTO.fromJson(res.body!);
      _storage.set(KeyStore.token, authInfo.token);
      return true;
    }
    return false;
  }

  Future<bool> checkAuthFx() async {
    CustomResponse res = await _serviceApi.me();
    if (res.statusCode == 204) {
      return true;
    }
    return false;
  }

}
