import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/core/theme/app_theme.dart';

void main() {
  group('AppTheme', () {
    group('theme constants', () {
      test('neobankAccent is correct color', () {
        expect(AppTheme.neobankAccent, equals(const Color(0xFF00FF94)));
      });

      test('neobankBackground is correct color', () {
        expect(AppTheme.neobankBackground, equals(const Color(0xFF161B22)));
      });

      test('neobankSurface is correct color', () {
        expect(AppTheme.neobankSurface, equals(const Color(0xFF0D1117)));
      });

      test('retailBankPrimary is correct color', () {
        expect(AppTheme.retailBankPrimary, equals(const Color(0xFF1565C0)));
      });
    });

    group('chartLineColor', () {
      test('returns blue for retail bank', () {
        expect(
          AppTheme.chartLineColor(AppThemeType.retailBank),
          equals(const Color(0xFF1565C0)),
        );
      });

      test('returns neon green for neobank', () {
        expect(
          AppTheme.chartLineColor(AppThemeType.neobank),
          equals(const Color(0xFF00FF94)),
        );
      });
    });

    group('chartGradientStart', () {
      test('returns blue with opacity for retail bank', () {
        final color = AppTheme.chartGradientStart(AppThemeType.retailBank);
        // Check RGB values using non-deprecated API
        expect((color.r * 255).round(), equals(21));
        expect((color.g * 255).round(), equals(101));
        expect((color.b * 255).round(), equals(192));
      });

      test('returns neon green with opacity for neobank', () {
        final color = AppTheme.chartGradientStart(AppThemeType.neobank);
        expect((color.r * 255).round(), equals(0));
        expect((color.g * 255).round(), equals(255));
        expect((color.b * 255).round(), equals(148));
      });
    });

    group('chartGradientEnd', () {
      test('returns transparent blue for retail bank', () {
        final color = AppTheme.chartGradientEnd(AppThemeType.retailBank);
        expect(color.a, equals(0.0));
      });

      test('returns transparent green for neobank', () {
        final color = AppTheme.chartGradientEnd(AppThemeType.neobank);
        expect(color.a, equals(0.0));
      });
    });

    group('positiveColor', () {
      test('returns green for retail bank', () {
        expect(
          AppTheme.positiveColor(AppThemeType.retailBank),
          equals(const Color(0xFF2E7D32)),
        );
      });

      test('returns neon green for neobank', () {
        expect(
          AppTheme.positiveColor(AppThemeType.neobank),
          equals(const Color(0xFF00FF94)),
        );
      });
    });

    group('negativeColor', () {
      test('returns red for retail bank', () {
        expect(
          AppTheme.negativeColor(AppThemeType.retailBank),
          equals(const Color(0xFFC62828)),
        );
      });

      test('returns coral red for neobank', () {
        expect(
          AppTheme.negativeColor(AppThemeType.neobank),
          equals(const Color(0xFFFF6B6B)),
        );
      });
    });
  });

  group('AppThemeType', () {
    test('displayName returns Retail Bank', () {
      expect(AppThemeType.retailBank.displayName, equals('Retail Bank'));
    });

    test('displayName returns Neobank', () {
      expect(AppThemeType.neobank.displayName, equals('Neobank'));
    });
  });
}
