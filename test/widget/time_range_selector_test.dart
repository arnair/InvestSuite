import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investsuite/core/theme/app_theme.dart';
import 'package:investsuite/features/portfolio/domain/performance_model.dart';
import 'package:investsuite/features/portfolio/presentation/widgets/time_range_selector.dart';
import 'package:investsuite/widgets/segmented_text_toggle.dart';

void main() {
  Widget createTestWidget({
    TimeRange selectedRange = TimeRange.oneMonth,
    ValueChanged<TimeRange>? onRangeSelected,
  }) {
    return ProviderScope(
      child: MaterialApp(
        theme: AppTheme.retailBankTheme,
        home: Scaffold(
          body: TimeRangeSelector(
            selectedRange: selectedRange,
            onRangeSelected: onRangeSelected ?? (_) {},
          ),
        ),
      ),
    );
  }

  group('TimeRangeSelector', () {
    testWidgets('displays all time range options', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      for (final range in TimeRange.values) {
        expect(find.text(range.displayName), findsOneWidget);
      }
    });

    testWidgets('displays 1D option', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('1D'), findsOneWidget);
    });

    testWidgets('displays 1W option', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('1W'), findsOneWidget);
    });

    testWidgets('displays 1M option', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('1M'), findsOneWidget);
    });

    testWidgets('displays 3M option', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('3M'), findsOneWidget);
    });

    testWidgets('displays 1Y option', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('1Y'), findsOneWidget);
    });

    testWidgets('uses SegmentedTextToggle widget', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(SegmentedTextToggle<TimeRange>), findsOneWidget);
    });

    testWidgets('calls onRangeSelected when tapped', (
      WidgetTester tester,
    ) async {
      TimeRange? selectedRange;

      await tester.pumpWidget(
        createTestWidget(
          selectedRange: TimeRange.oneMonth,
          onRangeSelected: (range) => selectedRange = range,
        ),
      );

      await tester.tap(find.text('1Y'));
      await tester.pumpAndSettle();

      expect(selectedRange, equals(TimeRange.oneYear));
    });

    testWidgets('tapping 1D selects oneDay', (WidgetTester tester) async {
      TimeRange? selectedRange;

      await tester.pumpWidget(
        createTestWidget(
          selectedRange: TimeRange.oneMonth,
          onRangeSelected: (range) => selectedRange = range,
        ),
      );

      await tester.tap(find.text('1D'));
      await tester.pumpAndSettle();

      expect(selectedRange, equals(TimeRange.oneDay));
    });

    testWidgets('tapping 1W selects oneWeek', (WidgetTester tester) async {
      TimeRange? selectedRange;

      await tester.pumpWidget(
        createTestWidget(
          selectedRange: TimeRange.oneMonth,
          onRangeSelected: (range) => selectedRange = range,
        ),
      );

      await tester.tap(find.text('1W'));
      await tester.pumpAndSettle();

      expect(selectedRange, equals(TimeRange.oneWeek));
    });
  });
}
