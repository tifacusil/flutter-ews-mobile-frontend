import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../core/utils/date_formatter.dart';
import '../../../data/mock/mock_data.dart';
import '../viewmodels/gnss_view_model.dart';

class GnssScreen extends ConsumerWidget {
  const GnssScreen({super.key, required this.projectId, required this.sensorId});

  final String projectId;
  final String sensorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final state = ref.watch(gnssViewModelProvider(projectId: projectId, sensorId: sensorId));
    final notifier = ref.read(gnssViewModelProvider(projectId: projectId, sensorId: sensorId).notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Surface Displacement', style: theme.textTheme.h4),
            Text(sensorId, style: theme.textTheme.muted),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ControlBar(state: state, notifier: notifier),
          Expanded(
            child: state.readings.isEmpty
                ? const Center(child: Text('No data'))
                : Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
                    child: _GnssLineChart(readings: state.readings),
                  ),
          ),
          _Legend(),
        ],
      ),
    );
  }
}

// ── Controls ──────────────────────────────────────────────────────────────────

class _ControlBar extends StatelessWidget {
  const _ControlBar({required this.state, required this.notifier});

  final GnssChartState state;
  final GnssViewModel notifier;

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
                _DropdownChip<GnssTimeRange>(
                  label: state.timeRange.label,
                  items: GnssTimeRange.values,
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

// ── Chart ─────────────────────────────────────────────────────────────────────

const _kColorDx = Color(0xFF1E88E5);
const _kColorDy = Color(0xFF43A047);
const _kColorDh = Color(0xFFFB8C00);
const _kColorCum = Color(0xFFE53935);
const _msPerDay = 86400000.0;

class _GnssLineChart extends StatelessWidget {
  const _GnssLineChart({required this.readings});

  final List<GnssReading> readings;

  List<GnssReading> get _fixed =>
      readings.where((r) => r.payload.fixQuality == 'rtk_fixed').toList();

  FlSpot _spot(GnssReading r, double Function(GnssReading) val) =>
      FlSpot(r.timestamp.millisecondsSinceEpoch / _msPerDay, val(r));

  double get _minX => _fixed.first.timestamp.millisecondsSinceEpoch / _msPerDay;
  double get _maxX => _fixed.last.timestamp.millisecondsSinceEpoch / _msPerDay;

  double get _minY {
    double min = double.infinity;
    for (final r in _fixed) {
      min = math.min(min, r.payload.displacementYMm);
    }
    return (min - 5).floorToDouble();
  }

  double get _maxY {
    double max = double.negativeInfinity;
    for (final r in _fixed) {
      max = math.max(max, r.payload.cumulativeDisplacementMm);
    }
    return (max + 20).ceilToDouble();
  }

  double get _xInterval {
    final range = _maxX - _minX;
    if (range <= 35) return 7;
    if (range <= 95) return 14;
    return 30;
  }

  @override
  Widget build(BuildContext context) {
    if (_fixed.isEmpty) return const Center(child: Text('No RTK-fixed readings'));
    final textStyle = TextStyle(
      fontSize: 9,
      color: ShadTheme.of(context).colorScheme.mutedForeground,
    );

    return LineChart(LineChartData(
      minX: _minX,
      maxX: _maxX,
      minY: _minY,
      maxY: _maxY,
      clipData: const FlClipData.all(),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 100,
        getDrawingHorizontalLine: (_) =>
            FlLine(color: Colors.grey.withValues(alpha: 0.15), strokeWidth: 1),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
      ),
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          axisNameWidget: Text('mm', style: textStyle),
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 42,
            interval: 100,
            getTitlesWidget: (v, m) => Text(v.toInt().toString(), style: textStyle),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 24,
            interval: _xInterval,
            getTitlesWidget: (v, meta) {
              if (v == meta.min || v == meta.max) return const SizedBox.shrink();
              final date = DateTime.fromMillisecondsSinceEpoch((v * _msPerDay).toInt());
              return SideTitleWidget(
                meta: meta,
                child: Text(DateFormatter.toChartLabel(date), style: textStyle),
              );
            },
          ),
        ),
      ),
      lineBarsData: [
        _bar(_fixed.map((r) => _spot(r, (g) => g.payload.displacementXMm)).toList(), _kColorDx),
        _bar(_fixed.map((r) => _spot(r, (g) => g.payload.displacementYMm)).toList(), _kColorDy),
        _bar(_fixed.map((r) => _spot(r, (g) => g.payload.displacementHorizontalMm)).toList(), _kColorDh),
        _bar(_fixed.map((r) => _spot(r, (g) => g.payload.cumulativeDisplacementMm)).toList(), _kColorCum),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (spots) => spots.map((s) {
            final date = DateTime.fromMillisecondsSinceEpoch((s.x * _msPerDay).toInt());
            return LineTooltipItem(
              '${DateFormatter.toChartLabel(date)}\n${s.y.toStringAsFixed(1)} mm',
              TextStyle(color: s.bar.color, fontSize: 11),
            );
          }).toList(),
        ),
      ),
    ));
  }

  LineChartBarData _bar(List<FlSpot> spots, Color color) => LineChartBarData(
        spots: spots,
        isCurved: true,
        curveSmoothness: 0.2,
        color: color,
        barWidth: 1.8,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
      );
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
        children: const [
          _LegendItem(color: _kColorDx, label: 'Dx'),
          _LegendItem(color: _kColorDy, label: 'Dy'),
          _LegendItem(color: _kColorDh, label: 'Dh'),
          _LegendItem(color: _kColorCum, label: 'Cum.'),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 20, height: 2, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: ShadTheme.of(context).colorScheme.mutedForeground,
          ),
        ),
      ],
    );
  }
}
