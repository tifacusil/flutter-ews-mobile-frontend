import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../core/models/analysis_models.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/refresh_icon_button.dart';
import '../viewmodels/analysis_view_model.dart';

// ── Screen ────────────────────────────────────────────────────────────────────

class AnalysisScreen extends ConsumerWidget {
  const AnalysisScreen({
    super.key,
    required this.projectId,
    required this.sensorId,
    required this.sensorType,
  });

  final String projectId;
  final String sensorId;
  final String sensorType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final state = ref.watch(analysisViewModelProvider(
      projectId: projectId,
      sensorId: sensorId,
      sensorType: sensorType,
    ));
    final notifier = ref.read(analysisViewModelProvider(
      projectId: projectId,
      sensorId: sensorId,
      sensorType: sensorType,
    ).notifier);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(LucideIcons.arrowLeft),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Data Analysis', style: theme.textTheme.h4),
              Text(sensorId, style: theme.textTheme.muted),
            ],
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Outliers'),
              Tab(text: 'Denoise'),
              Tab(text: 'Regression'),
              Tab(text: 'Predict'),
            ],
          ),
        ),
        body: Column(
          children: [
            _DataBar(state: state, notifier: notifier),
            Expanded(
              child: TabBarView(
                children: [
                  _OutliersTab(state: state, notifier: notifier),
                  _DenoiseTab(state: state, notifier: notifier),
                  _RegressionTab(state: state, notifier: notifier),
                  _PredictTab(state: state, notifier: notifier),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Data status bar ───────────────────────────────────────────────────────────

class _DataBar extends StatelessWidget {
  const _DataBar({required this.state, required this.notifier});

  final AnalysisState state;
  final AnalysisViewModel notifier;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    Widget content;
    if (state.isLoadingData) {
      content = Row(
        children: [
          const SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: 8),
          Text('Loading readings…', style: theme.textTheme.small),
        ],
      );
    } else if (state.dataError != null) {
      content = Row(
        children: [
          Icon(LucideIcons.circleAlert,
              size: 14, color: theme.colorScheme.destructive),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              state.dataError!,
              style:
                  theme.textTheme.small.copyWith(color: theme.colorScheme.destructive),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    } else {
      content = Row(
        children: [
          Icon(LucideIcons.database,
              size: 14, color: theme.colorScheme.mutedForeground),
          const SizedBox(width: 8),
          Text(
            '${state.values.length} readings loaded',
            style: theme.textTheme.small,
          ),
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.muted,
        border: Border(bottom: BorderSide(color: theme.colorScheme.border)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(child: content),
          const SizedBox(width: 8),
          _DropdownChip<AnalysisTimeRange>(
            label: state.timeRange.label,
            items: AnalysisTimeRange.values,
            labelBuilder: (v) => v.label,
            onSelected: notifier.selectTimeRange,
          ),
          const SizedBox(width: 6),
          RefreshIconButton(
            isLoading: state.isLoadingData,
            onPressed: notifier.refresh,
            size: 14,
          ),
        ],
      ),
    );
  }
}

// ── Shared dropdown chip ──────────────────────────────────────────────────────

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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.border),
          borderRadius: BorderRadius.circular(6),
          color: theme.colorScheme.background,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: theme.textTheme.small),
            const SizedBox(width: 4),
            Icon(LucideIcons.chevronsUpDown,
                size: 11, color: theme.colorScheme.mutedForeground),
          ],
        ),
      ),
    );
  }
}

// ── Shared run button ─────────────────────────────────────────────────────────

class _RunButton extends StatelessWidget {
  const _RunButton({
    required this.label,
    required this.onPressed,
    required this.isRunning,
    required this.enabled,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isRunning;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      onPressed: enabled && !isRunning ? onPressed : null,
      child: isRunning
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(label),
    );
  }
}

// ── No-data placeholder ───────────────────────────────────────────────────────

