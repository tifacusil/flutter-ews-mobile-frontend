import 'package:flutter/material.dart';

import '../../../core/models/alert_level.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/alert_level_helper.dart';

class AlertBannerWidget extends StatelessWidget {
  const AlertBannerWidget({super.key, required this.level});

  final AlertLevel level;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.forLevel(level),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        AlertLevelHelper.label(level),
        style: AppTextStyles.alertBannerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
