import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/core/theme/app_theme.dart';

void main() {
  group('AppColors', () {
    group('retailBank', () {
      test('has correct positive color', () {
        expect(AppColors.retailBank.positive, equals(const Color(0xFF2E7D32)));
      });

      test('has correct negative color', () {
        expect(AppColors.retailBank.negative, equals(const Color(0xFFC62828)));
      });

      test('has correct chart line color', () {
        expect(AppColors.retailBank.chartLine, equals(const Color(0xFF1565C0)));
      });
    });

    group('neobank', () {
      test('has correct positive color', () {
        expect(AppColors.neobank.positive, equals(const Color(0xFF00FF94)));
      });

      test('has correct negative color', () {
        expect(AppColors.neobank.negative, equals(const Color(0xFFFF6B6B)));
      });

      test('has correct chart line color', () {
        expect(AppColors.neobank.chartLine, equals(const Color(0xFF00FF94)));
      });
    });

    group('copyWith', () {
      test('creates copy with updated positive color', () {
        const original = AppColors.retailBank;
        final copy = original.copyWith(positive: Colors.purple);

        expect(copy.positive, equals(Colors.purple));
        expect(copy.negative, equals(original.negative));
        expect(copy.chartLine, equals(original.chartLine));
      });

      test('creates copy with updated negative color', () {
        const original = AppColors.neobank;
        final copy = original.copyWith(negative: Colors.orange);

        expect(copy.negative, equals(Colors.orange));
        expect(copy.positive, equals(original.positive));
      });

      test('creates copy with all values when none specified', () {
        const original = AppColors.retailBank;
        final copy = original.copyWith();

        expect(copy.positive, equals(original.positive));
        expect(copy.negative, equals(original.negative));
        expect(copy.chartLine, equals(original.chartLine));
        expect(copy.chartGradientStart, equals(original.chartGradientStart));
        expect(copy.chartGradientEnd, equals(original.chartGradientEnd));
      });
    });

    group('lerp', () {
      test('lerps between two AppColors at t=0', () {
        const start = AppColors.retailBank;
        const end = AppColors.neobank;

        final result = start.lerp(end, 0.0);

        expect(result.positive, equals(start.positive));
        expect(result.negative, equals(start.negative));
      });

      test('lerps between two AppColors at t=1', () {
        const start = AppColors.retailBank;
        const end = AppColors.neobank;

        final result = start.lerp(end, 1.0);

        expect(result.positive, equals(end.positive));
        expect(result.negative, equals(end.negative));
      });

      test('lerps between two AppColors at t=0.5', () {
        const start = AppColors.retailBank;
        const end = AppColors.neobank;

        final result = start.lerp(end, 0.5);

        // At 0.5, colors should be interpolated
        expect(result.positive, isNot(equals(start.positive)));
        expect(result.positive, isNot(equals(end.positive)));
      });

      test('returns this when other is not AppColors', () {
        const colors = AppColors.retailBank;

        final result = colors.lerp(null, 0.5);

        expect(result, equals(colors));
      });
    });
  });
}
