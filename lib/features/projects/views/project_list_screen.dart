import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectListScreen extends ConsumerWidget {
  const ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: watch projectListProvider
    // TODO: show list of Shangtan / Lingzhan projects
    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: const Center(
        child: Text('Project list — TODO'),
      ),
    );
  }
}
