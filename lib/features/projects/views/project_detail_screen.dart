import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../core/models/project.dart';
import '../../../core/utils/router_utils.dart';
import '../../../data/mock/mock_data.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sensors = MockData.sensorsByProject[projectId] ?? [];
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
            Text(project.typeLabel, style: theme.textTheme.muted),
          ],
        ),
      ),
      body: sensors.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(LucideIcons.plugZap,
                      size: 32, color: theme.colorScheme.mutedForeground),
                  const SizedBox(height: 8),
                  Text('No sensors configured',
                      style: theme.textTheme.muted),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: sensors.length,
              separatorBuilder: (_, i) => const SizedBox(height: 8),
              itemBuilder: (context, i) => _SensorTile(
                projectId: projectId,
                info: sensors[i],
              ),
            ),
    );
  }
}

class _SensorTile extends StatelessWidget {
  const _SensorTile({required this.projectId, required this.info});

  final String projectId;
  final SensorInfo info;

  String _routeFor(SensorInfo info) => switch (info.type) {
        SensorType.gnss => AppRoutes.gnss(projectId, info.id),
        SensorType.rainfall => AppRoutes.rainfall(projectId, info.id),
        SensorType.soilPressure => AppRoutes.soilPressure(projectId, info.id),
        SensorType.strain => AppRoutes.strain(projectId, info.id),
        SensorType.deepDisplacement =>
          AppRoutes.deepDisplacement(projectId, info.id),
      };

  IconData _iconFor(SensorType type) => switch (type) {
        SensorType.gnss => LucideIcons.satellite,
        SensorType.rainfall => LucideIcons.cloudRain,
        SensorType.soilPressure => LucideIcons.gauge,
        SensorType.strain => LucideIcons.activity,
        SensorType.deepDisplacement => LucideIcons.arrowDownToLine,
      };

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => context.pushTo(_routeFor(info)),
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
                  _iconFor(info.type),
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(info.label, style: theme.textTheme.p),
                    const SizedBox(height: 2),
                    Text(
                      '${info.id} · ${info.description}',
                      style: theme.textTheme.muted,
                    ),
                  ],
                ),
              ),
              Icon(
                LucideIcons.chevronRight,
                size: 18,
                color: theme.colorScheme.mutedForeground,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
