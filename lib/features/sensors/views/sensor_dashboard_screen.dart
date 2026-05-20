import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SensorDashboardScreen extends ConsumerWidget {
  const SensorDashboardScreen({super.key, required this.sensorId});

  final String sensorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: watch sensorDashboardProvider(sensorId)
    // TODO: show tab bar for each sensor type (gnss / rainfall / strain / etc.)
    return Scaffold(
      appBar: AppBar(title: Text('Sensor: $sensorId')),
      body: const Center(
        child: Text('Sensor dashboard — TODO'),
      ),
    );
  }
}