class _NoDataPlaceholder extends StatelessWidget {
  const _NoDataPlaceholder();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.chartNoAxesColumn,
                size: 40, color: theme.colorScheme.mutedForeground),
            const SizedBox(height: 12),
            Text('No data loaded', style: theme.textTheme.h4),
            const SizedBox(height: 6),
            Text(
              'Select a time range and wait for readings to load.',
              style: theme.textTheme.muted,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Error card ────────────────────────────────────────────────────────────────

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ShadCard(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(LucideIcons.circleAlert,
                  size: 18, color: theme.colorScheme.destructive),
              const SizedBox(width: 10),
              Expanded(
                child: Text(message,
                    style: theme.textTheme.small
                        .copyWith(color: theme.colorScheme.destructive)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Tab 1 — Outliers
// ═══════════════════════════════════════════════════════════════════════════════

class _OutliersTab extends StatelessWidget {
  const _OutliersTab({required this.state, required this.notifier});

  final AnalysisState state;
  final AnalysisViewModel notifier;

  static const _methods = ['3sigma', 'iqr', 'chauvenet'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionLabel(label: 'Method'),
        const SizedBox(height: 6),
        Row(
          children: [
            _DropdownChip<String>(
              label: state.outliersMethod,
              items: _methods,
              labelBuilder: (v) => v,
              onSelected: notifier.setOutliersMethod,
            ),
            const Spacer(),
            _RunButton(
              label: 'Detect Outliers',
              onPressed: notifier.runOutliers,
              isRunning: state.isRunningOutliers,
              enabled: state.hasData,
            ),
          ],
        ),
        if (state.outliersError != null) ...[
          const SizedBox(height: 12),
          _ErrorCard(message: state.outliersError!),
        ],
        if (state.outliersResult != null) ...[
          const SizedBox(height: 16),
          _OutliersChart(
            values: state.values,
            timestamps: state.timestamps,
            result: state.outliersResult!,
          ),
          const SizedBox(height: 16),
          _OutliersStatsCard(result: state.outliersResult!),
          const SizedBox(height: 16),
          _OutliersList(result: state.outliersResult!),
        ],
        if (!state.hasData && state.outliersResult == null && state.outliersError == null)
          const Padding(
            padding: EdgeInsets.only(top: 48),
            child: _NoDataPlaceholder(),
          ),
      ],
    );
  }
}

class _OutliersChart extends StatelessWidget {
  const _OutliersChart({
    required this.values,
    required this.timestamps,
    required this.result,
  });

  final List<double> values;
  final List<String> timestamps;
  final OutliersResult result;

  static const _msPerDay = 86400000.0;

  @override
  Widget build(BuildContext context) {
    final outlierIndices = result.outliers.map((o) => o.index).toSet();
    final theme = ShadTheme.of(context);
    final textStyle = TextStyle(
      fontSize: 9,
      color: theme.colorScheme.mutedForeground,
    );

    final spots = <FlSpot>[];
    for (var i = 0; i < values.length; i++) {
      final ts = DateTime.tryParse(timestamps[i]);
      if (ts != null) {
        spots.add(FlSpot(ts.millisecondsSinceEpoch / _msPerDay, values[i]));
      }
    }

    if (spots.isEmpty) return const SizedBox.shrink();

    final minX = spots.first.x;
    final maxX = spots.last.x;
    final allY = spots.map((s) => s.y).toList()..sort();
    final minY = (allY.first - (allY.last - allY.first) * 0.1).floorToDouble();
    final maxY = (allY.last + (allY.last - allY.first) * 0.1).ceilToDouble();

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
        child: SizedBox(
          height: 220,
          child: LineChart(LineChartData(
            minX: minX,
            maxX: maxX,
            minY: minY,
            maxY: maxY,
            clipData: const FlClipData.all(),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
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
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 44,
                  getTitlesWidget: (v, _) =>
                      Text(v.toStringAsFixed(1), style: textStyle),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 24,
                  interval: math.max(1, ((maxX - minX) / 5).roundToDouble()),
                  getTitlesWidget: (v, meta) {
                    if (v == meta.min || v == meta.max) return const SizedBox.shrink();
                    final date = DateTime.fromMillisecondsSinceEpoch(
                        (v * _msPerDay).toInt());
                    return SideTitleWidget(
                      meta: meta,
                      child: Text(DateFormatter.toChartLabel(date), style: textStyle),
                    );
                  },
                ),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: false,
                color: const Color(0xFF1E88E5),
                barWidth: 1.5,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, pct, bar, i) {
                    final isOutlier = outlierIndices.contains(i);
                    return FlDotCirclePainter(
                      radius: isOutlier ? 5 : 2,
                      color: isOutlier
                          ? const Color(0xFFE53935)
                          : Colors.transparent,
                      strokeWidth: isOutlier ? 0 : 1,
                      strokeColor: const Color(0xFF1E88E5),
                    );
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class _OutliersStatsCard extends StatelessWidget {
  const _OutliersStatsCard({required this.result});

  final OutliersResult result;

  @override
  Widget build(BuildContext context) {
    final s = result.statistics;
    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _StatItem(label: 'Mean', value: s.mean.toStringAsFixed(2)),
            _StatItem(label: 'Std Dev', value: s.std.toStringAsFixed(2)),
            _StatItem(label: 'N', value: s.n.toString()),
            _StatItem(
              label: 'Outliers',
              value: s.outlierCount.toString(),
              highlight: s.outlierCount > 0,
            ),
          ],
        ),
      ),
    );
  }
}

class _OutliersList extends StatelessWidget {
  const _OutliersList({required this.result});

  final OutliersResult result;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    if (result.outliers.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.circleCheck,
                  size: 16, color: theme.colorScheme.primary),
              const SizedBox(width: 6),
              Text('No outliers detected', style: theme.textTheme.small),
            ],
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Outlier details', style: theme.textTheme.small),
        const SizedBox(height: 8),
        ...result.outliers.map((o) => _OutlierTile(item: o)),
      ],
    );
  }
}

