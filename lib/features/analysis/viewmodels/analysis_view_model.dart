import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants.dart';
import '../../../core/models/analysis_models.dart';
import '../../../core/providers/providers.dart';

part 'analysis_view_model.g.dart';

// ── Time range ────────────────────────────────────────────────────────────────

enum AnalysisTimeRange {
  month(label: '1 month', days: 30),
  threeMonths(label: '3 months', days: 90),
  halfYear(label: '6 months', days: 180);

  const AnalysisTimeRange({required this.label, required this.days});
  final String label;
  final int days;
}

// ── State ─────────────────────────────────────────────────────────────────────

class AnalysisState {
  const AnalysisState({
    required this.sensorId,
    required this.sensorType,
    required this.timeRange,
    this.values = const [],
    this.timestamps = const [],
    this.isLoadingData = false,
    this.dataError,
    // Outliers
    this.outliersMethod = '3sigma',
    this.isRunningOutliers = false,
    this.outliersResult,
    this.outliersError,
    // Denoise
    this.denoiseMethod = 'wavelet',
    this.isRunningDenoise = false,
    this.denoiseResult,
    this.denoiseError,
    // Regression
    this.regressionModel = 'polynomial',
    this.regressionDegree = 3,
    this.isRunningRegression = false,
    this.regressionResult,
    this.regressionError,
    // Predict
    this.predictModel = 'arima',
    this.predictHorizon = 7,
    this.arimaOrder = const [1, 1, 1],
    this.isRunningPredict = false,
    this.predictResult,
    this.predictError,
  });

  final String sensorId;
  final String sensorType;
  final AnalysisTimeRange timeRange;

  final List<double> values;
  final List<String> timestamps;
  final bool isLoadingData;
  final String? dataError;

  // Outliers
  final String outliersMethod;
  final bool isRunningOutliers;
  final OutliersResult? outliersResult;
  final String? outliersError;

  // Denoise
  final String denoiseMethod;
  final bool isRunningDenoise;
  final DenoiseResult? denoiseResult;
  final String? denoiseError;

  // Regression
  final String regressionModel;
  final int regressionDegree;
  final bool isRunningRegression;
  final RegressionResult? regressionResult;
  final String? regressionError;

  // Predict
  final String predictModel;
  final int predictHorizon;
  final List<int> arimaOrder;
  final bool isRunningPredict;
  final PredictResult? predictResult;
  final String? predictError;

  bool get hasData => values.isNotEmpty;

  AnalysisState copyWith({
    List<double>? values,
    List<String>? timestamps,
    bool? isLoadingData,
    String? dataError,
    AnalysisTimeRange? timeRange,
    // Outliers
    String? outliersMethod,
    bool? isRunningOutliers,
    OutliersResult? outliersResult,
    bool clearOutliersResult = false,
    String? outliersError,
    // Denoise
    String? denoiseMethod,
    bool? isRunningDenoise,
    DenoiseResult? denoiseResult,
    bool clearDenoiseResult = false,
    String? denoiseError,
    // Regression
    String? regressionModel,
    int? regressionDegree,
    bool? isRunningRegression,
    RegressionResult? regressionResult,
    bool clearRegressionResult = false,
    String? regressionError,
    // Predict
    String? predictModel,
    int? predictHorizon,
    List<int>? arimaOrder,
    bool? isRunningPredict,
    PredictResult? predictResult,
    bool clearPredictResult = false,
    String? predictError,
  }) =>
      AnalysisState(
        sensorId: sensorId,
        sensorType: sensorType,
        timeRange: timeRange ?? this.timeRange,
        values: values ?? this.values,
        timestamps: timestamps ?? this.timestamps,
        isLoadingData: isLoadingData ?? this.isLoadingData,
        dataError: dataError,
        outliersMethod: outliersMethod ?? this.outliersMethod,
        isRunningOutliers: isRunningOutliers ?? this.isRunningOutliers,
        outliersResult: clearOutliersResult ? null : (outliersResult ?? this.outliersResult),
        outliersError: outliersError,
        denoiseMethod: denoiseMethod ?? this.denoiseMethod,
        isRunningDenoise: isRunningDenoise ?? this.isRunningDenoise,
        denoiseResult: clearDenoiseResult ? null : (denoiseResult ?? this.denoiseResult),
        denoiseError: denoiseError,
        regressionModel: regressionModel ?? this.regressionModel,
        regressionDegree: regressionDegree ?? this.regressionDegree,
        isRunningRegression: isRunningRegression ?? this.isRunningRegression,
        regressionResult: clearRegressionResult ? null : (regressionResult ?? this.regressionResult),
        regressionError: regressionError,
        predictModel: predictModel ?? this.predictModel,
        predictHorizon: predictHorizon ?? this.predictHorizon,
        arimaOrder: arimaOrder ?? this.arimaOrder,
        isRunningPredict: isRunningPredict ?? this.isRunningPredict,
        predictResult: clearPredictResult ? null : (predictResult ?? this.predictResult),
        predictError: predictError,
      );
}

// ── ViewModel ─────────────────────────────────────────────────────────────────

@riverpod
class AnalysisViewModel extends _$AnalysisViewModel {
  @override
  AnalysisState build({
    required String projectId,
    required String sensorId,
    required String sensorType,
  }) {
    Future.microtask(() => _fetchReadings(AnalysisTimeRange.month));
    return AnalysisState(
      sensorId: sensorId,
      sensorType: sensorType,
      timeRange: AnalysisTimeRange.month,
    );
  }

  // ---------------------------------------------------------------------------
  // Data loading
  // ---------------------------------------------------------------------------

