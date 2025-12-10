import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investsuite/core/theme/app_theme.dart';
import 'package:investsuite/features/portfolio/domain/performance_model.dart';
import 'package:investsuite/features/portfolio/domain/portfolio_model.dart';
import 'package:investsuite/features/portfolio/presentation/performance_chart_screen.dart';
import 'package:investsuite/features/portfolio/presentation/performance_controller.dart';
import 'package:investsuite/features/portfolio/presentation/portfolio_controller.dart';
import 'package:investsuite/features/portfolio/presentation/widgets/performance_chart.dart';
import 'package:investsuite/features/portfolio/presentation/widgets/time_range_selector.dart';
import 'package:investsuite/widgets/error_widget.dart';
import 'package:investsuite/widgets/loading_widget.dart';
import 'package:investsuite/widgets/segmented_icon_toggle.dart';

import '../helpers/test_data.dart';

void main() {
  Widget createTestWidget({
    required AsyncValue<PerformanceHistory> performanceState,
    PortfolioModel? portfolio,
  }) {
    return ProviderScope(
      overrides: [
        performanceControllerProvider.overrideWith(
          () => _MockPerformanceController(performanceState),
        ),
        if (portfolio != null)
          portfolioControllerProvider.overrideWith(
            () => _MockPortfolioController(AsyncValue.data(portfolio)),
          )
        else
          portfolioControllerProvider.overrideWith(
            () => _MockPortfolioController(const AsyncValue.loading()),
          ),
      ],
      child: MaterialApp(
        theme: AppTheme.retailBankTheme,
        home: const PerformanceChartScreen(),
      ),
    );
  }

  group('PerformanceChartScreen', () {
    testWidgets('displays loading widget when loading', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(performanceState: const AsyncValue.loading()),
      );

      expect(find.byType(LoadingWidget), findsOneWidget);
      expect(find.text('Loading chart data...'), findsOneWidget);
    });

    testWidgets('displays error widget on error', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          performanceState: AsyncValue.error(
            Exception('Chart error'),
            StackTrace.current,
          ),
        ),
      );

      expect(find.byType(AppErrorWidget), findsOneWidget);
    });

    testWidgets('displays Performance title in app bar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          performanceState: AsyncValue.data(
            TestData.createPerformanceHistory(),
          ),
        ),
      );

      expect(find.text('Performance'), findsOneWidget);
    });

    testWidgets('displays time range selector when data loaded', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          performanceState: AsyncValue.data(
            TestData.createPerformanceHistory(),
          ),
        ),
      );

      expect(find.byType(TimeRangeSelector), findsOneWidget);
    });

    testWidgets('displays chart type toggle when data loaded', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          performanceState: AsyncValue.data(
            TestData.createPerformanceHistory(),
          ),
        ),
      );

      expect(find.byType(SegmentedIconToggle<ChartType>), findsOneWidget);
    });

    testWidgets('displays performance chart when data loaded', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          performanceState: AsyncValue.data(
            TestData.createPerformanceHistory(),
          ),
        ),
      );

      expect(find.byType(PerformanceChart), findsOneWidget);
    });

    testWidgets('displays line and candlestick icons in toggle', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          performanceState: AsyncValue.data(
            TestData.createPerformanceHistory(),
          ),
        ),
      );

      expect(find.byIcon(Icons.show_chart), findsOneWidget);
      expect(find.byIcon(Icons.candlestick_chart), findsOneWidget);
    });

    testWidgets('displays portfolio summary card when portfolio loaded', (
      WidgetTester tester,
    ) async {
      final portfolio = TestData.createPortfolio();

      await tester.pumpWidget(
        createTestWidget(
          performanceState: AsyncValue.data(
            TestData.createPerformanceHistory(),
          ),
          portfolio: portfolio,
        ),
      );
      await tester.pumpAndSettle();

      // Should show portfolio summary text
      expect(find.text('Total Portfolio Value'), findsOneWidget);
    });

    testWidgets('displays initial investment label when portfolio loaded', (
      WidgetTester tester,
    ) async {
      final portfolio = TestData.createPortfolio();

      await tester.pumpWidget(
        createTestWidget(
          performanceState: AsyncValue.data(
            TestData.createPerformanceHistory(),
          ),
          portfolio: portfolio,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Initial Investment'), findsOneWidget);
    });

    testWidgets('displays total profit/loss label when portfolio loaded', (
      WidgetTester tester,
    ) async {
      final portfolio = TestData.createPortfolio();

      await tester.pumpWidget(
        createTestWidget(
          performanceState: AsyncValue.data(
            TestData.createPerformanceHistory(),
          ),
          portfolio: portfolio,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Total Profit/Loss'), findsOneWidget);
    });

    testWidgets('displays period return stats when data loaded', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          performanceState: AsyncValue.data(
            TestData.createPerformanceHistory(),
          ),
        ),
      );

      expect(find.text('Period Return'), findsOneWidget);
    });

    testWidgets('error widget shows retry button', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          performanceState: AsyncValue.error(
            Exception('Test error'),
            StackTrace.current,
          ),
        ),
      );

      expect(find.text('Try Again'), findsOneWidget);
    });

    testWidgets('uses SingleChildScrollView for scrolling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          performanceState: AsyncValue.data(
            TestData.createPerformanceHistory(),
          ),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
  });
}

/// Mock controller for testing performance
class _MockPerformanceController extends PerformanceController {
  final AsyncValue<PerformanceHistory> _state;

  _MockPerformanceController(this._state);

  @override
  AsyncValue<PerformanceHistory> build() => _state;

  @override
  Future<void> refresh() async {}
}

/// Mock controller for testing portfolio
class _MockPortfolioController extends PortfolioController {
  final AsyncValue<PortfolioModel> _state;

  _MockPortfolioController(this._state);

  @override
  AsyncValue<PortfolioModel> build() => _state;

  @override
  Future<void> refresh() async {}
}