class _OutlierTile extends StatelessWidget {
  const _OutlierTile({required this.item});

  final OutlierItem item;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final ts = DateTime.tryParse(item.timestamp);
    final label = ts != null ? DateFormatter.toChartLabel(ts) : item.timestamp;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ShadCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFE53935),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Index ${item.index}  ·  $label',
                        style: theme.textTheme.small),
                    if (item.criterion != null)
                      Text(item.criterion!,
                          style: theme.textTheme.muted),
                  ],
                ),
              ),
              Text(
                item.value.toStringAsFixed(3),
                style: theme.textTheme.small.copyWith(
                  color: theme.colorScheme.destructive,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Tab 2 — Denoise
// ═══════════════════════════════════════════════════════════════════════════════

class _DenoiseTab extends StatelessWidget {
  const _DenoiseTab({required this.state, required this.notifier});

  final AnalysisState state;
  final AnalysisViewModel notifier;

  static const _methods = ['wavelet', 'emd', 'svm'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionLabel(label: 'Method'),
        const SizedBox(height: 6),
        Row(
          children: [
            _DropdownChip<String>(
              label: state.denoiseMethod,
              items: _methods,
              labelBuilder: (v) => v,
              onSelected: notifier.setDenoiseMethod,
            ),
            const Spacer(),
            _RunButton(
              label: 'Denoise',
              onPressed: notifier.runDenoise,
              isRunning: state.isRunningDenoise,
              enabled: state.hasData,
            ),
          ],
        ),
        if (state.denoiseError != null) ...[
          const SizedBox(height: 12),
          _ErrorCard(message: state.denoiseError!),
        ],
        if (state.denoiseResult != null) ...[
          const SizedBox(height: 16),
          _DenoiseChart(
            values: state.values,
            timestamps: state.timestamps,
            result: state.denoiseResult!,
          ),
          const SizedBox(height: 16),
          _DenoiseParamsCard(result: state.denoiseResult!),
          const SizedBox(height: 8),
          _ChartLegend(items: const [
            (color: Color(0xFFBDBDBD), label: 'Original'),
            (color: Color(0xFF1E88E5), label: 'Denoised'),
          ]),
        ],
        if (!state.hasData && state.denoiseResult == null && state.denoiseError == null)
          const Padding(
            padding: EdgeInsets.only(top: 48),
            child: _NoDataPlaceholder(),
          ),
      ],
    );
  }
}

class _DenoiseChart extends StatelessWidget {
  const _DenoiseChart({
    required this.values,
    required this.timestamps,
    required this.result,
  });

  final List<double> values;
  final List<String> timestamps;
  final DenoiseResult result;