  Future<void> _fetchReadings(AnalysisTimeRange range) async {
    state = state.copyWith(isLoadingData: true, dataError: null);
    try {
      final now = DateTime.now().toUtc();
      final from = now.subtract(Duration(days: range.days));

      final svc = ref.read(readingsServiceProvider);
      final items = await svc.getAllSensorReadings(
        sensorId: sensorId,
        from: from,
        to: now,
        sensorType: sensorType,
      );

      final values = <double>[];
      final timestamps = <String>[];

      for (final d in items) {
        final v = _primaryValue(sensorType, d.payload);
        if (v != null) {
          values.add(v);
          timestamps.add(d.timestamp.toUtc().toIso8601String());
        }
      }

      state = state.copyWith(
        values: values,
        timestamps: timestamps,
        isLoadingData: false,
      );
    } catch (e) {
      state = state.copyWith(
        values: [],
        timestamps: [],
        isLoadingData: false,
        dataError: e.toString(),
      );
    }
  }

  static double? _primaryValue(String type, Map<String, dynamic> p) {
    switch (type) {
      case kSensorTypeGnss:
        return (p['cumulative_displacement_mm'] as num?)?.toDouble();
      case kSensorTypeRainfall:
        return (p['cumulative_rainfall_mm'] as num?)?.toDouble();
      case kSensorTypeStrain:
        return (p['strain_microstrain'] as num?)?.toDouble();
      case kSensorTypeSoilPressure:
        return (p['pressure_kpa'] as num?)?.toDouble();
      case kSensorTypeDeepDisplacement:
        return (p['cumulative_tilt_mm'] as num?)?.toDouble();
      default:
        return null;
    }
  }

  void selectTimeRange(AnalysisTimeRange range) {
    state = state.copyWith(timeRange: range);
    _fetchReadings(range);
  }

  void refresh() => _fetchReadings(state.timeRange);

  // ---------------------------------------------------------------------------
  // Outliers
  // ---------------------------------------------------------------------------

  void setOutliersMethod(String method) =>
      state = state.copyWith(outliersMethod: method, clearOutliersResult: true);

  Future<void> runOutliers() async {
    if (!state.hasData || state.isRunningOutliers) return;
    state = state.copyWith(
      isRunningOutliers: true,
      outliersError: null,
      clearOutliersResult: true,
    );
    try {
      final result = await ref.read(analysisServiceProvider).detectOutliers(
            values: state.values,
            timestamps: state.timestamps,
            method: state.outliersMethod,
          );
      state = state.copyWith(isRunningOutliers: false, outliersResult: result);
    } catch (e) {
      state = state.copyWith(
          isRunningOutliers: false, outliersError: e.toString());
    }
  }

  // ---------------------------------------------------------------------------
  // Denoise
  // ---------------------------------------------------------------------------

  void setDenoiseMethod(String method) =>
      state = state.copyWith(denoiseMethod: method, clearDenoiseResult: true);

  Future<void> runDenoise() async {
    if (!state.hasData || state.isRunningDenoise) return;
    state = state.copyWith(
      isRunningDenoise: true,
      denoiseError: null,
      clearDenoiseResult: true,
    );
    try {
      final result = await ref.read(analysisServiceProvider).denoise(
            values: state.values,
            timestamps: state.timestamps,
            method: state.denoiseMethod,
          );
      state = state.copyWith(isRunningDenoise: false, denoiseResult: result);
    } catch (e) {
      state =
          state.copyWith(isRunningDenoise: false, denoiseError: e.toString());
    }
  }

  // ---------------------------------------------------------------------------
  // Regression
  // ---------------------------------------------------------------------------

  void setRegressionModel(String model) => state =
      state.copyWith(regressionModel: model, clearRegressionResult: true);

  void setRegressionDegree(int degree) => state =
      state.copyWith(regressionDegree: degree, clearRegressionResult: true);

  Future<void> runRegression() async {
    if (!state.hasData || state.isRunningRegression) return;
    state = state.copyWith(
      isRunningRegression: true,
      regressionError: null,
      clearRegressionResult: true,
    );
    try {
      final result = await ref.read(analysisServiceProvider).regression(
            values: state.values,
            timestamps: state.timestamps,
            model: state.regressionModel,
            degree: state.regressionDegree,
          );
      state =
          state.copyWith(isRunningRegression: false, regressionResult: result);
    } catch (e) {
      state = state.copyWith(
          isRunningRegression: false, regressionError: e.toString());
    }
  }

  // ---------------------------------------------------------------------------
  // Predict
  // ---------------------------------------------------------------------------

  void setPredictModel(String model) =>
      state = state.copyWith(predictModel: model, clearPredictResult: true);

  void setPredictHorizon(int horizon) =>
      state = state.copyWith(predictHorizon: horizon, clearPredictResult: true);

  void setArimaOrder(List<int> order) =>
      state = state.copyWith(arimaOrder: order, clearPredictResult: true);

  Future<void> runPredict() async {
    if (!state.hasData || state.isRunningPredict) return;
    state = state.copyWith(
      isRunningPredict: true,
      predictError: null,
      clearPredictResult: true,
    );
    try {
      final result = await ref.read(analysisServiceProvider).predict(
            values: state.values,
            timestamps: state.timestamps,
            model: state.predictModel,
            horizon: state.predictHorizon,
            arimaOrder: state.arimaOrder,
          );
      state = state.copyWith(isRunningPredict: false, predictResult: result);
    } catch (e) {
      state =
          state.copyWith(isRunningPredict: false, predictError: e.toString());
    }
  }
}
