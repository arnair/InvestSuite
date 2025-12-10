import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investsuite/core/theme/app_theme.dart';
import 'package:investsuite/features/portfolio/domain/portfolio_model.dart';
import 'package:investsuite/features/portfolio/presentation/portfolio_controller.dart';
import 'package:investsuite/features/portfolio/presentation/portfolio_screen.dart';
import 'package:investsuite/features/portfolio/presentation/widgets/asset_list_tile.dart';
import 'package:investsuite/widgets/error_widget.dart';
import 'package:investsuite/widgets/loading_widget.dart';

import '../helpers/test_data.dart';

void main() {
  Widget createTestWidget({
    required AsyncValue<PortfolioModel> portfolioState,
  }) {
    return ProviderScope(
      overrides: [
        portfolioControllerProvider.overrideWith(
          () => _MockPortfolioController(portfolioState),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.retailBankTheme,
        home: const PortfolioScreen(),
      ),
    );
  }

  group('PortfolioScreen', () {
    testWidgets('displays loading widget when loading', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(portfolioState: const AsyncValue.loading()),
      );

      expect(find.byType(LoadingWidget), findsOneWidget);
      expect(find.text('Loading portfolio...'), findsOneWidget);
    });

    testWidgets('displays error widget on error', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          portfolioState: AsyncValue.error(
            Exception('Network error'),
            StackTrace.current,
          ),
        ),
      );

      expect(find.byType(AppErrorWidget), findsOneWidget);
    });

    testWidgets('displays portfolio header when data loaded', (
      WidgetTester tester,
    ) async {
      final portfolio = TestData.createPortfolio();

      await tester.pumpWidget(
        createTestWidget(portfolioState: AsyncValue.data(portfolio)),
      );

      // Check for total value displayed in header
      expect(find.textContaining('\$'), findsWidgets);
    });

    testWidgets('displays asset list when data loaded', (
      WidgetTester tester,
    ) async {
      final portfolio = TestData.createPortfolio();

      await tester.pumpWidget(
        createTestWidget(portfolioState: AsyncValue.data(portfolio)),
      );

      // Should show AssetListTile for each asset
      expect(
        find.byType(AssetListTile),
        findsNWidgets(portfolio.assets.length),
      );
    });

    testWidgets('displays asset count in header', (WidgetTester tester) async {
      final portfolio = TestData.createPortfolio();

      await tester.pumpWidget(
        createTestWidget(portfolioState: AsyncValue.data(portfolio)),
      );

      expect(find.text('Assets (${portfolio.assets.length})'), findsOneWidget);
    });

    testWidgets('displays Portfolio title in app bar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          portfolioState: AsyncValue.data(TestData.createPortfolio()),
        ),
      );

      expect(find.text('Portfolio'), findsOneWidget);
    });

    testWidgets('displays asset symbols', (WidgetTester tester) async {
      final portfolio = TestData.createPortfolio();

      await tester.pumpWidget(
        createTestWidget(portfolioState: AsyncValue.data(portfolio)),
      );

      for (final asset in portfolio.assets) {
        expect(find.text(asset.symbol), findsOneWidget);
      }
    });

    testWidgets('displays asset names', (WidgetTester tester) async {
      final portfolio = TestData.createPortfolio();

      await tester.pumpWidget(
        createTestWidget(portfolioState: AsyncValue.data(portfolio)),
      );

      for (final asset in portfolio.assets) {
        expect(find.text(asset.name), findsOneWidget);
      }
    });

    testWidgets('has refresh indicator', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          portfolioState: AsyncValue.data(TestData.createPortfolio()),
        ),
      );

      expect(find.byType(RefreshIndicator), findsOneWidget);
    });

    testWidgets('uses CustomScrollView for scrolling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          portfolioState: AsyncValue.data(TestData.createPortfolio()),
        ),
      );

      expect(find.byType(CustomScrollView), findsOneWidget);
    });

    testWidgets('displays empty portfolio correctly', (
      WidgetTester tester,
    ) async {
      final emptyPortfolio = TestData.createEmptyPortfolio();

      await tester.pumpWidget(
        createTestWidget(portfolioState: AsyncValue.data(emptyPortfolio)),
      );

      expect(find.text('Assets (0)'), findsOneWidget);
      expect(find.byType(AssetListTile), findsNothing);
    });

    testWidgets('error widget shows retry button', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          portfolioState: AsyncValue.error(
            Exception('Test error'),
            StackTrace.current,
          ),
        ),
      );

      expect(find.text('Try Again'), findsOneWidget);
    });
  });
}

/// Mock controller for testing
class _MockPortfolioController extends PortfolioController {
  final AsyncValue<PortfolioModel> _state;

  _MockPortfolioController(this._state);

  @override
  AsyncValue<PortfolioModel> build() => _state;

  @override
  Future<void> refresh() async {}
}
