import '../constants.dart';

enum AlertLevel { blue, orange, red }

extension AlertLevelThreshold on AlertLevel {
  double get mmPerDayThreshold => switch (this) {
        AlertLevel.blue => kAlertBlueThreshold,
        AlertLevel.orange => kAlertOrangeThreshold,
        AlertLevel.red => kAlertRedThreshold,
      };
}