  static const _msPerDay = 86400000.0;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final textStyle = TextStyle(fontSize: 9, color: theme.colorScheme.mutedForeground);

    final xValues = timestamps.map((t) {
      final ts = DateTime.tryParse(t);
      return ts != null ? ts.millisecondsSinceEpoch / _msPerDay : 0.0;
    }).toList();

    if (xValues.isEmpty) return const SizedBox.shrink();

    final original = [for (var i = 0; i < values.length; i++) FlSpot(xValues[i], values[i])];
    final denoised = [
      for (var i = 0; i < result.denoisedValues.length && i < xValues.length; i++)
        FlSpot(xValues[i], result.denoisedValues[i])
    ];

    final allY = [...values, ...result.denoisedValues]..sort();
    final range = (allY.last - allY.first).clamp(1.0, double.infinity);
    final minY = (allY.first - range * 0.08).floorToDouble();
    final maxY = (allY.last + range * 0.08).ceilToDouble();
    final minX = xValues.first;
    final maxX = xValues.last;

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
        child: SizedBox(
          height: 220,
          child: LineChart(LineChartData(
            minX: minX, maxX: maxX, minY: minY, maxY: maxY,
            clipData: const FlClipData.all(),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (_) =>
                  FlLine(color: Colors.grey.withValues(alpha: 0.15), strokeWidth: 1),
            ),
            borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey.withValues(alpha: 0.3))),
            titlesData: _defaultTitles(textStyle, minX, maxX),
            lineBarsData: [
              LineChartBarData(
                spots: original,
                isCurved: false,
                color: const Color(0xFFBDBDBD),
                barWidth: 1,
                dotData: const FlDotData(show: false),
              ),
              LineChartBarData(
                spots: denoised,
                isCurved: true,
                curveSmoothness: 0.3,
                color: const Color(0xFF1E88E5),
                barWidth: 2,
                dotData: const FlDotData(show: false),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class _DenoiseParamsCard extends StatelessWidget {
  const _DenoiseParamsCard({required this.result});

  final DenoiseResult result;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final entries = result.params.entries
        .where((e) => e.value is num || e.value is String)
        .take(6)
        .toList();

    if (entries.isEmpty) return const SizedBox.shrink();

    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Parameters (${result.method})', style: theme.textTheme.small),
            const SizedBox(height: 8),
            Wrap(
              spacing: 16,
              runSpacing: 4,
              children: entries.map((e) {
                final val = e.value is double
                    ? (e.value as double).toStringAsFixed(3)
                    : e.value.toString();
                return _StatItem(label: e.key, value: val);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Tab 3 — Regression
// ═══════════════════════════════════════════════════════════════════════════════

class _RegressionTab extends StatelessWidget {
  const _RegressionTab({required this.state, required this.notifier});

  final AnalysisState state;
  final AnalysisViewModel notifier;

  static const _models = ['polynomial', 'bayesian'];
  static const _degrees = [2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionLabel(label: 'Model'),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _DropdownChip<String>(
              label: state.regressionModel,
              items: _models,
              labelBuilder: (v) => v,
              onSelected: notifier.setRegressionModel,
            ),
            if (state.regressionModel == 'polynomial')
              _DropdownChip<int>(
                label: 'Degree ${state.regressionDegree}',
                items: _degrees,
                labelBuilder: (v) => 'Degree $v',
                onSelected: notifier.setRegressionDegree,
              ),
            _RunButton(
              label: 'Fit Regression',
              onPressed: notifier.runRegression,
              isRunning: state.isRunningRegression,
              enabled: state.hasData,
            ),
          ],
        ),
        if (state.regressionError != null) ...[
          const SizedBox(height: 12),
          _ErrorCard(message: state.regressionError!),
        ],
        if (state.regressionResult != null) ...[
          const SizedBox(height: 16),
          _RegressionChart(
            values: state.values,
            timestamps: state.timestamps,
            result: state.regressionResult!,
          ),
          const SizedBox(height: 16),
          _RegressionMetricsCard(result: state.regressionResult!),
          const SizedBox(height: 8),
          _ChartLegend(items: const [
            (color: Color(0xFFBDBDBD), label: 'Original'),
            (color: Color(0xFF43A047), label: 'Fitted'),
          ]),
        ],
        if (!state.hasData && state.regressionResult == null && state.regressionError == null)
          const Padding(
            padding: EdgeInsets.only(top: 48),
            child: _NoDataPlaceholder(),
          ),
      ],
    );
  }
}

class _RegressionChart extends StatelessWidget {
  const _RegressionChart({
    required this.values,
    required this.timestamps,
    required this.result,
  });

  final List<double> values;
  final List<String> timestamps;
  final RegressionResult result;

  static const _msPerDay = 86400000.0;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final textStyle = TextStyle(fontSize: 9, color: theme.colorScheme.mutedForeground);

    final xValues = timestamps.map((t) {
      final ts = DateTime.tryParse(t);
      return ts != null ? ts.millisecondsSinceEpoch / _msPerDay : 0.0;
    }).toList();

    if (xValues.isEmpty) return const SizedBox.shrink();

    final original = [for (var i = 0; i < values.length; i++) FlSpot(xValues[i], values[i])];
    final fitted = [
      for (var i = 0; i < result.fittedValues.length && i < xValues.length; i++)
        FlSpot(xValues[i], result.fittedValues[i])
    ];

    final allY = [...values, ...result.fittedValues]..sort();
    final range = (allY.last - allY.first).clamp(1.0, double.infinity);
    final minY = (allY.first - range * 0.08).floorToDouble();
    final maxY = (allY.last + range * 0.08).ceilToDouble();

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
        child: SizedBox(
          height: 220,
          child: LineChart(LineChartData(
            minX: xValues.first, maxX: xValues.last,
            minY: minY, maxY: maxY,
            clipData: const FlClipData.all(),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (_) =>
                  FlLine(color: Colors.grey.withValues(alpha: 0.15), strokeWidth: 1),
            ),
            borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey.withValues(alpha: 0.3))),
            titlesData: _defaultTitles(textStyle, xValues.first, xValues.last),
            lineBarsData: [
              LineChartBarData(
                spots: original,
                isCurved: false,
                color: const Color(0xFFBDBDBD),
                barWidth: 1,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, p, bar, i) => FlDotCirclePainter(
                    radius: 2,
                    color: const Color(0xFF9E9E9E),
                    strokeWidth: 0,
                    strokeColor: Colors.transparent,
                  ),
                ),
              ),
              LineChartBarData(
                spots: fitted,
                isCurved: true,
                curveSmoothness: 0.35,
                color: const Color(0xFF43A047),
                barWidth: 2.5,
                dotData: const FlDotData(show: false),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class _RegressionMetricsCard extends StatelessWidget {
  const _RegressionMetricsCard({required this.result});

  final RegressionResult result;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _StatItem(
              label: 'R² score',
              value: result.r2Score.toStringAsFixed(4),
              highlight: result.r2Score > 0.9,
            ),
            _StatItem(label: 'Model', value: result.model),
            if (result.degree != null)
              _StatItem(label: 'Degree', value: result.degree.toString()),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Tab 4 — Predict
// ═══════════════════════════════════════════════════════════════════════════════

class _PredictTab extends StatelessWidget {
  const _PredictTab({required this.state, required this.notifier});

  final AnalysisState state;
  final AnalysisViewModel notifier;

  static const _models = ['arima', 'gm11'];
  static const _horizons = [3, 7, 14, 30, 60, 90];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionLabel(label: 'Model & Horizon'),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _DropdownChip<String>(
              label: state.predictModel,
              items: _models,
              labelBuilder: (v) => v.toUpperCase(),
              onSelected: notifier.setPredictModel,
            ),
            _DropdownChip<int>(
              label: '${state.predictHorizon} steps',
              items: _horizons,
              labelBuilder: (v) => '$v steps',
              onSelected: notifier.setPredictHorizon,
            ),
            _RunButton(
              label: 'Forecast',
              onPressed: notifier.runPredict,
              isRunning: state.isRunningPredict,
              enabled: state.hasData,
            ),
          ],
        ),
        if (state.predictModel == 'arima') ...[
          const SizedBox(height: 12),
          _ArimaOrderRow(order: state.arimaOrder, onChanged: notifier.setArimaOrder),
        ],
        if (state.predictError != null) ...[
          const SizedBox(height: 12),
          _ErrorCard(message: state.predictError!),
        ],
        if (state.predictResult != null) ...[
          const SizedBox(height: 16),
          _PredictChart(
            values: state.values,
            timestamps: state.timestamps,
            result: state.predictResult!,
          ),
          const SizedBox(height: 8),
          _ChartLegend(items: [
            const (color: Color(0xFF1E88E5), label: 'Historical'),
            const (color: Color(0xFFFB8C00), label: 'Forecast'),
            if (state.predictResult!.confidenceLower != null)
              (
                color: const Color(0xFFFB8C00).withValues(alpha: 0.25),
                label: '95% CI'
              ),
          ]),
          const SizedBox(height: 16),
          _PredictMetricsCard(result: state.predictResult!),
        ],
        if (!state.hasData && state.predictResult == null && state.predictError == null)
          const Padding(
            padding: EdgeInsets.only(top: 48),
            child: _NoDataPlaceholder(),
          ),
      ],
    );
  }
}

