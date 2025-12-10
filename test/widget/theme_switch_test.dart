import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investsuite/core/theme/app_theme.dart';
import 'package:investsuite/core/theme/theme_provider.dart';

void main() {
  group('Theme Provider', () {
    testWidgets('initial theme is Retail Bank', (WidgetTester tester) async {
      late AppThemeType capturedTheme;

      await tester.pumpWidget(
        ProviderScope(
          child: Consumer(
            builder: (context, ref, _) {
              capturedTheme = ref.watch(themeNotifierProvider);
              return MaterialApp(
                theme: capturedTheme == AppThemeType.retailBank
                    ? AppTheme.retailBankTheme
                    : AppTheme.neobankTheme,
                home: const Scaffold(body: Text('Test')),
              );
            },
          ),
        ),
      );

      expect(capturedTheme, equals(AppThemeType.retailBank));
    });

    testWidgets('theme can be toggled to Neobank', (WidgetTester tester) async {
      late AppThemeType capturedTheme;
      late WidgetRef capturedRef;

      await tester.pumpWidget(
        ProviderScope(
          child: Consumer(
            builder: (context, ref, _) {
              capturedTheme = ref.watch(themeNotifierProvider);
              capturedRef = ref;
              return MaterialApp(
                theme: capturedTheme == AppThemeType.retailBank
                    ? AppTheme.retailBankTheme
                    : AppTheme.neobankTheme,
                home: Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      final notifier = ref.read(themeNotifierProvider.notifier);
                      final current = ref.read(themeNotifierProvider);
                      notifier.setTheme(
                        current == AppThemeType.retailBank
                            ? AppThemeType.neobank
                            : AppThemeType.retailBank,
                      );
                    },
                    child: const Text('Toggle'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      // Initially Retail Bank
      expect(capturedTheme, equals(AppThemeType.retailBank));

      // Toggle theme
      await tester.tap(find.text('Toggle'));
      await tester.pumpAndSettle();

      // Now should be Neobank
      capturedTheme = capturedRef.read(themeNotifierProvider);
      expect(capturedTheme, equals(AppThemeType.neobank));
    });

    testWidgets('theme can be set directly', (WidgetTester tester) async {
      late AppThemeType capturedTheme;
      late WidgetRef capturedRef;

      await tester.pumpWidget(
        ProviderScope(
          child: Consumer(
            builder: (context, ref, _) {
              capturedTheme = ref.watch(themeNotifierProvider);
              capturedRef = ref;
              return MaterialApp(
                theme: capturedTheme == AppThemeType.retailBank
                    ? AppTheme.retailBankTheme
                    : AppTheme.neobankTheme,
                home: Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(themeNotifierProvider.notifier)
                          .setTheme(AppThemeType.neobank);
                    },
                    child: const Text('Set Neobank'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      // Initially Retail Bank
      expect(capturedTheme, equals(AppThemeType.retailBank));

      // Set to Neobank directly
      await tester.tap(find.text('Set Neobank'));
      await tester.pumpAndSettle();

      // Now should be Neobank
      capturedTheme = capturedRef.read(themeNotifierProvider);
      expect(capturedTheme, equals(AppThemeType.neobank));
    });
  });

  // Theme data tests need testWidgets for Google Fonts initialization
  group('AppTheme Data', () {
    testWidgets('Retail Bank theme has light brightness', (tester) async {
      await tester.pumpWidget(const MaterialApp());
      expect(AppTheme.retailBankTheme.brightness, equals(Brightness.light));
    });

    testWidgets('Neobank theme has dark brightness', (tester) async {
      await tester.pumpWidget(const MaterialApp());
      expect(AppTheme.neobankTheme.brightness, equals(Brightness.dark));
    });

    testWidgets('Retail Bank primary color is blue', (tester) async {
      await tester.pumpWidget(const MaterialApp());
      expect(
        AppTheme.retailBankTheme.colorScheme.primary,
        equals(const Color(0xFF1565C0)),
      );
    });

    testWidgets('Neobank primary color is neon green', (tester) async {
      await tester.pumpWidget(const MaterialApp());
      expect(
        AppTheme.neobankTheme.colorScheme.primary,
        equals(const Color(0xFF00FF94)),
      );
    });
  });
}
