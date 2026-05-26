import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../core/models/recent_alert.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/refresh_icon_button.dart';
import '../viewmodels/recent_alerts_view_model.dart';

/// Notification-style screen that lists the most recent alerts across all
/// projects the authenticated user is subscribed to.
///
/// Route: /alerts/recent
class RecentAlertsScreen extends ConsumerWidget {
  const RecentAlertsScreen({super.key, this.limit = 50});

  final int limit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final alertsAsync =
        ref.watch(recentAlertsViewModelProvider(limit: limit));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Recent Alerts', style: theme.textTheme.h4),
        actions: [
          RefreshIconButton(
            isLoading: alertsAsync.isLoading,
            onPressed: () => ref
                .read(recentAlertsViewModelProvider(limit: limit).notifier)
                .reload(),
          ),
        ],
      ),
      body: alertsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorState(message: e.toString()),
        data: (alerts) =>
            alerts.isEmpty ? const _EmptyState() : _AlertList(alerts: alerts),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Alert list
// ---------------------------------------------------------------------------

class _AlertList extends StatelessWidget {
  const _AlertList({required this.alerts});

  final List<RecentAlert> alerts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: alerts.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, i) => _AlertTile(alert: alerts[i]),
          ),
        ),
        _Footer(count: alerts.length),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Individual alert tile
// ---------------------------------------------------------------------------

class _AlertTile extends StatelessWidget {
  const _AlertTile({required this.alert});

  final RecentAlert alert;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final levelColor = _colorForLevel(alert.alertLevel);

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Coloured level indicator bar
            Container(
              width: 4,
              height: 60,
              decoration: BoxDecoration(
                color: levelColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row: badge + timestamp
                  Row(
                    children: [
                      _LevelBadge(level: alert.alertLevel, color: levelColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          DateFormatter.toDisplay(alert.timestamp.toLocal()),
                          style: theme.textTheme.small.copyWith(
                            color: theme.colorScheme.mutedForeground,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Sensor + project
                  Text(
                    alert.sensorId,
                    style: theme.textTheme.p
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Project: ${alert.projectId}',
                    style: theme.textTheme.small.copyWith(
                      color: theme.colorScheme.mutedForeground,
                    ),
                  ),
                  if (alert.deformationSpeedMmDay != null) ...[
                    const SizedBox(height: 6),
                    _MetricsRow(alert: alert),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Color _colorForLevel(String level) => switch (level) {
        'red' => AppColors.alertRed,
        'orange' => AppColors.alertOrange,
        _ => AppColors.alertBlue,
      };
}

// ---------------------------------------------------------------------------
// Level badge chip
// ---------------------------------------------------------------------------

class _LevelBadge extends StatelessWidget {
  const _LevelBadge({required this.level, required this.color});

  final String level;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        border: Border.all(color: color.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        level.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Metrics row (speed, displacement)
// ---------------------------------------------------------------------------

class _MetricsRow extends StatelessWidget {
  const _MetricsRow({required this.alert});

  final RecentAlert alert;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final style = theme.textTheme.small.copyWith(
      color: theme.colorScheme.mutedForeground,
    );

    return Wrap(
      spacing: 16,
      children: [
        if (alert.deformationSpeedMmDay != null)
          Text(
            'Speed: ${alert.deformationSpeedMmDay!.toStringAsFixed(1)} mm/day'
            '  (threshold: ${alert.thresholdMmDay?.toStringAsFixed(0) ?? '—'} mm/day)',
            style: style,
          ),
        if (alert.currentDisplacementMm != null)
          Text(
            'Displacement: ${alert.currentDisplacementMm!.toStringAsFixed(0)} mm',
            style: style,
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Footer
// ---------------------------------------------------------------------------

class _Footer extends StatelessWidget {
  const _Footer({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.colorScheme.border)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Icon(
            LucideIcons.bell,
            size: 16,
            color: theme.colorScheme.mutedForeground,
          ),
          const SizedBox(width: 8),
          Text(
            '$count ${count == 1 ? 'alert' : 'alerts'} · Sorted by time',
            style: theme.textTheme.small
                .copyWith(color: theme.colorScheme.mutedForeground),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Empty & Error states
// ---------------------------------------------------------------------------

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            LucideIcons.bellOff,
            size: 48,
            color: theme.colorScheme.mutedForeground,
          ),
          const SizedBox(height: 16),
          Text('No recent alerts', style: theme.textTheme.h4),
          const SizedBox(height: 8),
          Text(
            'All your monitored projects are within safe thresholds.',
            textAlign: TextAlign.center,
            style: theme.textTheme.small.copyWith(
              color: theme.colorScheme.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.circleAlert,
                size: 32, color: theme.colorScheme.destructive),
            const SizedBox(height: 8),
            Text(
              message,
              style: theme.textTheme.small,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
