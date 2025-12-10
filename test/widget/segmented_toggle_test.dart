import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investsuite/core/theme/app_theme.dart';
import 'package:investsuite/widgets/segmented_text_toggle.dart';
import 'package:investsuite/widgets/segmented_icon_toggle.dart';

void main() {
  group('SegmentedTextToggle', () {
    Widget createTextToggleWidget({
      String selectedValue = 'A',
      ValueChanged<String>? onChanged,
    }) {
      return ProviderScope(
        child: MaterialApp(
          theme: AppTheme.retailBankTheme,
          home: Scaffold(
            body: SegmentedTextToggle<String>(
              value: selectedValue,
              options: const [
                SegmentedTextOption(value: 'A', label: 'Option A'),
                SegmentedTextOption(value: 'B', label: 'Option B'),
                SegmentedTextOption(value: 'C', label: 'Option C'),
              ],
              onChanged: onChanged ?? (_) {},
            ),
          ),
        ),
      );
    }

    testWidgets('displays all options', (WidgetTester tester) async {
      await tester.pumpWidget(createTextToggleWidget());

      expect(find.text('Option A'), findsOneWidget);
      expect(find.text('Option B'), findsOneWidget);
      expect(find.text('Option C'), findsOneWidget);
    });

    testWidgets('renders inside a Card', (WidgetTester tester) async {
      await tester.pumpWidget(createTextToggleWidget());

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('calls onChanged when option tapped', (
      WidgetTester tester,
    ) async {
      String? selectedValue;

      await tester.pumpWidget(
        createTextToggleWidget(
          selectedValue: 'A',
          onChanged: (value) => selectedValue = value,
        ),
      );

      await tester.tap(find.text('Option B'));
      await tester.pumpAndSettle();

      expect(selectedValue, equals('B'));
    });

    testWidgets('tapping selected option still calls onChanged', (
      WidgetTester tester,
    ) async {
      String? selectedValue;

      await tester.pumpWidget(
        createTextToggleWidget(
          selectedValue: 'A',
          onChanged: (value) => selectedValue = value,
        ),
      );

      await tester.tap(find.text('Option A'));
      await tester.pumpAndSettle();

      expect(selectedValue, equals('A'));
    });
  });

  group('SegmentedIconToggle', () {
    Widget createIconToggleWidget({
      String selectedValue = 'line',
      ValueChanged<String>? onChanged,
    }) {
      return ProviderScope(
        child: MaterialApp(
          theme: AppTheme.retailBankTheme,
          home: Scaffold(
            body: SegmentedIconToggle<String>(
              value: selectedValue,
              options: const [
                SegmentedIconOption(value: 'line', icon: Icons.show_chart),
                SegmentedIconOption(
                  value: 'candle',
                  icon: Icons.candlestick_chart,
                ),
              ],
              onChanged: onChanged ?? (_) {},
            ),
          ),
        ),
      );
    }

    testWidgets('displays all icons', (WidgetTester tester) async {
      await tester.pumpWidget(createIconToggleWidget());

      expect(find.byIcon(Icons.show_chart), findsOneWidget);
      expect(find.byIcon(Icons.candlestick_chart), findsOneWidget);
    });

    testWidgets('renders inside a Container', (WidgetTester tester) async {
      await tester.pumpWidget(createIconToggleWidget());

      // Icon toggle uses Container with decoration, not Card
      expect(find.byType(SegmentedIconToggle<String>), findsOneWidget);
    });

    testWidgets('calls onChanged when icon tapped', (
      WidgetTester tester,
    ) async {
      String? selectedValue;

      await tester.pumpWidget(
        createIconToggleWidget(
          selectedValue: 'line',
          onChanged: (value) => selectedValue = value,
        ),
      );

      await tester.tap(find.byIcon(Icons.candlestick_chart));
      await tester.pumpAndSettle();

      expect(selectedValue, equals('candle'));
    });
  });
}
