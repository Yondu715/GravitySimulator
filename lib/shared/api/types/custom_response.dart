class CustomResponse {
  final Map<int, int> _statusTable = {
    200: 200,
    204: 204,
    400: 400,
    401: 401
  };

  late int statusCode;
  late Map<String, dynamic> body;

  CustomResponse({int? statusCode,  Map<String, dynamic>? body}) {
    this.body = body ?? <String, dynamic>{};
    this.statusCode = _statusTable[statusCode] ?? 404;
  }
}