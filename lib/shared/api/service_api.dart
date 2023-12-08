import 'package:dio/dio.dart';

import './base/base_instance.dart';
import 'types/response.dart';

class ServiceApi {
  final BaseInstance _baseInstance = BaseInstance();

  static final ServiceApi _instance = ServiceApi._singleton();
  factory ServiceApi() {
    return _instance;
  }
  ServiceApi._singleton();

  Future<CustomResponse> _createRequest(
      String uri, String method, Object? body) async {
    Response response;
    switch (method) {
      case 'get':
        response = await _baseInstance.dio.get('/$uri');
        break;
      case 'post':
        response = await _baseInstance.dio.post('/$uri', data: body);
      default:
        response = await _baseInstance.dio.get('/$uri');
        break;
    }
    return CustomResponse(statusCode: response.statusCode, body: response.data);
  }

  Future<CustomResponse> auth(Object params) async {
    return _createRequest('auth/login', 'post', params);
  }
}
