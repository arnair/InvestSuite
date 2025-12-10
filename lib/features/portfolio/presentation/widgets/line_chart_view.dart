import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/date_formatters.dart';
import '../../../../core/utils/formatters.dart';
import '../../domain/performance_model.dart';
import 'chart_config.dart';

/// Line chart visualization for portfolio performance
class LineChartView extends StatefulWidget {
  final PerformanceHistory history;
  final TimeRange timeRange;

  const LineChartView({
    super.key,
    required this.history,
    required this.timeRange,
  });

  @override
  State<LineChartView> createState() => _LineChartViewState();
}

class _LineChartViewState extends State<LineChartView> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    final config = ChartConfig(
      history: widget.history,
      timeRange: widget.timeRange,
      theme: theme,
    );

    final spots = [
      for (final (i, point) in widget.history.dataPoints.indexed)
        FlSpot(i.toDouble(), point.value),
    ];

    return LineChart(
      LineChartData(
        gridData: config.gridData,
        titlesData: config.titlesData,
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: (spots.length - 1).toDouble(),
        minY: config.minY,
        maxY: config.maxY,
        lineTouchData: _buildTouchData(theme),
        lineBarsData: [_buildLineBarData(spots, appColors, theme)],
      ),
    );
  }

  LineTouchData _buildTouchData(ThemeData theme) => LineTouchData(
    enabled: true,
    touchTooltipData: LineTouchTooltipData(
      getTooltipColor: (_) => theme.colorScheme.surfaceContainerHighest,
      tooltipRoundedRadius: 8,
      getTooltipItems: (spots) => spots.map((spot) {
        final point = widget.history.dataPoints[spot.x.toInt()];
        return LineTooltipItem(
          '${point.timestamp.asDateTimeShort}\n${point.value.asCurrency}',
          theme.textTheme.bodySmall!.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        );
      }).toList(),
    ),
    handleBuiltInTouches: true,
    touchCallback: (event, response) {
      if (event is FlTapUpEvent || event is FlPanEndEvent) {
        setState(() => touchedIndex = null);
      } else if (response?.lineBarSpots?.isNotEmpty ?? false) {
        setState(() => touchedIndex = response!.lineBarSpots!.first.x.toInt());
      }
    },
  );

  LineChartBarData _buildLineBarData(
    List<FlSpot> spots,
    AppColors colors,
    ThemeData theme,
  ) => LineChartBarData(
    spots: spots,
    isCurved: true,
    curveSmoothness: 0.3,
    color: colors.chartLine,
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: true,
      getDotPainter: (_, __, ___, index) => FlDotCirclePainter(
        radius: index == touchedIndex ? 6 : 0,
        color: index == touchedIndex ? colors.chartLine : Colors.transparent,
        strokeWidth: index == touchedIndex ? 2 : 0,
        strokeColor: index == touchedIndex
            ? theme.colorScheme.surface
            : Colors.transparent,
      ),
    ),
    belowBarData: BarAreaData(
      show: true,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [colors.chartGradientStart, colors.chartGradientEnd],
      ),
    ),
  );
}
