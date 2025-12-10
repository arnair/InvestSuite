import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/formatters.dart';
import '../../domain/performance_model.dart';

/// Shared configuration utilities for chart widgets
class ChartConfig {
  final PerformanceHistory history;
  final TimeRange timeRange;
  final ThemeData theme;

  ChartConfig({
    required this.history,
    required this.timeRange,
    required this.theme,
  });

  double get minY => history.minValue * 0.98;
  double get maxY => history.maxValue * 1.02;
  double get interval => (maxY - minY) / 4;

  FlGridData get gridData => FlGridData(
    show: true,
    drawVerticalLine: false,
    horizontalInterval: interval,
    getDrawingHorizontalLine: (_) => FlLine(
      color: theme.dividerTheme.color ?? Colors.grey.withValues(alpha: 0.2),
      strokeWidth: 1,
    ),
  );

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 24,
        interval: 1,
        getTitlesWidget: _bottomTitle,
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 48,
        interval: interval,
        getTitlesWidget: _leftTitle,
      ),
    ),
  );

  Widget _leftTitle(double value, TitleMeta meta) {
    if (value <= minY * 1.001 || value >= maxY * 0.999) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: 44,
      child: Text(
        value.asCurrencyCompact,
        style: theme.textTheme.bodySmall?.copyWith(fontSize: 9),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget _bottomTitle(double value, TitleMeta meta) {
    final index = value.toInt();
    final count = history.dataPoints.length;

    if (index < 0 || index >= count || !_labelIndices.contains(index)) {
      return const SizedBox.shrink();
    }

    final label = timeRange.formatDate(history.dataPoints[index].timestamp);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: SizedBox(
        width: 40,
        child: Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(fontSize: 9),
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }

  List<int> get _labelIndices {
    final count = history.dataPoints.length;
    if (count <= 6) return List.generate(count, (i) => i);
    return List.generate(6, (i) => i * 2);
  }
}
