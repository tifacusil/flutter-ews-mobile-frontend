import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../core/utils/date_formatter.dart';
import '../../../data/mock/mock_data.dart';
import '../../../core/widgets/refresh_icon_button.dart';
import '../viewmodels/strain_view_model.dart';

class StrainScreen extends ConsumerWidget {
  const StrainScreen({super.key, required this.projectId, required this.sensorId});

  final String projectId;
  final String sensorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final state = ref.watch(strainViewModelProvider(projectId: projectId, sensorId: sensorId));
    final notifier = ref.read(strainViewModelProvider(projectId: projectId, sensorId: sensorId).notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Strain Gauge', style: theme.textTheme.h4),
            Text(sensorId, style: theme.textTheme.muted),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ControlBar(state: state, notifier: notifier),
          Expanded(child: _Body(state: state)),
          _Legend(showTemperature: state.showTemperature),
        ],
      ),
    );
  }
}

// ── Controls ──────────────────────────────────────────────────────────────────

class _ControlBar extends StatelessWidget {
  const _ControlBar({required this.state, required this.notifier});

  final StrainChartState state;
  final StrainViewModel notifier;

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
                _DropdownChip<StrainTimeRange>(
                  label: state.timeRange.label,
                  items: StrainTimeRange.values,
                  labelBuilder: (v) => v.label,
                  onSelected: notifier.selectRange,
                ),
                _ToggleChip(
                  label: 'Temperature',
                  active: state.showTemperature,
                  onTap: notifier.toggleTemperature,
                ),
                RefreshIconButton(
                  isLoading: state.isLoading,
                  onPressed: notifier.refresh,
                  size: 16,
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

class _ToggleChip extends StatelessWidget {
  const _ToggleChip({required this.label, required this.active, required this.onTap});

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: active ? theme.colorScheme.primary.withValues(alpha: 0.1) : null,
          border: Border.all(
            color: active ? theme.colorScheme.primary : theme.colorScheme.border,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: theme.textTheme.small.copyWith(
            color: active ? theme.colorScheme.primary : null,
          ),
        ),
      ),
    );
  }
}

// ── Body ──────────────────────────────────────────────────────────────────────

class _Body extends StatelessWidget {
  const _Body({required this.state});
  final StrainChartState state;

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
              Icon(LucideIcons.activity, size: 48,
                  color: ShadTheme.of(context).colorScheme.mutedForeground),
              const SizedBox(height: 16),
              Text('No readings', style: ShadTheme.of(context).textTheme.h4),
              const SizedBox(height: 8),
              Text('No strain data for the selected period.',
                  style: ShadTheme.of(context).textTheme.muted,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
      child: _StrainChart(
        readings: state.readings,
        showTemperature: state.showTemperature,
      ),
    );
  }
}

// ── Chart ─────────────────────────────────────────────────────────────────────

const _kColorStrain = Color(0xFF43A047);
const _kColorTemp = Color(0xFFFB8C00);
const _msPerDay = 86400000.0;

class _StrainChart extends StatelessWidget {
  const _StrainChart({required this.readings, required this.showTemperature});

  final List<StrainReading> readings;
  final bool showTemperature;

  FlSpot _spotStrain(StrainReading r) =>
      FlSpot(r.timestamp.millisecondsSinceEpoch / _msPerDay, r.payload.strainMicrostrain);

  FlSpot _spotTemp(StrainReading r) =>
      FlSpot(r.timestamp.millisecondsSinceEpoch / _msPerDay, r.payload.temperatureCelsius ?? 0);

  double get _minX => readings.first.timestamp.millisecondsSinceEpoch / _msPerDay;
  double get _maxX => readings.last.timestamp.millisecondsSinceEpoch / _msPerDay;

  double get _minY {
    double min = double.infinity;
    for (final r in readings) {
      min = math.min(min, r.payload.strainMicrostrain);
      if (showTemperature && r.payload.temperatureCelsius != null) {
        min = math.min(min, r.payload.temperatureCelsius!);
      }
    }
    return (min - 5).floorToDouble();
  }

  double get _maxY {
    double max = double.negativeInfinity;
    for (final r in readings) {
      max = math.max(max, r.payload.strainMicrostrain);
    }
    return (max + 10).ceilToDouble();
  }

  double get _xInterval {
    final range = _maxX - _minX;
    if (range <= 35) return 7;
    if (range <= 95) return 14;
    return 30;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 9,
      color: ShadTheme.of(context).colorScheme.mutedForeground,
    );

    final bars = <LineChartBarData>[
      LineChartBarData(
        spots: readings.map(_spotStrain).toList(),
        isCurved: true,
        curveSmoothness: 0.2,
        color: _kColorStrain,
        barWidth: 1.8,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
      ),
    ];

    if (showTemperature) {
      bars.add(LineChartBarData(
        spots: readings.map(_spotTemp).toList(),
        isCurved: true,
        curveSmoothness: 0.2,
        color: _kColorTemp,
        barWidth: 1.8,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        dashArray: [4, 3],
      ));
    }

    return LineChart(LineChartData(
      minX: _minX,
      maxX: _maxX,
      minY: _minY,
      maxY: _maxY,
      clipData: const FlClipData.all(),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 20,
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
          axisNameWidget: Text('µε / °C', style: textStyle),
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 46,
            interval: 20,
            getTitlesWidget: (v, m) => Text(v.toStringAsFixed(0), style: textStyle),
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
      lineBarsData: bars,
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (spots) => spots.map((s) {
            final date = DateTime.fromMillisecondsSinceEpoch((s.x * _msPerDay).toInt());
            final isTemp = s.barIndex == 1;
            final unit = isTemp ? '°C' : 'µε';
            return LineTooltipItem(
              '${DateFormatter.toChartLabel(date)}\n${s.y.toStringAsFixed(1)} $unit',
              TextStyle(color: s.bar.color, fontSize: 11),
            );
          }).toList(),
        ),
      ),
    ));
  }
}

// ── Legend ────────────────────────────────────────────────────────────────────

class _Legend extends StatelessWidget {
  const _Legend({required this.showTemperature});

  final bool showTemperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Wrap(
        spacing: 16,
        runSpacing: 4,
        children: [
          _LegendLine(color: _kColorStrain, label: 'Strain (µε)'),
          if (showTemperature) _LegendLine(color: _kColorTemp, label: 'Temperature (°C)', dashed: true),
        ],
      ),
    );
  }
}

class _LegendLine extends StatelessWidget {
  const _LegendLine({required this.color, required this.label, this.dashed = false});

  final Color color;
  final String label;
  final bool dashed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 20,
          height: 10,
          child: dashed
              ? CustomPaint(painter: _DashPainter(color))
              : Align(
                  alignment: Alignment.center,
                  child: Container(width: 20, height: 2, color: color),
                ),
        ),
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

class _DashPainter extends CustomPainter {
  _DashPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color..strokeWidth = 2;
    double x = 0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, size.height / 2), Offset(x + 4, size.height / 2), paint);
      x += 7;
    }
  }

  @override
  bool shouldRepaint(_DashPainter old) => old.color != color;
}
