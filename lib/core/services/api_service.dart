import 'package:dio/dio.dart';

import '../constants.dart';
import 'auth_service.dart';

/// Dio client for the main EWS data API (sensor readings, alerts, etc.).
///
/// The JWT is injected automatically from [AuthService] on every request.
/// A 401 response is surfaced as a [DioException] — callers should navigate
/// to the login screen when they receive it.
class ApiService {
  ApiService({required AuthService authService, String? baseUrl})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl ?? kApiBaseUrl,
            connectTimeout: kConnectTimeout,
            receiveTimeout: kReceiveTimeout,
            headers: {'Content-Type': 'application/json'},
          ),
        ) {
    _dio.interceptors.add(_AuthInterceptor(authService));
  }

  final Dio _dio;

  Dio get client => _dio;
}

class _AuthInterceptor extends Interceptor {
  _AuthInterceptor(this._auth);

  final AuthService _auth;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _auth.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // On 401 the app should redirect to login; surface the error as-is so
    // ViewModels / the router can react.
    handler.next(err);
  }
}
