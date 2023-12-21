import 'package:gravity_simulator/shared/api/types/custom_response.dart';

abstract interface class IServiceApi {
  Future<CustomResponse> auth(Object params);
  Future<CustomResponse> me();
}