import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investsuite/core/theme/app_theme.dart';
import 'package:investsuite/features/portfolio/presentation/widgets/portfolio_header.dart';

import '../helpers/test_data.dart';

void main() {
  Widget createTestWidget({required portfolioModel, bool isDarkTheme = false}) {
    return ProviderScope(
      child: MaterialApp(
        theme: isDarkTheme ? AppTheme.neobankTheme : AppTheme.retailBankTheme,
        home: Scaffold(
          body: SingleChildScrollView(
            child: PortfolioHeader(portfolio: portfolioModel),
          ),
        ),
      ),
    );
  }

  group('PortfolioHeader', () {
    testWidgets('displays portfolio name', (WidgetTester tester) async {
      final portfolio = TestData.createPortfolio(name: 'My Portfolio');

      await tester.pumpWidget(createTestWidget(portfolioModel: portfolio));

      expect(find.text('My Portfolio'), findsOneWidget);
    });

    testWidgets('displays formatted total value', (WidgetTester tester) async {
      final portfolio = TestData.createPortfolio();

      await tester.pumpWidget(createTestWidget(portfolioModel: portfolio));

      expect(find.textContaining('\$'), findsWidgets);
    });

    testWidgets('displays Today label', (WidgetTester tester) async {
      final portfolio = TestData.createPortfolio();

      await tester.pumpWidget(createTestWidget(portfolioModel: portfolio));

      expect(find.text('Today'), findsOneWidget);
    });

    testWidgets('displays trending up icon for positive change', (
      WidgetTester tester,
    ) async {
      final portfolio = TestData.createPortfolio(totalPercentChange: 5.0);

      await tester.pumpWidget(createTestWidget(portfolioModel: portfolio));

      expect(find.byIcon(Icons.trending_up), findsOneWidget);
    });

    testWidgets('displays trending down icon for negative change', (
      WidgetTester tester,
    ) async {
      final portfolio = TestData.createNegativePortfolio();

      await tester.pumpWidget(createTestWidget(portfolioModel: portfolio));

      expect(find.byIcon(Icons.trending_down), findsOneWidget);
    });

    testWidgets('renders in light theme', (WidgetTester tester) async {
      final portfolio = TestData.createPortfolio();

      await tester.pumpWidget(
        createTestWidget(portfolioModel: portfolio, isDarkTheme: false),
      );

      expect(find.byType(PortfolioHeader), findsOneWidget);
    });

    testWidgets('renders in dark theme', (WidgetTester tester) async {
      final portfolio = TestData.createPortfolio();

      await tester.pumpWidget(
        createTestWidget(portfolioModel: portfolio, isDarkTheme: true),
      );

      expect(find.byType(PortfolioHeader), findsOneWidget);
    });

    testWidgets('displays percent change', (WidgetTester tester) async {
      final portfolio = TestData.createPortfolio(totalPercentChange: 3.5);

      await tester.pumpWidget(createTestWidget(portfolioModel: portfolio));

      expect(find.textContaining('%'), findsOneWidget);
    });

    testWidgets('renders with empty portfolio', (WidgetTester tester) async {
      final portfolio = TestData.createEmptyPortfolio();

      await tester.pumpWidget(createTestWidget(portfolioModel: portfolio));

      expect(find.byType(PortfolioHeader), findsOneWidget);
    });
  });
}
