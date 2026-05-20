import 'package:flutter/material.dart';

// ignore: unused_import — will be used once chart is implemented
import 'package:fl_chart/fl_chart.dart';

import '../../../core/models/sensor_envelope.dart';

/// Daily + cumulative rainfall — mirrors Fig 8b in Bai et al. 2020.
class RainfallChartWidget extends StatelessWidget {
  const RainfallChartWidget({super.key, required this.history});

  final List<SensorEnvelope> history;

  @override
  Widget build(BuildContext context) {
    // TODO: render BarChart for daily rainfall + LineChart overlay for cumulative
    return const SizedBox(
      height: 240,
      child: Center(child: Text('Rainfall chart — TODO')),
    );
  }
}
