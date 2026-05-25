import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../data/mock/mock_data.dart';
import '../viewmodels/deep_displacement_view_model.dart';

class DeepDisplacementScreen extends ConsumerWidget {
  const DeepDisplacementScreen({super.key, required this.projectId, required this.sensorId});

  final String projectId;
  final String sensorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final state = ref.watch(deepDisplacementViewModelProvider(projectId: projectId, sensorId: sensorId));
    final notifier = ref.read(deepDisplacementViewModelProvider(projectId: projectId, sensorId: sensorId).notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Borehole Tilt', style: theme.textTheme.h4),
            Text(sensorId, style: theme.textTheme.muted),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ControlBar(notifier: notifier),
          Expanded(child: _Body(state: state)),
          _Legend(),
        ],
      ),
    );
  }
}

// ── Controls ──────────────────────────────────────────────────────────────────

class _ControlBar extends StatelessWidget {
  const _ControlBar({required this.notifier});

  final DeepDisplacementViewModel notifier;

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
          IconButton(
            icon: const Icon(LucideIcons.refreshCw, size: 16),
            tooltip: 'Refresh',
            onPressed: notifier.refresh,
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}

// ── Body ──────────────────────────────────────────────────────────────────────

class _Body extends StatelessWidget {
  const _Body({required this.state});
  final DeepChartState state;

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
              Icon(LucideIcons.arrowDownToLine, size: 48,
                  color: ShadTheme.of(context).colorScheme.mutedForeground),
              const SizedBox(height: 16),
              Text('No readings', style: ShadTheme.of(context).textTheme.h4),
              const SizedBox(height: 8),
              Text('No borehole tilt data available.',
                  style: ShadTheme.of(context).textTheme.muted,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
      child: _DeepDisplacementChart(readings: state.readings),
    );
  }
}

// ── Chart ─────────────────────────────────────────────────────────────────────

const _kColorCumulative = Color(0xFFE53935);
const _kColorTiltX = Color(0xFF1E88E5);
const _kColorTiltY = Color(0xFF43A047);

class _DeepDisplacementChart extends StatelessWidget {
  const _DeepDisplacementChart({required this.readings});

  final List<DeepDisplacementReading> readings;

  // Depth is Y axis (inverted: surface = top, bottom = deepest)
  // Displacement values are X axis

  double get _maxDepth =>
      readings.map((r) => r.payload.depthM).reduce((a, b) => a > b ? a : b);

  double get _minX {
    double min = double.infinity;
    for (final r in readings) {
      if (r.payload.tiltYMm < min) min = r.payload.tiltYMm;
    }
    return (min - 2).floorToDouble();
  }

  double get _maxX {
    double max = double.negativeInfinity;
    for (final r in readings) {
      if (r.payload.cumulativeTiltMm > max) max = r.payload.cumulativeTiltMm;
    }
    return (max + 5).ceilToDouble();
  }

  // depth → Y inverted: shallower depth = higher Y (closer to _maxDepth on the axis)
  // We flip by using (maxDepth - depth) as the Y spot value, then relabeling
  List<FlSpot> _spotsFor(double Function(DeepDisplacementReading) xFn) {
    return readings.map((r) => FlSpot(xFn(r), r.payload.depthM)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 9,
      color: ShadTheme.of(context).colorScheme.mutedForeground,
    );

    final maxDepth = _maxDepth;
    final minX = _minX;
    final maxX = _maxX;

    return LineChart(LineChartData(
      minX: minX,
      maxX: maxX,
      minY: 0,
      maxY: maxDepth,
      clipData: const FlClipData.all(),
      // Invert Y: surface (depth=0) at top, bottom (depth=maxDepth) at bottom
      // fl_chart draws minY at bottom by default, so surface (0) appears at bottom
      // We render depth values directly and label them inverted via getTitlesWidget
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        verticalInterval: 10,
        horizontalInterval: 2,
        getDrawingHorizontalLine: (_) =>
            FlLine(color: Colors.grey.withValues(alpha: 0.15), strokeWidth: 1),
        getDrawingVerticalLine: (_) =>
            FlLine(color: Colors.grey.withValues(alpha: 0.15), strokeWidth: 1),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
      ),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(
          axisNameWidget: Text('Surface', style: textStyle),
          sideTitles: const SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          axisNameWidget: Text('depth (m)', style: textStyle),
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 36,
            interval: 2,
            // Invert label: show (maxDepth - value) so surface=0 at top
            getTitlesWidget: (v, m) =>
                Text((maxDepth - v).toStringAsFixed(0), style: textStyle),
          ),
        ),
        bottomTitles: AxisTitles(
          axisNameWidget: Text('displacement (mm)', style: textStyle),
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            interval: 10,
            getTitlesWidget: (v, meta) {
              if (v == meta.min || v == meta.max) return const SizedBox.shrink();
              return SideTitleWidget(
                meta: meta,
                child: Text(v.toStringAsFixed(0), style: textStyle),
              );
            },
          ),
        ),
      ),
      // Zero reference line
      extraLinesData: ExtraLinesData(
        verticalLines: [
          VerticalLine(
            x: 0,
            color: Colors.grey.withValues(alpha: 0.5),
            strokeWidth: 1,
            dashArray: [4, 4],
          ),
        ],
      ),
      lineBarsData: [
        _bar(
          _spotsFor((r) => r.payload.cumulativeTiltMm),
          _kColorCumulative,
          showDots: true,
        ),
        _bar(
          _spotsFor((r) => r.payload.tiltXMm),
          _kColorTiltX,
          showDots: true,
        ),
        _bar(
          _spotsFor((r) => r.payload.tiltYMm),
          _kColorTiltY,
          showDots: true,
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (spots) => spots.map((s) {
            final depth = s.y;
            final labels = ['Cum.', 'Tilt X', 'Tilt Y'];
            final units = ['mm', 'mm', 'mm'];
            final idx = s.barIndex.clamp(0, labels.length - 1);
            return LineTooltipItem(
              '${depth.toStringAsFixed(1)} m depth\n'
              '${labels[idx]}: ${s.x.toStringAsFixed(2)} ${units[idx]}',
              TextStyle(color: s.bar.color, fontSize: 11),
            );
          }).toList(),
        ),
      ),
    ));
  }

  LineChartBarData _bar(List<FlSpot> spots, Color color, {bool showDots = false}) =>
      LineChartBarData(
        spots: spots,
        isCurved: true,
        curveSmoothness: 0.3,
        color: color,
        barWidth: 2,
        dotData: FlDotData(
          show: showDots,
          getDotPainter: (spot, pct, bar, idx) => FlDotCirclePainter(
            radius: 4,
            color: color,
            strokeColor: Colors.white,
            strokeWidth: 1.5,
          ),
        ),
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
          _LegendItem(color: _kColorCumulative, label: 'Cumulative (mm)'),
          _LegendItem(color: _kColorTiltX, label: 'Tilt X (mm)'),
          _LegendItem(color: _kColorTiltY, label: 'Tilt Y (mm)'),
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