class _ArimaOrderRow extends StatelessWidget {
  const _ArimaOrderRow({required this.order, required this.onChanged});

  final List<int> order;
  final void Function(List<int>) onChanged;

  static const _values = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Row(
      children: [
        Text('ARIMA order (p, d, q):', style: theme.textTheme.small),
        const SizedBox(width: 8),
        ...['p', 'd', 'q'].asMap().entries.map((entry) {
          final idx = entry.key;
          final label = entry.value;
          return Padding(
            padding: const EdgeInsets.only(right: 6),
            child: _DropdownChip<int>(
              label: '$label=${order[idx]}',
              items: _values,
              labelBuilder: (v) => '$label=$v',
              onSelected: (v) {
                final updated = List<int>.from(order);
                updated[idx] = v;
                onChanged(updated);
              },
            ),
          );
        }),
      ],
    );
  }
}

class _PredictChart extends StatelessWidget {
  const _PredictChart({
    required this.values,
    required this.timestamps,
    required this.result,
  });

  final List<double> values;
  final List<String> timestamps;
  final PredictResult result;

  static const _msPerDay = 86400000.0;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final textStyle = TextStyle(fontSize: 9, color: theme.colorScheme.mutedForeground);

    final histX = timestamps.map((t) {
      final ts = DateTime.tryParse(t);
      return ts != null ? ts.millisecondsSinceEpoch / _msPerDay : 0.0;
    }).toList();

