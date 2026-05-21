import 'package:dio/dio.dart';

import '../constants/app_constants.dart';
import 'interceptors.dart';

class ApiClient {
  static Dio? _dio;

  static Dio get instance => _dio ??= _createDio();

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        connectTimeout: const Duration(
          milliseconds: AppConstants.connectTimeout,
        ),
        receiveTimeout: const Duration(
          milliseconds: AppConstants.receiveTimeout,
        ),
      ),
    );

    dio.interceptors.add(LoggingInterceptor());

    return dio;
  }
}
