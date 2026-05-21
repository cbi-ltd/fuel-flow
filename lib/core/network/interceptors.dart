import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
      debugPrint('Headers: ${options.headers}');
      debugPrint('Data: ${options.data}');
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (kDebugMode) {
      debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
      debugPrint('Data: ${response.data}');
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      );
      debugPrint('Message: ${err.message}');
    }

    super.onError(err, handler);
  }
}
