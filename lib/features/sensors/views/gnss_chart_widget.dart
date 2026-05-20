import 'package:flutter/material.dart';

// ignore: unused_import — will be used once chart is implemented
import 'package:fl_chart/fl_chart.dart';

import '../../../core/models/sensor_envelope.dart';

/// Cumulative displacement (mm) vs time — mirrors Fig 8a in Bai et al. 2020.
class GnssChartWidget extends StatelessWidget {
  const GnssChartWidget({super.key, required this.history});

  final List<SensorEnvelope> history;

  @override
  Widget build(BuildContext context) {
    // TODO: extract cumulativeDisplacementMm from each envelope's GnssPayload
    // TODO: map to FlSpot list and render LineChart
    return const SizedBox(
      height: 240,
      child: Center(child: Text('GNSS cumulative displacement chart — TODO')),
    );
  }
}
