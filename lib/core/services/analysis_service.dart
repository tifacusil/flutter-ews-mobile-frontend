import 'package:dio/dio.dart';

import '../constants.dart';
import '../models/analysis_models.dart';
import 'user_management_service.dart'; // ApiException

/// HTTP client for the data-analysis microservice (default: http://localhost:8090).
///
/// No authentication required — CORS-restricted by the service.
/// All routes are prefixed with `/analysis`.
///
/// Obtain via [analysisServiceProvider].
class AnalysisService {
  AnalysisService() : _dio = _buildDio();

  final Dio _dio;

  static Dio _buildDio() {
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
        onError: (err, handler) {
          final response = err.response;
          if (response != null) {
            final body = response.data;
            String message;
            if (body is Map) {
              final msg = body['message'];
              message = msg is String ? msg : (msg?.toString() ?? err.message ?? 'Unknown error');
            } else {
              message = err.message ?? 'Unknown error';
            }
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

  Map<String, dynamic> _base(List<double> values, List<String> timestamps) => {
        'values': values,
        'timestamps': timestamps,
      };

  // ---------------------------------------------------------------------------
  // POST /data-analysis/analysis/outliers
  // ---------------------------------------------------------------------------

  Future<OutliersResult> detectOutliers({
    required List<double> values,
    required List<String> timestamps,
    required String method,
  }) async {
    try {
      final res = await _dio.post<Map<String, dynamic>>(
        '/data-analysis/analysis/outliers',
        data: {..._base(values, timestamps), 'method': method},
      );
      return OutliersResult.fromJson(res.data!);
    } catch (e) {
      _throw(e);
    }
  }

  // ---------------------------------------------------------------------------
  // POST /data-analysis/analysis/denoise
  // ---------------------------------------------------------------------------

  Future<DenoiseResult> denoise({
    required List<double> values,
    required List<String> timestamps,
    required String method,
  }) async {
    try {
      final res = await _dio.post<Map<String, dynamic>>(
        '/data-analysis/analysis/denoise',
        data: {..._base(values, timestamps), 'method': method},
      );
      return DenoiseResult.fromJson(res.data!);
    } catch (e) {
      _throw(e);
    }
  }

  // ---------------------------------------------------------------------------
  // POST /data-analysis/analysis/regression
  // ---------------------------------------------------------------------------

  Future<RegressionResult> regression({
    required List<double> values,
    required List<String> timestamps,
    required String model,
    int degree = 3,
  }) async {
    try {
      final res = await _dio.post<Map<String, dynamic>>(
        '/data-analysis/analysis/regression',
        data: {
          ..._base(values, timestamps),
          'model': model,
          if (model == 'polynomial') 'degree': degree,
        },
      );
      return RegressionResult.fromJson(res.data!);
    } catch (e) {
      _throw(e);
    }
  }

  // ---------------------------------------------------------------------------
  // POST /data-analysis/analysis/predict
  // ---------------------------------------------------------------------------

  Future<PredictResult> predict({
    required List<double> values,
    required List<String> timestamps,
    required String model,
    required int horizon,
    List<int> arimaOrder = const [1, 1, 1],
  }) async {
    try {
      final res = await _dio.post<Map<String, dynamic>>(
        '/data-analysis/analysis/predict',
        data: {
          ..._base(values, timestamps),
          'model': model,
          'horizon': horizon,
          if (model == 'arima') 'arima_order': arimaOrder,
        },
      );
      return PredictResult.fromJson(res.data!);
    } catch (e) {
      _throw(e);
    }
  }
}
