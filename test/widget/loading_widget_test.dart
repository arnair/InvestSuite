import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investsuite/core/theme/app_theme.dart';
import 'package:investsuite/widgets/loading_widget.dart';

void main() {
  Widget createTestWidget({String? message}) {
    return ProviderScope(
      child: MaterialApp(
        theme: AppTheme.retailBankTheme,
        home: Scaffold(
          body: message != null
              ? LoadingWidget(message: message)
              : const LoadingWidget(),
        ),
      ),
    );
  }

  group('LoadingWidget', () {
    testWidgets('displays CircularProgressIndicator', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays default loading message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('Loading...'), findsOneWidget);
    });

    testWidgets('displays custom loading message', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(message: 'Loading portfolio...'),
      );

      expect(find.text('Loading portfolio...'), findsOneWidget);
    });

    testWidgets('is centered on screen', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      // LoadingWidget contains a Center widget
      expect(find.byType(Center), findsWidgets);
    });

    testWidgets('displays message below progress indicator', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(message: 'Custom message'));

      // Both should be present in a Column
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Custom message'), findsOneWidget);
    });
  });
}