    final predX = result.predictedTimestamps.map((t) {
      final ts = DateTime.tryParse(t);
      return ts != null ? ts.millisecondsSinceEpoch / _msPerDay : 0.0;
    }).toList();

    if (histX.isEmpty || predX.isEmpty) return const SizedBox.shrink();

    final histSpots = [for (var i = 0; i < values.length; i++) FlSpot(histX[i], values[i])];
    final predSpots = [
      for (var i = 0; i < result.predictedValues.length; i++)
        FlSpot(predX[i], result.predictedValues[i])
    ];
    final lowerSpots = result.confidenceLower != null
        ? [for (var i = 0; i < result.confidenceLower!.length; i++) FlSpot(predX[i], result.confidenceLower![i])]
        : <FlSpot>[];
    final upperSpots = result.confidenceUpper != null
        ? [for (var i = 0; i < result.confidenceUpper!.length; i++) FlSpot(predX[i], result.confidenceUpper![i])]
        : <FlSpot>[];

    final allY = [
      ...values,
      ...result.predictedValues,
      if (result.confidenceLower != null) ...result.confidenceLower!,
      if (result.confidenceUpper != null) ...result.confidenceUpper!,
    ]..sort();
    final range = (allY.last - allY.first).clamp(1.0, double.infinity);
    final minY = (allY.first - range * 0.08).floorToDouble();
    final maxY = (allY.last + range * 0.08).ceilToDouble();
    final minX = histX.first;
    final maxX = predX.last;

