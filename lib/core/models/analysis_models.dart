// Response models for the data-analysis-service (/analysis endpoints).
// No code generation required — all deserialized manually.

// ── Outliers ──────────────────────────────────────────────────────────────────

class OutlierItem {
  const OutlierItem({
    required this.index,
    required this.timestamp,
    required this.value,
    this.thresholdUpper,
    this.thresholdLower,
    this.criterion,
    this.zScore,
    this.probability,
  });

  final int index;
  final String timestamp;
  final double value;
  final double? thresholdUpper;
  final double? thresholdLower;
  final String? criterion;
  final double? zScore;
  final double? probability;

  factory OutlierItem.fromJson(Map<String, dynamic> json) => OutlierItem(
        index: json['index'] as int,
        timestamp: json['timestamp'] as String,
        value: (json['value'] as num).toDouble(),
        thresholdUpper: (json['threshold_upper'] as num?)?.toDouble(),
        thresholdLower: (json['threshold_lower'] as num?)?.toDouble(),
        criterion: json['criterion'] as String?,
        zScore: (json['z_score'] as num?)?.toDouble(),
        probability: (json['probability'] as num?)?.toDouble(),
      );
}

class OutliersStatistics {
  const OutliersStatistics({
    required this.mean,
    required this.std,
    required this.n,
    required this.outlierCount,
  });

  final double mean;
  final double std;
  final int n;
  final int outlierCount;

  factory OutliersStatistics.fromJson(Map<String, dynamic> json) =>
      OutliersStatistics(
        mean: (json['mean'] as num).toDouble(),
        std: (json['std'] as num).toDouble(),
        n: json['n'] as int,
        outlierCount: json['outlier_count'] as int,
      );
}

class OutliersResult {
  const OutliersResult({
    required this.method,
    required this.outliers,
    required this.statistics,
  });

  final String method;
  final List<OutlierItem> outliers;
  final OutliersStatistics statistics;

  factory OutliersResult.fromJson(Map<String, dynamic> json) => OutliersResult(
        method: json['method'] as String,
        outliers: (json['outliers'] as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .map(OutlierItem.fromJson)
            .toList(),
        statistics: OutliersStatistics.fromJson(
            json['statistics'] as Map<String, dynamic>),
      );
}

// ── Denoise ───────────────────────────────────────────────────────────────────

class DenoiseResult {
  const DenoiseResult({
    required this.method,
    required this.denoisedValues,
    this.params = const {},
  });

  final String method;
  final List<double> denoisedValues;
  final Map<String, dynamic> params;

  factory DenoiseResult.fromJson(Map<String, dynamic> json) => DenoiseResult(
        method: json['method'] as String,
        denoisedValues: (json['denoised_values'] as List<dynamic>)
            .map((e) => (e as num).toDouble())
            .toList(),
        params: (json['params'] as Map<String, dynamic>?) ?? {},
      );
}

// ── Regression ────────────────────────────────────────────────────────────────

class RegressionResult {
  const RegressionResult({
    required this.model,
    required this.coefficients,
    required this.fittedValues,
    required this.r2Score,
    this.degree,
  });

  final String model;
  final List<double> coefficients;
  final List<double> fittedValues;
  final double r2Score;
  final int? degree;

  factory RegressionResult.fromJson(Map<String, dynamic> json) =>
      RegressionResult(
        model: json['model'] as String,
        coefficients: (json['coefficients'] as List<dynamic>)
            .map((e) => (e as num).toDouble())
            .toList(),
        fittedValues: (json['fitted_values'] as List<dynamic>)
            .map((e) => (e as num).toDouble())
            .toList(),
        r2Score: (json['r2_score'] as num).toDouble(),
        degree: json['degree'] as int?,
      );
}

// ── Predict ───────────────────────────────────────────────────────────────────

class PredictResult {
  const PredictResult({
    required this.model,
    required this.horizon,
    required this.predictedValues,
    required this.predictedTimestamps,
    this.confidenceLower,
    this.confidenceUpper,
    this.order,
  });

  final String model;
  final int horizon;
  final List<double> predictedValues;
  final List<String> predictedTimestamps;
  final List<double>? confidenceLower;
  final List<double>? confidenceUpper;
  final List<int>? order;

  factory PredictResult.fromJson(Map<String, dynamic> json) => PredictResult(
        model: json['model'] as String,
        horizon: json['horizon'] as int,
        predictedValues: (json['predicted_values'] as List<dynamic>)
            .map((e) => (e as num).toDouble())
            .toList(),
        predictedTimestamps: (json['predicted_timestamps'] as List<dynamic>)
            .cast<String>(),
        confidenceLower: (json['confidence_lower'] as List<dynamic>?)
            ?.map((e) => (e as num).toDouble())
            .toList(),
        confidenceUpper: (json['confidence_upper'] as List<dynamic>?)
            ?.map((e) => (e as num).toDouble())
            .toList(),
        order: (json['order'] as List<dynamic>?)
            ?.map((e) => (e as num).toInt())
            .toList(),
      );
}
