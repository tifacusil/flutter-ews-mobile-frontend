import 'package:flutter/material.dart';

import '../../../core/models/sensor_envelope.dart';

class SoilPressureWidget extends StatelessWidget {
  const SoilPressureWidget({super.key, required this.latest});

  final SensorEnvelope? latest;

  @override
  Widget build(BuildContext context) {
    // TODO: display pressureKpa and optional temperatureCelsius
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text('Soil pressure reading — TODO'),
      ),
    );
  }
}