    final hasBand = lowerSpots.isNotEmpty && upperSpots.isNotEmpty;
    final lineBars = <LineChartBarData>[
      if (hasBand) ...[
        LineChartBarData(
          spots: lowerSpots,
          color: Colors.transparent,
          barWidth: 0,
          dotData: const FlDotData(show: false),
        ),
        LineChartBarData(
          spots: upperSpots,
          color: Colors.transparent,
          barWidth: 0,
          dotData: const FlDotData(show: false),
        ),
      ],
      LineChartBarData(
        spots: histSpots,
        isCurved: false,
        color: const Color(0xFF1E88E5),
        barWidth: 1.5,
        dotData: const FlDotData(show: false),
      ),
      LineChartBarData(
        spots: predSpots,
        isCurved: true,
        curveSmoothness: 0.3,
        color: const Color(0xFFFB8C00),
        barWidth: 2,
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, pct, bar, i) => FlDotCirclePainter(
            radius: 3,
            color: const Color(0xFFFB8C00),
            strokeWidth: 0,
            strokeColor: Colors.transparent,
          ),
        ),
      ),
    ];

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
        child: SizedBox(
          height: 240,
          child: LineChart(LineChartData(
            minX: minX, maxX: maxX, minY: minY, maxY: maxY,
            clipData: const FlClipData.all(),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (_) =>
                  FlLine(color: Colors.grey.withValues(alpha: 0.15), strokeWidth: 1),
            ),
            borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey.withValues(alpha: 0.3))),
            titlesData: _defaultTitles(textStyle, minX, maxX),
            lineBarsData: lineBars,
            betweenBarsData: hasBand
                ? [
                    BetweenBarsData(
                      fromIndex: 0,
                      toIndex: 1,
                      color: const Color(0xFFFB8C00).withValues(alpha: 0.15),
                    ),
                  ]
                : [],
            extraLinesData: ExtraLinesData(
              verticalLines: [
                VerticalLine(
                  x: histX.last,
                  color: Colors.grey.withValues(alpha: 0.5),
                  strokeWidth: 1,
                  dashArray: [4, 4],
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class _PredictMetricsCard extends StatelessWidget {
  const _PredictMetricsCard({required this.result});

  final PredictResult result;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _StatItem(label: 'Model', value: result.model.toUpperCase()),
            _StatItem(label: 'Horizon', value: '${result.horizon} steps'),
            if (result.order != null)
              _StatItem(label: 'Order', value: '(${result.order!.join(', ')})'),
            _StatItem(
              label: 'Confidence',
              value: result.confidenceLower != null ? '95%' : 'N/A',
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Shared small widgets
// ═══════════════════════════════════════════════════════════════════════════════

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Text(
      label,
      style: theme.textTheme.small.copyWith(
        color: theme.colorScheme.mutedForeground,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.label, required this.value, this.highlight = false});

  final String label;
  final String value;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: theme.textTheme.muted),
        const SizedBox(height: 2),
        Text(
          value,
          style: theme.textTheme.small.copyWith(
            fontWeight: FontWeight.w600,
            color: highlight ? theme.colorScheme.primary : null,
          ),
        ),
      ],
    );
  }
}

class _ChartLegend extends StatelessWidget {
  const _ChartLegend({required this.items});

  final List<({Color color, String label})> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Wrap(
        spacing: 16,
        runSpacing: 4,
        children: items
            .map((item) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 3,
                      decoration: BoxDecoration(
                        color: item.color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 11,
                        color: ShadTheme.of(context).colorScheme.mutedForeground,
                      ),
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}

// ── Shared chart title helper ─────────────────────────────────────────────────

FlTitlesData _defaultTitles(TextStyle textStyle, double minX, double maxX) {
  const msPerDay = 86400000.0;
  final xRange = maxX - minX;
  final interval = xRange <= 35
      ? 7.0
      : xRange <= 95
          ? 14.0
          : 30.0;

  return FlTitlesData(
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 44,
        getTitlesWidget: (v, _) =>
            Text(v.toStringAsFixed(1), style: textStyle),
      ),
    ),
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 24,
        interval: interval,
        getTitlesWidget: (v, meta) {
          if (v == meta.min || v == meta.max) return const SizedBox.shrink();
          final date =
              DateTime.fromMillisecondsSinceEpoch((v * msPerDay).toInt());
          return SideTitleWidget(
            meta: meta,
            child: Text(DateFormatter.toChartLabel(date), style: textStyle),
          );
        },
      ),
    ),
  );
}
