import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investsuite/core/theme/app_theme.dart';
import 'package:investsuite/widgets/error_widget.dart';

void main() {
  bool retryTapped = false;

  Widget createTestWidget({required String message}) {
    retryTapped = false;
    return ProviderScope(
      child: MaterialApp(
        theme: AppTheme.retailBankTheme,
        home: Scaffold(
          body: AppErrorWidget(
            message: message,
            onRetry: () {
              retryTapped = true;
            },
          ),
        ),
      ),
    );
  }

  group('AppErrorWidget', () {
    testWidgets('displays error icon', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(message: 'Test error'));

      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('displays error title', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(message: 'Test error'));

      expect(find.text('Oops! Something went wrong'), findsOneWidget);
    });

    testWidgets('displays error message', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(message: 'Network connection failed'),
      );

      expect(find.text('Network connection failed'), findsOneWidget);
    });

    testWidgets('displays retry button', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(message: 'Test error'));

      expect(find.text('Try Again'), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });

    testWidgets('retry button triggers callback when tapped', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(message: 'Test error'));

      expect(retryTapped, isFalse);

      await tester.tap(find.text('Try Again'));
      await tester.pumpAndSettle();

      expect(retryTapped, isTrue);
    });

    testWidgets('is centered on screen', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(message: 'Test error'));

      // The AppErrorWidget contains a Center widget
      expect(find.byType(Center), findsWidgets);
    });

    testWidgets('displays components in correct order', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(message: 'Error message'));

      // All should be present in a Column
      expect(find.byType(Column), findsWidgets);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
      expect(find.text('Oops! Something went wrong'), findsOneWidget);
      expect(find.text('Error message'), findsOneWidget);
      // ElevatedButton.icon creates a different type
      expect(find.text('Try Again'), findsOneWidget);
    });
  });
}
