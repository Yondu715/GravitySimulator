import 'package:dio/dio.dart';
import 'package:gravity_simulator/shared/api/types/i_service_api.dart';
import 'package:gravity_simulator/shared/api/types/request_method.dart';
import 'package:gravity_simulator/shared/lib/storage/i_storage.dart';
import 'package:gravity_simulator/shared/lib/storage/key_store.dart';
import 'package:gravity_simulator/shared/lib/storage/storage_factory.dart';

import './base/base_instance.dart';
import 'types/custom_response.dart';

class ServiceApi implements IServiceApi {
  final BaseInstance _baseInstance = BaseInstance();
  final IStorage _storage = StorageFactory.createInstance();

  ServiceApi() {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _baseInstance.dio.interceptors.add(InterceptorsWrapper(
      onRequest: _addAuthHeader
    ));
  }

  Future<void> _addAuthHeader(RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await _storage.get<String>(KeyStore.token, KeyStore.tokenDefault);
      if (token != '') {
        options.headers['Authorization'] = 'Bearer $token';
      }
      handler.next(options);
  }

  Future<CustomResponse> _createRequest(String uri, RequestMethod method,
      [Object? body]) async {
    Response response;
    switch (method) {
      case RequestMethod.get:
        response = await _baseInstance.dio.get('/$uri');
        break;
      case RequestMethod.post:
        response = await _baseInstance.dio.post('/$uri', data: body);
      default:
        response = await _baseInstance.dio.get('/$uri');
        break;
    }
    if ((response.statusCode ?? 404) >= 400) {
      return CustomResponse(
          statusCode: response.statusCode,
          body: response.data['errors']);
    }
    return CustomResponse(
        statusCode: response.statusCode,
        body: response.data != '' ? response.data['data'] : null);
  }

  @override
  Future<CustomResponse> auth(Object params) async {
    return _createRequest('auth/login', RequestMethod.post, params);
  }

  @override
  Future<CustomResponse> me() async {
    return _createRequest('auth/me', RequestMethod.get);
  }
}
