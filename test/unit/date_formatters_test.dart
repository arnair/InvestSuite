import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/core/utils/date_formatters.dart';

void main() {
  group('DateTimeFormatters', () {
    group('asDateTimeShort', () {
      test('formats date and time correctly', () {
        final date = DateTime(2024, 1, 5, 14, 30);
        expect(date.asDateTimeShort, equals('Jan 5, 14:30'));
      });

      test('formats midnight correctly', () {
        final date = DateTime(2024, 12, 25, 0, 0);
        expect(date.asDateTimeShort, equals('Dec 25, 00:00'));
      });

      test('formats evening time correctly', () {
        final date = DateTime(2024, 6, 15, 23, 59);
        expect(date.asDateTimeShort, equals('Jun 15, 23:59'));
      });
    });

    group('asHour', () {
      test('formats morning hour with am', () {
        final date = DateTime(2024, 1, 1, 9, 30);
        expect(date.asHour, equals('9AM'));
      });

      test('formats afternoon hour with pm', () {
        final date = DateTime(2024, 1, 1, 14, 30);
        expect(date.asHour, equals('2PM'));
      });

      test('formats noon correctly', () {
        final date = DateTime(2024, 1, 1, 12, 0);
        expect(date.asHour, equals('12PM'));
      });

      test('formats midnight correctly', () {
        final date = DateTime(2024, 1, 1, 0, 0);
        expect(date.asHour, equals('12AM'));
      });
    });

    group('asDayOfWeek', () {
      test('formats Monday correctly', () {
        final date = DateTime(2024, 1, 1); // Monday
        expect(date.asDayOfWeek, equals('Mon'));
      });

      test('formats Sunday correctly', () {
        final date = DateTime(2024, 1, 7); // Sunday
        expect(date.asDayOfWeek, equals('Sun'));
      });

      test('formats Friday correctly', () {
        final date = DateTime(2024, 1, 5); // Friday
        expect(date.asDayOfWeek, equals('Fri'));
      });
    });

    group('asMonthDay', () {
      test('formats month and day correctly', () {
        final date = DateTime(2024, 1, 5);
        expect(date.asMonthDay, equals('Jan 5'));
      });

      test('formats end of month correctly', () {
        final date = DateTime(2024, 12, 31);
        expect(date.asMonthDay, equals('Dec 31'));
      });

      test('formats first of month correctly', () {
        final date = DateTime(2024, 6, 1);
        expect(date.asMonthDay, equals('Jun 1'));
      });
    });

    group('asMonth', () {
      test('formats January correctly', () {
        final date = DateTime(2024, 1, 15);
        expect(date.asMonth, equals('Jan'));
      });

      test('formats December correctly', () {
        final date = DateTime(2024, 12, 15);
        expect(date.asMonth, equals('Dec'));
      });

      test('formats June correctly', () {
        final date = DateTime(2024, 6, 15);
        expect(date.asMonth, equals('Jun'));
      });
    });
  });
}
