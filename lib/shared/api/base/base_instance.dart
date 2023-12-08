import 'package:dio/dio.dart';

class BaseInstance {
  late Dio dio;
  final String _protocol = 'http';
  final String _uri = '172.20.10.2';
  final String _port = '80';
  
  BaseInstance() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: '$_protocol://$_uri:$_port/api',
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType
    );
    dio = Dio(baseOptions);
  }
}