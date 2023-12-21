import 'package:gravity_simulator/entities/session/types/auth_dto.dart';
import 'package:gravity_simulator/entities/session/types/auth_info_dto.dart';
import 'package:gravity_simulator/shared/api/service_api_factory.dart';
import 'package:gravity_simulator/shared/api/types/custom_response.dart';
import 'package:gravity_simulator/shared/api/types/i_service_api.dart';
import 'package:gravity_simulator/shared/lib/storage/i_storage.dart';
import 'package:gravity_simulator/shared/lib/storage/key_store.dart';
import 'package:gravity_simulator/shared/lib/storage/storage_factory.dart';

class SessionService {
  final IServiceApi _serviceApi = ServiceApiFactory.createInstance();
  final IStorage _storage = StorageFactory.createInstance();

  static final SessionService _instance = SessionService._singleton();
  factory SessionService() {
    return _instance;
  }
  SessionService._singleton();

  Future<bool> authFx(AuthDTO authDTO) async {
    CustomResponse res = await _serviceApi.auth(authDTO.toJson());
    if (res.statusCode == 200) {
      AuthInfoDTO authInfo = AuthInfoDTO.fromJson(res.body);
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
