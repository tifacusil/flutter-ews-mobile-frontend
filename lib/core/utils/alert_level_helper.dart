import '../models/alert_level.dart';

class AlertLevelHelper {
  const AlertLevelHelper._();

  /// Returns the [AlertLevel] for a given daily displacement [mmPerDay],
  /// or null if below the blue threshold.
  static AlertLevel? fromMmPerDay(double mmPerDay) {
    if (mmPerDay >= AlertLevel.red.mmPerDayThreshold) return AlertLevel.red;
    if (mmPerDay >= AlertLevel.orange.mmPerDayThreshold) return AlertLevel.orange;
    if (mmPerDay >= AlertLevel.blue.mmPerDayThreshold) return AlertLevel.blue;
    return null;
  }

  static String label(AlertLevel level) => switch (level) {
        AlertLevel.blue => 'Blue Alert (≥10 mm/day)',
        AlertLevel.orange => 'Orange Alert (≥15 mm/day)',
        AlertLevel.red => 'Red Alert (≥20 mm/day)',
      };
}
