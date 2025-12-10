import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/features/portfolio/domain/candle_data.dart';

void main() {
  group('CandleData', () {
    test('creates candle with correct values', () {
      final timestamp = DateTime(2024, 1, 15, 10, 30);
      final candle = CandleData(
        timestamp: timestamp,
        open: 100.0,
        high: 105.0,
        low: 98.0,
        close: 103.0,
      );

      expect(candle.open, equals(100.0));
      expect(candle.high, equals(105.0));
      expect(candle.low, equals(98.0));
      expect(candle.close, equals(103.0));
    });

    test('isBullish returns true when close is greater than open', () {
      final candle = CandleData(
        timestamp: DateTime(2024, 1, 15),
        open: 100.0,
        high: 110.0,
        low: 95.0,
        close: 108.0,
      );

      expect(candle.isBullish, isTrue);
    });

    test('isBullish returns true when close equals open', () {
      final candle = CandleData(
        timestamp: DateTime(2024, 1, 15),
        open: 100.0,
        high: 110.0,
        low: 95.0,
        close: 100.0,
      );

      expect(candle.isBullish, isTrue);
    });

    test('isBullish returns false when close is less than open', () {
      final candle = CandleData(
        timestamp: DateTime(2024, 1, 15),
        open: 100.0,
        high: 105.0,
        low: 90.0,
        close: 92.0,
      );

      expect(candle.isBullish, isFalse);
    });

    test('equality works correctly', () {
      final timestamp = DateTime(2024, 1, 15);
      final candle1 = CandleData(
        timestamp: timestamp,
        open: 100.0,
        high: 105.0,
        low: 95.0,
        close: 102.0,
      );

      final candle2 = CandleData(
        timestamp: timestamp,
        open: 100.0,
        high: 105.0,
        low: 95.0,
        close: 102.0,
      );

      expect(candle1, equals(candle2));
    });

    test('copyWith creates new candle with updated values', () {
      final original = CandleData(
        timestamp: DateTime(2024, 1, 15),
        open: 100.0,
        high: 105.0,
        low: 95.0,
        close: 102.0,
      );

      final updated = original.copyWith(close: 110.0);

      expect(updated.close, equals(110.0));
      expect(updated.open, equals(original.open));
      expect(updated.high, equals(original.high));
      expect(updated.low, equals(original.low));
    });

    test('fromJson and toJson work correctly', () {
      final original = CandleData(
        timestamp: DateTime(2024, 1, 15, 10, 30),
        open: 100.0,
        high: 105.0,
        low: 95.0,
        close: 102.0,
      );

      final json = original.toJson();
      final restored = CandleData.fromJson(json);

      expect(restored.open, equals(original.open));
      expect(restored.high, equals(original.high));
      expect(restored.low, equals(original.low));
      expect(restored.close, equals(original.close));
    });
  });
}
