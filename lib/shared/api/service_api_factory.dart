import 'package:gravity_simulator/shared/api/service_api.dart';
import 'package:gravity_simulator/shared/api/types/i_service_api.dart';

class ServiceApiFactory {

  static IServiceApi? _instance;

  static IServiceApi createInstance() {
    _instance ??= ServiceApi();
    return _instance!;
  }
}