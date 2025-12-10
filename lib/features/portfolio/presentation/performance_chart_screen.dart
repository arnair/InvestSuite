import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/formatters.dart';
import '../../../widgets/error_widget.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/percent_change_indicator.dart';
import '../../../widgets/segmented_icon_toggle.dart';
import '../domain/performance_model.dart';
import 'performance_controller.dart';
import 'portfolio_controller.dart';
import 'widgets/performance_chart.dart';
import 'widgets/time_range_selector.dart';

@RoutePage()
class PerformanceChartScreen extends ConsumerStatefulWidget {
  const PerformanceChartScreen({super.key});

  @override
  ConsumerState<PerformanceChartScreen> createState() =>
      _PerformanceChartScreenState();
}

class _PerformanceChartScreenState
    extends ConsumerState<PerformanceChartScreen> {
  ChartType _chartType = ChartType.line;

  @override
  Widget build(BuildContext context) {
    final performanceState = ref.watch(performanceControllerProvider);
    final selectedTimeRange = ref.watch(selectedTimeRangeProvider);
    final portfolioSummary = ref.watch(portfolioSummaryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Performance')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (portfolioSummary != null) ...[
              _buildSummaryCard(context, portfolioSummary),
              const SizedBox(height: 24),
            ],
            // Time Range + Chart Type Selectors
            Row(
              children: [
                Expanded(
                  child: TimeRangeSelector(
                    selectedRange: selectedTimeRange,
                    onRangeSelected: (range) {
                      ref
                          .read(selectedTimeRangeProvider.notifier)
                          .setTimeRange(range);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                SegmentedIconToggle<ChartType>(
                  value: _chartType,
                  options: const [
                    SegmentedIconOption(
                      value: ChartType.line,
                      icon: Icons.show_chart,
                    ),
                    SegmentedIconOption(
                      value: ChartType.candlestick,
                      icon: Icons.candlestick_chart,
                    ),
                  ],
                  onChanged: (type) => setState(() => _chartType = type),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Performance Chart
            SizedBox(
              height: 400,
              child: performanceState.when(
                loading: () => const Center(
                  child: LoadingWidget(message: 'Loading chart data...'),
                ),
                error: (error, _) => Center(
                  child: AppErrorWidget(
                    message: error.toString(),
                    onRetry: () {
                      ref
                          .read(performanceControllerProvider.notifier)
                          .refresh();
                    },
                  ),
                ),
                data: (history) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPerformanceStats(context, history),
                    const SizedBox(height: 16),
                    Expanded(
                      child: PerformanceChart(
                        history: history,
                        timeRange: selectedTimeRange,
                        chartType: _chartType,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, PortfolioSummary summary) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    final profitColor = summary.isProfitPositive
        ? appColors.positive
        : appColors.negative;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Portfolio Value',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              summary.formattedTotalValue,
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            PercentChangeIndicator(
              percentChange: summary.totalPercentChange,
              iconSize: 20,
              textStyle: theme.textTheme.titleMedium,
              suffix: 'Today',
            ),
            const Divider(height: 24),
            // Initial Investment & Profit/Loss
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Initial Investment',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      summary.formattedInitialInvestment,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Total Profit/Loss',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          summary.formattedProfitLoss,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: profitColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        PercentChangeIndicator(
                          percentChange: summary.profitLossPercent,
                          showIcon: false,
                          showBackground: true,
                          textStyle: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceStats(
    BuildContext context,
    PerformanceHistory history,
  ) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    final isPositive = history.isPositive;
    final color = isPositive ? appColors.positive : appColors.negative;

    // Format the absolute change
    final formattedAmount = history.absoluteChange.asCurrencyWithSign;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPositive ? Icons.trending_up : Icons.trending_down,
            color: color,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            'Period Return',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            formattedAmount,
            style: theme.textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 6),
          PercentChangeIndicator(
            percentChange: history.percentageChange,
            showIcon: false,
            showBackground: true,
            textStyle: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
