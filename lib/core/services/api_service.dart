import 'package:dio/dio.dart';

import '../constants.dart';

class ApiService {
  ApiService({String? baseUrl})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl ?? kApiBaseUrl,
            connectTimeout: kConnectTimeout,
            receiveTimeout: kReceiveTimeout,
            headers: {'Content-Type': 'application/json'},
          ),
        ) {
    _dio.interceptors.add(_AuthInterceptor());
  }

  final Dio _dio;

  Dio get client => _dio;
}

class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: inject Authorization: Bearer <token> from AuthService
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: on 401 attempt token refresh via AuthService
    handler.next(err);
  }
}
