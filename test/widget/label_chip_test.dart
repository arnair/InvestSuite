import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investsuite/core/theme/app_theme.dart';
import 'package:investsuite/widgets/label_chip.dart';

void main() {
  Widget createTestWidget({
    required String label,
    Color? backgroundColor,
    Color? textColor,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
  }) {
    return ProviderScope(
      child: MaterialApp(
        theme: AppTheme.retailBankTheme,
        home: Scaffold(
          body: LabelChip(
            label: label,
            backgroundColor: backgroundColor,
            textColor: textColor,
            textStyle: textStyle,
            padding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            borderRadius: borderRadius ?? 4,
          ),
        ),
      ),
    );
  }

  group('LabelChip', () {
    testWidgets('displays the label text', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(label: 'Stock'));

      expect(find.text('Stock'), findsOneWidget);
    });

    testWidgets('displays different label text', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(label: 'Crypto'));

      expect(find.text('Crypto'), findsOneWidget);
    });

    testWidgets('renders inside a Container', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(label: 'ETF'));

      expect(find.byType(LabelChip), findsOneWidget);
    });

    testWidgets('handles empty label', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(label: ''));

      expect(find.byType(LabelChip), findsOneWidget);
    });

    testWidgets('handles long label', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(label: 'Very Long Asset Type Name'),
      );

      expect(find.text('Very Long Asset Type Name'), findsOneWidget);
    });

    testWidgets('applies custom background color', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(label: 'Test', backgroundColor: Colors.red),
      );

      expect(find.byType(LabelChip), findsOneWidget);
    });

    testWidgets('applies custom text color', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(label: 'Test', textColor: Colors.white),
      );

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('applies custom text style', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          label: 'Test',
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('applies custom padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(label: 'Test', padding: const EdgeInsets.all(16)),
      );

      expect(find.byType(LabelChip), findsOneWidget);
    });

    testWidgets('applies custom border radius', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(label: 'Test', borderRadius: 12),
      );

      expect(find.byType(LabelChip), findsOneWidget);
    });
  });
}
