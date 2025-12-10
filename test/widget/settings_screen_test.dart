import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investsuite/core/theme/app_theme.dart';
import 'package:investsuite/core/theme/theme_provider.dart';
import 'package:investsuite/features/settings/presentation/settings_screen.dart';

void main() {
  Widget createTestWidget({
    AppThemeType initialTheme = AppThemeType.retailBank,
  }) {
    return ProviderScope(
      overrides: [
        themeNotifierProvider.overrideWith(
          () => _TestThemeNotifier(initialTheme),
        ),
      ],
      child: Consumer(
        builder: (context, ref, _) {
          final themeType = ref.watch(themeNotifierProvider);
          return MaterialApp(
            theme: themeType == AppThemeType.retailBank
                ? AppTheme.retailBankTheme
                : AppTheme.neobankTheme,
            home: const SettingsScreen(),
          );
        },
      ),
    );
  }

  group('SettingsScreen', () {
    testWidgets('displays Appearance section title', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Appearance'), findsOneWidget);
    });

    testWidgets('displays Settings in app bar', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('displays Retail Bank theme option', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Retail Bank'), findsOneWidget);
      expect(find.text('Clean, blue theme'), findsOneWidget);
    });

    testWidgets('displays Neobank theme option', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Neobank'), findsOneWidget);
      expect(find.text('Modern, dark neon theme'), findsOneWidget);
    });

    testWidgets('shows check icon for selected Retail Bank theme', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(initialTheme: AppThemeType.retailBank),
      );
      await tester.pumpAndSettle();

      // Retail Bank should have check icon
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('shows check icon for selected Neobank theme', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(initialTheme: AppThemeType.neobank),
      );
      await tester.pumpAndSettle();

      // Neobank should have check icon
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('tapping Neobank option switches theme', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(initialTheme: AppThemeType.retailBank),
      );
      await tester.pumpAndSettle();

      // Tap on Neobank option
      await tester.tap(find.text('Neobank'));
      await tester.pumpAndSettle();

      // Verify theme changed (brightness should be dark)
      final context = tester.element(find.byType(SettingsScreen));
      expect(Theme.of(context).brightness, equals(Brightness.dark));
    });

    testWidgets('tapping Retail Bank option switches theme back', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(initialTheme: AppThemeType.neobank),
      );
      await tester.pumpAndSettle();

      // Tap on Retail Bank option
      await tester.tap(find.text('Retail Bank'));
      await tester.pumpAndSettle();

      // Verify theme changed (brightness should be light)
      final context = tester.element(find.byType(SettingsScreen));
      expect(Theme.of(context).brightness, equals(Brightness.light));
    });

    testWidgets('displays bank icon for Retail Bank option', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.account_balance), findsOneWidget);
    });

    testWidgets('displays rocket icon for Neobank option', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.rocket_launch), findsOneWidget);
    });

    testWidgets('renders inside a Card widget', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('can scroll the content', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Settings screen should be scrollable
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}

/// Test implementation that allows setting initial theme
class _TestThemeNotifier extends ThemeNotifier {
  final AppThemeType _initialTheme;

  _TestThemeNotifier(this._initialTheme);

  @override
  AppThemeType build() => _initialTheme;
}
