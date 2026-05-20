import 'package:flutter/material.dart';

import '../../../core/models/sensor_envelope.dart';

class StrainWidget extends StatelessWidget {
  const StrainWidget({super.key, required this.latest});

  final SensorEnvelope? latest;

  @override
  Widget build(BuildContext context) {
    // TODO: display strainMicrostrain and optional temperatureCelsius
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text('Strain reading — TODO'),
      ),
    );
  }
}
