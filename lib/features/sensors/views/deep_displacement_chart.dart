import 'package:flutter/material.dart';

// ignore: unused_import — will be used once chart is implemented
import 'package:fl_chart/fl_chart.dart';

import '../../../core/models/sensor_envelope.dart';

/// Borehole profile: cumulative tilt (mm) vs depth (m).
class DeepDisplacementChart extends StatelessWidget {
  const DeepDisplacementChart({super.key, required this.readings});

  final List<SensorEnvelope> readings;

  @override
  Widget build(BuildContext context) {
    // TODO: extract depthM + cumulativeTiltMm from DeepDisplacementPayload
    // TODO: render horizontal LineChart (depth on Y axis, tilt on X axis)
    return const SizedBox(
      height: 320,
      child: Center(child: Text('Deep displacement borehole chart — TODO')),
    );
  }
}
