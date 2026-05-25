import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../core/utils/date_formatter.dart';
import '../../../data/mock/mock_data.dart';
import '../viewmodels/rainfall_view_model.dart';

class RainfallScreen extends ConsumerWidget {
  const RainfallScreen({super.key, required this.projectId, required this.sensorId});

  final String projectId;
  final String sensorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final state = ref.watch(rainfallViewModelProvider(projectId: projectId, sensorId: sensorId));
    final notifier = ref.read(rainfallViewModelProvider(projectId: projectId, sensorId: sensorId).notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rainfall Monitor', style: theme.textTheme.h4),
            Text(sensorId, style: theme.textTheme.muted),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ControlBar(state: state, notifier: notifier),
          Expanded(child: _Body(state: state)),
          _Legend(),
        ],
      ),
    );
  }
}

// ── Controls ──────────────────────────────────────────────────────────────────

class _ControlBar extends StatelessWidget {
  const _ControlBar({required this.state, required this.notifier});

  final RainfallChartState state;
  final RainfallViewModel notifier;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.colorScheme.border)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                _DropdownChip<RainfallTimeRange>(
                  label: state.timeRange.label,
                  items: RainfallTimeRange.values,
                  labelBuilder: (v) => v.label,
                  onSelected: notifier.selectRange,
                ),
                IconButton(
                  icon: const Icon(LucideIcons.refreshCw, size: 16),
                  tooltip: 'Refresh',
                  onPressed: notifier.refresh,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DropdownChip<T> extends StatelessWidget {
  const _DropdownChip({
    required this.label,
    required this.items,
    required this.labelBuilder,
    required this.onSelected,
  });

  final String label;
  final List<T> items;
  final String Function(T) labelBuilder;
  final void Function(T) onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return PopupMenuButton<T>(
      tooltip: '',
      onSelected: onSelected,
      itemBuilder: (_) => items
          .map((v) => PopupMenuItem<T>(value: v, child: Text(labelBuilder(v))))
          .toList(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.border),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: theme.textTheme.small),
            const SizedBox(width: 4),
            Icon(LucideIcons.chevronsUpDown, size: 12, color: theme.colorScheme.mutedForeground),
          ],
        ),
      ),
    );
  }
}

// ── Body ──────────────────────────────────────────────────────────────────────

class _Body extends StatelessWidget {
  const _Body({required this.state});
  final RainfallChartState state;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) return const Center(child: CircularProgressIndicator());
    if (state.error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.circleAlert, size: 32,
                  color: ShadTheme.of(context).colorScheme.destructive),
              const SizedBox(height: 8),
              Text(state.error!, style: ShadTheme.of(context).textTheme.small,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      );
    }
    if (state.readings.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.cloudRain, size: 48,
                  color: ShadTheme.of(context).colorScheme.mutedForeground),
              const SizedBox(height: 16),
              Text('No readings', style: ShadTheme.of(context).textTheme.h4),
              const SizedBox(height: 8),
              Text('No rainfall data for the selected period.',
                  style: ShadTheme.of(context).textTheme.muted,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 16, 8, 8),
      child: _RainfallChart(readings: state.readings),
    );
  }
}

// ── Chart ─────────────────────────────────────────────────────────────────────

const _kColorBar = Color(0xFF1E88E5);
const _kColorCumLine = Color(0xFFE53935);

class _RainfallChart extends StatelessWidget {
  const _RainfallChart({required this.readings});

  final List<RainfallReading> readings;

  double get _maxRainfall {
    double max = 0;
    for (final r in readings) {
      if (r.payload.rainfallMm > max) max = r.payload.rainfallMm;
    }
    return math.max(2.0, (max * 1.25).ceilToDouble());
  }

  double get _minCum => readings.first.payload.cumulativeRainfallMm;
  double get _maxCum => readings.last.payload.cumulativeRainfallMm;

  double _normalizeCum(double cum, double maxR) {
    final range = _maxCum - _minCum;
    if (range == 0) return 0;
    return (cum - _minCum) / range * maxR;
  }

  double _denormalize(double y, double maxR) {
    final range = _maxCum - _minCum;
    return _minCum + y / maxR * range;
  }

