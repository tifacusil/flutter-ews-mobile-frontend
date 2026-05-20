import 'package:flutter/material.dart';
import '../models/alert_level.dart';

class AppColors {
  const AppColors._();

  static const primary = Color(0xFF1565C0);

  // Alert level colours (matching Bai et al. 2020 convention)
  static const alertBlue = Color(0xFF1E88E5);
  static const alertOrange = Color(0xFFFB8C00);
  static const alertRed = Color(0xFFE53935);

  static Color forLevel(AlertLevel level) => switch (level) {
        AlertLevel.blue => alertBlue,
        AlertLevel.orange => alertOrange,
        AlertLevel.red => alertRed,
      };
}
