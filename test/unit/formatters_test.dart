import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/core/utils/formatters.dart';

void main() {
  group('NumberFormatters', () {
    group('asCurrency', () {
      test('formats positive number with 2 decimal places', () {
        expect(1234.56.asCurrency, equals('\$1234.56'));
      });

      test('formats zero correctly', () {
        expect(0.0.asCurrency, equals('\$0.00'));
      });

      test('formats negative number', () {
        expect((-123.45).asCurrency, equals('\$-123.45'));
      });

      test('rounds to 2 decimal places', () {
        expect(99.999.asCurrency, equals('\$100.00'));
      });

      test('formats small decimal values', () {
        expect(0.01.asCurrency, equals('\$0.01'));
      });
    });

    group('asCurrencyWhole', () {
      test('formats positive number without decimals', () {
        expect(1234.56.asCurrencyWhole, equals('\$1235'));
      });

      test('formats zero correctly', () {
        expect(0.0.asCurrencyWhole, equals('\$0'));
      });

      test('rounds up when decimal >= 0.5', () {
        expect(99.5.asCurrencyWhole, equals('\$100'));
      });

      test('rounds down when decimal < 0.5', () {
        expect(99.4.asCurrencyWhole, equals('\$99'));
      });
    });

    group('asCurrencyWithSign', () {
      test('formats positive number with plus sign', () {
        expect(123.45.asCurrencyWithSign, equals('+\$123'));
      });

      test('formats negative number shows absolute value', () {
        // Note: Implementation uses abs() so negative numbers show without sign prefix
        expect((-123.45).asCurrencyWithSign, equals('\$123'));
      });

      test('formats zero with plus sign', () {
        expect(0.0.asCurrencyWithSign, equals('+\$0'));
      });

      test('formats large positive number', () {
        expect(50000.0.asCurrencyWithSign, equals('+\$50000'));
      });

      test('formats large negative number shows absolute value', () {
        // Note: Implementation uses abs() so negative numbers show without sign prefix
        expect((-25000.0).asCurrencyWithSign, equals('\$25000'));
      });
    });

    group('asCurrencyCompact', () {
      test('formats thousands with k suffix', () {
        expect(12345.0.asCurrencyCompact, equals('\$12.3k'));
      });

      test('formats exact thousands', () {
        expect(50000.0.asCurrencyCompact, equals('\$50.0k'));
      });

      test('formats small values', () {
        expect(500.0.asCurrencyCompact, equals('\$0.5k'));
      });

      test('formats very small values', () {
        expect(100.0.asCurrencyCompact, equals('\$0.1k'));
      });
    });

    group('asPercentWithSign', () {
      test('formats positive percentage with plus sign', () {
        expect(12.34.asPercentWithSign, equals('+12.34%'));
      });

      test('formats negative percentage with minus sign', () {
        expect((-5.67).asPercentWithSign, equals('-5.67%'));
      });

      test('formats zero with plus sign', () {
        expect(0.0.asPercentWithSign, equals('+0.00%'));
      });

      test('formats small positive percentage', () {
        expect(0.01.asPercentWithSign, equals('+0.01%'));
      });

      test('formats large percentage', () {
        expect(100.0.asPercentWithSign, equals('+100.00%'));
      });
    });

    group('isPositiveChange', () {
      test('returns true for positive value', () {
        expect(5.0.isPositiveChange, isTrue);
      });

      test('returns true for zero', () {
        expect(0.0.isPositiveChange, isTrue);
      });

      test('returns false for negative value', () {
        expect((-1.0).isPositiveChange, isFalse);
      });

      test('returns false for small negative value', () {
        expect((-0.01).isPositiveChange, isFalse);
      });
    });
  });
}
