import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertHistoryScreen extends ConsumerWidget {
  const AlertHistoryScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: watch alertProvider(projectId) and display history list
    // TODO: colour each row by AlertLevel using AppColors.forLevel
    return Scaffold(
      appBar: AppBar(title: const Text('Alert History')),
      body: const Center(
        child: Text('Alert history — TODO'),
      ),
    );
  }
}