  /// At most 6 x-labels; snapped to nice hour intervals.
  double _xInterval() {
    final n = readings.length;
    final raw = n / 6.0;
    for (final step in [1, 2, 3, 4, 6, 8, 12, 24, 48, 72]) {
      if (raw <= step) return step.toDouble();
    }
    return ((raw / 24).ceil() * 24).toDouble();
  }

  String _label(DateTime dt) {
    if (readings.length <= 48) {
      return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    }
    return DateFormatter.toChartLabel(dt);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 9,
      color: ShadTheme.of(context).colorScheme.mutedForeground,
    );

    final n = readings.length;
    final maxR = _maxRainfall;
    final interval = _xInterval();

    // Rainfall as step-filled area (simulates bars, single coordinate system)
    final rainfallSpots = readings.asMap().entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.payload.rainfallMm))
        .toList();

    // Cumulative normalized to rainfall Y scale (same coordinate system)
    final cumulativeSpots = readings.asMap().entries
        .map((e) => FlSpot(
              e.key.toDouble(),
              _normalizeCum(e.value.payload.cumulativeRainfallMm, maxR),
            ))
        .toList();

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: (n - 1).toDouble(),
        minY: 0,
        maxY: maxR,
        clipData: const FlClipData.all(),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: maxR / 4,
          getDrawingHorizontalLine: (_) =>
              FlLine(color: Colors.grey.withValues(alpha: 0.15), strokeWidth: 1),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            axisNameWidget: Text('mm/h', style: textStyle),
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: maxR / 4,
              getTitlesWidget: (v, m) => Text(v.toStringAsFixed(1), style: textStyle),
            ),
          ),
          rightTitles: AxisTitles(
            axisNameWidget: Text('cum. mm', style: textStyle),
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 52,
              interval: maxR / 4,
              getTitlesWidget: (v, m) =>
                  Text(_denormalize(v, maxR).toStringAsFixed(0), style: textStyle),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: interval,
              getTitlesWidget: (v, meta) {
                if (v <= meta.min || v >= meta.max) return const SizedBox.shrink();
                final idx = v.toInt().clamp(0, n - 1);
                return SideTitleWidget(
                  meta: meta,
                  child: Text(_label(readings[idx].timestamp), style: textStyle),
                );
              },
            ),
          ),
        ),
        lineBarsData: [
          // ── Rainfall: step-filled area (looks like bars) ──────────────────
          LineChartBarData(
            spots: rainfallSpots,
            isStepLineChart: true,
            color: Colors.transparent,
            barWidth: 0,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: _kColorBar.withValues(alpha: 0.70),
            ),
          ),
          // ── Cumulative line ───────────────────────────────────────────────
          LineChartBarData(
            spots: cumulativeSpots,
            isCurved: true,
            curveSmoothness: 0.3,
            color: _kColorCumLine,
            barWidth: 2,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (spots) {
              return spots.map((s) {
                final idx = s.x.toInt().clamp(0, n - 1);
                final r = readings[idx];
                if (s.barIndex == 0) {
                  return LineTooltipItem(
                    '${_label(r.timestamp)}\n${r.payload.rainfallMm.toStringAsFixed(1)} mm/h',
                    TextStyle(color: _kColorBar, fontSize: 11),
                  );
                } else {
                  return LineTooltipItem(
                    'Cum: ${r.payload.cumulativeRainfallMm.toStringAsFixed(1)} mm',
                    TextStyle(color: _kColorCumLine, fontSize: 11),
                  );
                }
              }).toList();
            },
          ),
        ),
      ),
    );
  }
}

// ── Legend ────────────────────────────────────────────────────────────────────

class _Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Wrap(
        spacing: 16,
        runSpacing: 4,
        children: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            Container(width: 14, height: 14, color: _kColorBar.withValues(alpha: 0.75)),
            const SizedBox(width: 4),
            Text('Rainfall (mm/h)',
                style: TextStyle(fontSize: 11, color: ShadTheme.of(context).colorScheme.mutedForeground)),
          ]),
          Row(mainAxisSize: MainAxisSize.min, children: [
            Container(width: 20, height: 2, color: _kColorCumLine),
            const SizedBox(width: 4),
            Text('Cumulative (mm)',
                style: TextStyle(fontSize: 11, color: ShadTheme.of(context).colorScheme.mutedForeground)),
          ]),
        ],
      ),
    );
  }
}
