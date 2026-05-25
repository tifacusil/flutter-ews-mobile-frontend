import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../core/models/project.dart';
import '../../../core/models/sensor.dart';
import '../../../core/utils/router_utils.dart';
import '../../../data/mock/mock_data.dart';
import '../viewmodels/project_detail_view_model.dart';

class ProjectDetailScreen extends ConsumerWidget {
  const ProjectDetailScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final sensorsAsync = ref.watch(
      projectDetailViewModelProvider(projectId),
    );

    final project = MockData.projects.firstWhere(
      (p) => p.id == projectId,
      orElse: () => Project(id: projectId, displayName: projectId, typeLabel: ''),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.displayName, style: theme.textTheme.h4),
            if (project.typeLabel.isNotEmpty)
              Text(project.typeLabel, style: theme.textTheme.muted),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.refreshCw, size: 18),
            onPressed: () =>
                ref.read(projectDetailViewModelProvider(projectId).notifier).reload(),
          ),
        ],
      ),
      body: sensorsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(LucideIcons.circleAlert,
                    size: 32, color: theme.colorScheme.destructive),
                const SizedBox(height: 8),
                Text(e.toString(),
                    style: theme.textTheme.small, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
        data: (sensors) => sensors.isEmpty
            ? const _EmptyState()
            : ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: sensors.length,
                separatorBuilder: (_, i) => const SizedBox(height: 8),
                itemBuilder: (context, i) =>
                    _SensorTile(projectId: projectId, sensor: sensors[i]),
              ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Empty state
// ---------------------------------------------------------------------------

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.plugZap,
              size: 48,
              color: theme.colorScheme.mutedForeground,
            ),
            const SizedBox(height: 16),
            Text(
              'No sensors',
              style: theme.textTheme.h4,
            ),
            const SizedBox(height: 8),
            Text(
              'This project has no sensors configured yet.',
              textAlign: TextAlign.center,
              style: theme.textTheme.small.copyWith(
                color: theme.colorScheme.mutedForeground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Sensor tile
// ---------------------------------------------------------------------------

class _SensorTile extends StatelessWidget {
  const _SensorTile({required this.projectId, required this.sensor});

  final String projectId;
  final ApiSensor sensor;

  /// Returns the navigation route for a known sensor type, or null if the
  /// type is not yet supported in this app (e.g. "camera").
  String? _routeFor(ApiSensor s) => switch (s.sensorType.toLowerCase()) {
        'gnss' => AppRoutes.gnss(projectId, s.sensorId),
        'rainfall' => AppRoutes.rainfall(projectId, s.sensorId),
        'soil_pressure' => AppRoutes.soilPressure(projectId, s.sensorId),
        'strain' => AppRoutes.strain(projectId, s.sensorId),
        'deep_displacement' => AppRoutes.deepDisplacement(projectId, s.sensorId),
        _ => null,
      };

  IconData _iconFor(String type) => switch (type.toLowerCase()) {
        'gnss' => LucideIcons.satellite,
        'rainfall' => LucideIcons.cloudRain,
        'soil_pressure' => LucideIcons.gauge,
        'strain' => LucideIcons.activity,
        'deep_displacement' => LucideIcons.arrowDownToLine,
        'camera' => LucideIcons.camera,
        _ => LucideIcons.cpu,
      };

  String _labelFor(ApiSensor s) {
    final typeLabel = switch (s.sensorType.toLowerCase()) {
      'gnss'              => 'GNSS',
      'rainfall'          => 'Rainfall',
      'soil_pressure'     => 'Soil Pressure',
      'strain'            => 'Strain Gauge',
      'deep_displacement' => 'Deep Displacement',
      'camera'            => 'Camera',
      _                   => s.sensorType,
    };
    return s.model != null && s.model!.isNotEmpty
        ? '$typeLabel · ${s.model}'
        : typeLabel;
  }

  String _subtitleFor(ApiSensor s) {
    final parts = <String>[s.sensorId];
    if (s.status != null && s.status!.isNotEmpty) parts.add(s.status!);
    return parts.join(' · ');
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final route = _routeFor(sensor);
    final supported = route != null;

    return ShadCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: supported ? () => context.pushTo(route) : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.colorScheme.muted,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _iconFor(sensor.sensorType),
                  size: 18,
                  color: supported
                      ? theme.colorScheme.primary
                      : theme.colorScheme.mutedForeground,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_labelFor(sensor), style: theme.textTheme.p),
                    const SizedBox(height: 2),
                    Text(
                      _subtitleFor(sensor),
                      style: theme.textTheme.muted,
                    ),
                  ],
                ),
              ),
              if (supported)
                Icon(
                  LucideIcons.chevronRight,
                  size: 18,
                  color: theme.colorScheme.mutedForeground,
                )
              else
                Text(
                  'unsupported',
                  style: theme.textTheme.small.copyWith(
                    color: theme.colorScheme.mutedForeground,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
