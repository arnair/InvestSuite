import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/date_formatters.dart';
import '../../../../core/utils/formatters.dart';
import '../../data/mappers/candle_mapper.dart';
import '../../domain/candle_data.dart';
import '../../domain/performance_model.dart';
import 'chart_config.dart';

/// Candlestick chart visualization for portfolio performance
class CandlestickChartView extends StatefulWidget {
  final PerformanceHistory history;
  final TimeRange timeRange;

  const CandlestickChartView({
    super.key,
    required this.history,
    required this.timeRange,
  });

  @override
  State<CandlestickChartView> createState() => _CandlestickChartViewState();
}

class _CandlestickChartViewState extends State<CandlestickChartView> {
  int? touchedIndex;
  late List<CandleData> candleData;

  @override
  void initState() {
    super.initState();
    candleData = CandleMapper.fromDataPoints(widget.history.dataPoints);
  }

  @override
  void didUpdateWidget(CandlestickChartView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.history != widget.history) {
      candleData = CandleMapper.fromDataPoints(widget.history.dataPoints);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    final config = ChartConfig(
      history: widget.history,
      timeRange: widget.timeRange,
      theme: theme,
    );

    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        onPanUpdate: (d) => _handleTouch(d.localPosition.dx, constraints),
        onPanEnd: (_) => setState(() => touchedIndex = null),
        onTapUp: (d) => _handleTap(d.localPosition.dx, constraints),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                gridData: config.gridData,
                titlesData: config.titlesData,
                borderData: FlBorderData(show: false),
                minY: config.minY,
                maxY: config.maxY,
                groupsSpace: 0,
                barGroups: _buildBarGroups(appColors),
                barTouchData: BarTouchData(enabled: false),
              ),
            ),
            if (touchedIndex != null && touchedIndex! < candleData.length)
              _buildTooltip(constraints, theme, appColors),
          ],
        ),
      ),
    );
  }

  void _handleTouch(double dx, BoxConstraints constraints) {
    final index = _getIndexFromX(dx, constraints);
    setState(() => touchedIndex = index);
  }

  void _handleTap(double dx, BoxConstraints constraints) {
    final index = _getIndexFromX(dx, constraints);
    setState(() => touchedIndex = touchedIndex == index ? null : index);
  }

  int _getIndexFromX(double dx, BoxConstraints constraints) {
    final chartWidth = constraints.maxWidth - 56;
    return ((dx - 48) / (chartWidth / candleData.length)).floor().clamp(
      0,
      candleData.length - 1,
    );
  }

  List<BarChartGroupData> _buildBarGroups(AppColors colors) => [
    for (final (i, candle) in candleData.indexed)
      BarChartGroupData(
        x: i,
        barsSpace: 0,
        barRods: [
          BarChartRodData(
            fromY: candle.isBullish ? candle.open : candle.close,
            toY: candle.isBullish ? candle.close : candle.open,
            width: i == touchedIndex ? 14 : 10,
            color: candle.isBullish ? colors.positive : colors.negative,
            borderRadius: BorderRadius.zero,
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              fromY: candle.low,
              toY: candle.high,
              color: (candle.isBullish ? colors.positive : colors.negative)
                  .withValues(alpha: 0.3),
            ),
          ),
        ],
      ),
  ];

  Widget _buildTooltip(
    BoxConstraints constraints,
    ThemeData theme,
    AppColors colors,
  ) {
    final candle = candleData[touchedIndex!];
    final chartWidth = constraints.maxWidth - 56;
    final tooltipX =
        48 + (touchedIndex! * chartWidth / (candleData.length - 1));
    final color = candle.isBullish ? colors.positive : colors.negative;

    return Positioned(
      top: 8,
      left: tooltipX - 45,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              candle.timestamp.asDateTimeShort,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'H: ${candle.high.asCurrencyWhole}',
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
            ),
            Text(
              'L: ${candle.low.asCurrencyWhole}',
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
            ),
            Text(
              'C: ${candle.close.asCurrencyWhole}',
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
