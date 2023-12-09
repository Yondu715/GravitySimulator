import 'package:dio/dio.dart';

import './base/base_instance.dart';
import 'types/response.dart';

class ServiceApi {
  final BaseInstance _baseInstance = BaseInstance();

  static final ServiceApi _instance = ServiceApi._singleton();
  factory ServiceApi() {
    return _instance;
  }
  ServiceApi._singleton() {
    _baseInstance.dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers['Accept'] = 'application/json';
      handler.next(options);
    }));
  }

  void addInterceptor(InterceptorsWrapper interceptorsWrapper) {
    _baseInstance.dio.interceptors.add(interceptorsWrapper);
  }

  Future<CustomResponse> _createRequest(String uri, String method,
      [Object? body]) async {
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
    if ((response.statusCode ?? 404) >= 400) {
      return CustomResponse(statusCode: response.statusCode, body: response.data['errors']);
    } else if (response.statusCode == 204) {
      return CustomResponse(statusCode: response.statusCode, body: null);
    }
    return CustomResponse(
        statusCode: response.statusCode, body: response.data['data']);
  }

  Future<CustomResponse> auth(Object params) async {
    return _createRequest('auth/login', 'post', params);
  }

  Future<CustomResponse> me() async {
    return _createRequest('auth/me', 'get');
  }
}
