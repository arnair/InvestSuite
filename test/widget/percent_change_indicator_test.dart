import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investsuite/core/theme/app_theme.dart';
import 'package:investsuite/widgets/percent_change_indicator.dart';

void main() {
  Widget createTestWidget({
    required double percentChange,
    bool showIcon = true,
    bool showBackground = false,
    String? suffix,
  }) {
    return ProviderScope(
      child: MaterialApp(
        theme: AppTheme.retailBankTheme,
        home: Scaffold(
          body: PercentChangeIndicator(
            percentChange: percentChange,
            showIcon: showIcon,
            showBackground: showBackground,
            suffix: suffix,
          ),
        ),
      ),
    );
  }

  group('PercentChangeIndicator', () {
    testWidgets('displays positive percent change with plus sign', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(percentChange: 2.34));

      expect(find.text('+2.34%'), findsOneWidget);
    });

    testWidgets('displays negative percent change', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(percentChange: -1.56));

      expect(find.text('-1.56%'), findsOneWidget);
    });

    testWidgets('displays zero percent change with plus sign', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(percentChange: 0.0));

      expect(find.text('+0.00%'), findsOneWidget);
    });

    testWidgets('displays upward arrow for positive change', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(percentChange: 5.0));

      expect(find.byIcon(Icons.arrow_upward), findsOneWidget);
    });

    testWidgets('displays downward arrow for negative change', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(percentChange: -3.0));

      expect(find.byIcon(Icons.arrow_downward), findsOneWidget);
    });

    testWidgets('hides icon when showIcon is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(percentChange: 2.0, showIcon: false),
      );

      expect(find.byIcon(Icons.arrow_upward), findsNothing);
      expect(find.byIcon(Icons.arrow_downward), findsNothing);
    });

    testWidgets('shows background when showBackground is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(percentChange: 2.0, showBackground: true),
      );

      // Find Container with decoration
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('displays suffix when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(percentChange: 1.5, suffix: 'Today'),
      );

      expect(find.text('Today'), findsOneWidget);
    });

    testWidgets('renders in a Row widget', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(percentChange: 2.0));

      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('shows background with negative change', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(percentChange: -2.5, showBackground: true),
      );

      expect(find.text('-2.50%'), findsOneWidget);
    });

    testWidgets('displays with custom text style', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.retailBankTheme,
            home: Scaffold(
              body: PercentChangeIndicator(
                percentChange: 3.5,
                textStyle: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      );

      expect(find.text('+3.50%'), findsOneWidget);
    });

    testWidgets('displays with custom icon size', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.retailBankTheme,
            home: Scaffold(
              body: PercentChangeIndicator(percentChange: 4.0, iconSize: 24),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_upward), findsOneWidget);
    });

    testWidgets('works with neobank theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.neobankTheme,
            home: const Scaffold(
              body: PercentChangeIndicator(percentChange: 5.0),
            ),
          ),
        ),
      );

      expect(find.text('+5.00%'), findsOneWidget);
    });
  });
}
