import 'package:flutter/material.dart';

import '../../domain/performance_model.dart';
import 'candlestick_chart_view.dart';
import 'line_chart_view.dart';

/// Chart visualization type
enum ChartType { line, candlestick }

/// Interactive chart displaying portfolio performance over time
class PerformanceChart extends StatelessWidget {
  final PerformanceHistory history;
  final TimeRange timeRange;
  final ChartType chartType;

  const PerformanceChart({
    super.key,
    required this.history,
    required this.timeRange,
    this.chartType = ChartType.line,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: switch (chartType) {
          ChartType.line => LineChartView(
            history: history,
            timeRange: timeRange,
          ),
          ChartType.candlestick => CandlestickChartView(
            history: history,
            timeRange: timeRange,
          ),
        },
      ),
    );
  }
}
