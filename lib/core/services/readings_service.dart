import 'package:dio/dio.dart';

import '../constants.dart';
import '../models/reading.dart';
import 'auth_service.dart';
import 'user_management_service.dart'; // re-uses ApiException

/// HTTP client for the Readings Service (port 8083).
///
/// Provides time-series sensor data.
/// Obtain via [readingsServiceProvider].
class ReadingsService {
  ReadingsService({required AuthService authService})
      : _dio = _buildDio(authService);

  final Dio _dio;

  static Dio _buildDio(AuthService auth) {
    final dio = Dio(
      BaseOptions(
        baseUrl: kApiBaseUrl,
        connectTimeout: kConnectTimeout,
        receiveTimeout: kReceiveTimeout,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = auth.accessToken;
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (err, handler) {
          final response = err.response;
          if (response != null) {
            final body = response.data;
            final message = (body is Map && body['error'] != null)
                ? body['error'] as String
                : err.message ?? 'Unknown error';
            handler.reject(
              DioException(
                requestOptions: err.requestOptions,
                response: response,
                error: ApiException(
                  statusCode: response.statusCode ?? 0,
                  message: message,
                ),
              ),
            );
          } else {
            handler.next(err);
          }
        },
      ),
    );

    return dio;
  }

  Never _throw(Object error) {
    if (error is DioException && error.error is ApiException) {
      throw error.error as ApiException;
    }
    if (error is ApiException) throw error;
    throw error;
  }

  // ---------------------------------------------------------------------------
  // GET /api/v1/sensors/{sensor_id}/readings
  // ---------------------------------------------------------------------------

  /// Fetches paginated readings for a single sensor.
  ///
  /// [from] / [to] are optional UTC date-time bounds.
  /// [sensorType] narrows results when a sensor hosts multiple types.
  /// [fixQuality] filters GNSS readings by fix quality (e.g. `"rtk_fixed"`).
  /// [limit] defaults to 500 if not provided.
  Future<PagedResponse<ReadingDto>> getSensorReadings({
    required String sensorId,
    DateTime? from,
    DateTime? to,
    String? sensorType,
    String? fixQuality,
    int offset = 0,
    int limit = 500,
  }) async {
    try {
      final params = <String, dynamic>{
        'offset': offset,
        'limit': limit,
        if (from case final f?) 'from': f.toUtc().toIso8601String(),
        if (to case final t?) 'to': t.toUtc().toIso8601String(),
        // ignore: use_null_aware_elements
        if (sensorType != null) 'sensor_type': sensorType,
        // ignore: use_null_aware_elements
        if (fixQuality != null) 'fix_quality': fixQuality,
      };

      final res = await _dio.get<Map<String, dynamic>>(
        '/api/v1/sensors/$sensorId/readings',
        queryParameters: params,
      );

      return PagedResponse.fromJson(res.data!);
    } catch (e) {
      _throw(e);
    }
  }
}
