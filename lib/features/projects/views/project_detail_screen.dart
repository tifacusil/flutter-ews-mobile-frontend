import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectDetailScreen extends ConsumerWidget {
  const ProjectDetailScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: fetch project details (sensor list, current alert level)
    // TODO: show sensor tiles and navigate to SensorDashboardScreen
    return Scaffold(
      appBar: AppBar(title: Text('Project: $projectId')),
      body: const Center(
        child: Text('Project detail — TODO'),
      ),
    );
  }
}
