import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/core/theme/app_theme.dart';
import 'package:investsuite/core/theme/theme_provider.dart';

void main() {
  group('ThemeNotifier', () {
    test('initial state is retailBank', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final theme = container.read(themeNotifierProvider);
      expect(theme, equals(AppThemeType.retailBank));
    });

    test('setTheme updates state to neobank', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(themeNotifierProvider.notifier)
          .setTheme(AppThemeType.neobank);

      final theme = container.read(themeNotifierProvider);
      expect(theme, equals(AppThemeType.neobank));
    });

    test('setTheme updates state to retailBank', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // First set to neobank
      container
          .read(themeNotifierProvider.notifier)
          .setTheme(AppThemeType.neobank);
      // Then set back to retailBank
      container
          .read(themeNotifierProvider.notifier)
          .setTheme(AppThemeType.retailBank);

      final theme = container.read(themeNotifierProvider);
      expect(theme, equals(AppThemeType.retailBank));
    });

    test('can toggle theme multiple times', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(themeNotifierProvider.notifier);

      notifier.setTheme(AppThemeType.neobank);
      expect(
        container.read(themeNotifierProvider),
        equals(AppThemeType.neobank),
      );

      notifier.setTheme(AppThemeType.retailBank);
      expect(
        container.read(themeNotifierProvider),
        equals(AppThemeType.retailBank),
      );

      notifier.setTheme(AppThemeType.neobank);
      expect(
        container.read(themeNotifierProvider),
        equals(AppThemeType.neobank),
      );
    });
  });

  group('AppThemeType', () {
    test('retailBank has correct display name', () {
      expect(AppThemeType.retailBank.displayName, equals('Retail Bank'));
    });

    test('neobank has correct display name', () {
      expect(AppThemeType.neobank.displayName, equals('Neobank'));
    });

    test('all theme types have display names', () {
      for (final type in AppThemeType.values) {
        expect(type.displayName.isNotEmpty, isTrue);
      }
    });
  });
}
