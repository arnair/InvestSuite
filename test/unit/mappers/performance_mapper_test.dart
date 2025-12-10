import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/features/portfolio/data/generated/portfolio.pb.dart'
    as pb;
import 'package:investsuite/features/portfolio/data/generated/portfolio.pbenum.dart'
    as pb_enum;
import 'package:investsuite/features/portfolio/data/mappers/performance_mapper.dart';
import 'package:investsuite/features/portfolio/domain/performance_model.dart';

void main() {
  group('PerformanceDataPointMapper', () {
    test('toDomain converts proto PerformanceDataPoint correctly', () {
      // Arrange
      final timestamp = DateTime(2024, 1, 15, 10, 30);
      final protoDataPoint = pb.PerformanceDataPoint(
        timestamp: Int64(timestamp.millisecondsSinceEpoch),
        value: 52500.0,
      );

      // Act
      final domainDataPoint = protoDataPoint.toDomain();

      // Assert
      expect(
        domainDataPoint.timestamp.millisecondsSinceEpoch,
        equals(timestamp.millisecondsSinceEpoch),
      );
      expect(domainDataPoint.value, equals(52500.0));
    });

    test('toDomain handles zero timestamp', () {
      // Arrange
      final protoDataPoint = pb.PerformanceDataPoint(
        timestamp: Int64.ZERO,
        value: 1000.0,
      );

      // Act
      final domainDataPoint = protoDataPoint.toDomain();

      // Assert
      expect(
        domainDataPoint.timestamp,
        equals(DateTime.fromMillisecondsSinceEpoch(0)),
      );
      expect(domainDataPoint.value, equals(1000.0));
    });

    test('toDomain handles large values', () {
      // Arrange
      final protoDataPoint = pb.PerformanceDataPoint(
        timestamp: Int64(DateTime.now().millisecondsSinceEpoch),
        value: 1000000000.50,
      );

      // Act
      final domainDataPoint = protoDataPoint.toDomain();

      // Assert
      expect(domainDataPoint.value, equals(1000000000.50));
    });
  });

  group('PerformanceHistoryMapper', () {
    test('toDomain converts proto PerformanceHistory correctly', () {
      // Arrange
      final now = DateTime.now();
      final protoHistory = pb.PerformanceHistory(
        portfolioId: 'portfolio-1',
        dataPoints: [
          pb.PerformanceDataPoint(
            timestamp: Int64(
              now.subtract(const Duration(days: 30)).millisecondsSinceEpoch,
            ),
            value: 50000.0,
          ),
          pb.PerformanceDataPoint(
            timestamp: Int64(now.millisecondsSinceEpoch),
            value: 52500.0,
          ),
        ],
        minValue: 48000.0,
        maxValue: 55000.0,
      );

      // Act
      final domainHistory = protoHistory.toDomain();

      // Assert
      expect(domainHistory.portfolioId, equals('portfolio-1'));
      expect(domainHistory.dataPoints.length, equals(2));
      expect(domainHistory.minValue, equals(48000.0));
      expect(domainHistory.maxValue, equals(55000.0));
      expect(domainHistory.dataPoints.first.value, equals(50000.0));
      expect(domainHistory.dataPoints.last.value, equals(52500.0));
    });

    test('toDomain handles empty data points', () {
      // Arrange
      final protoHistory = pb.PerformanceHistory(
        portfolioId: 'portfolio-empty',
        minValue: 0.0,
        maxValue: 0.0,
      );

      // Act
      final domainHistory = protoHistory.toDomain();

      // Assert
      expect(domainHistory.portfolioId, equals('portfolio-empty'));
      expect(domainHistory.dataPoints, isEmpty);
      expect(domainHistory.minValue, equals(0.0));
      expect(domainHistory.maxValue, equals(0.0));
    });

    test('toDomain preserves data point order', () {
      // Arrange
      final now = DateTime.now();
      final protoHistory = pb.PerformanceHistory(
        portfolioId: 'portfolio-1',
        dataPoints: [
          pb.PerformanceDataPoint(
            timestamp: Int64(
              now.subtract(const Duration(days: 2)).millisecondsSinceEpoch,
            ),
            value: 100.0,
          ),
          pb.PerformanceDataPoint(
            timestamp: Int64(
              now.subtract(const Duration(days: 1)).millisecondsSinceEpoch,
            ),
            value: 200.0,
          ),
          pb.PerformanceDataPoint(
            timestamp: Int64(now.millisecondsSinceEpoch),
            value: 300.0,
          ),
        ],
        minValue: 100.0,
        maxValue: 300.0,
      );

      // Act
      final domainHistory = protoHistory.toDomain();

      // Assert
      expect(domainHistory.dataPoints[0].value, equals(100.0));
      expect(domainHistory.dataPoints[1].value, equals(200.0));
      expect(domainHistory.dataPoints[2].value, equals(300.0));
    });

    test(
      'domain PerformanceHistory calculates percentage change correctly',
      () {
        // Arrange
        final now = DateTime.now();
        final protoHistory = pb.PerformanceHistory(
          portfolioId: 'portfolio-1',
          dataPoints: [
            pb.PerformanceDataPoint(
              timestamp: Int64(
                now.subtract(const Duration(days: 30)).millisecondsSinceEpoch,
              ),
              value: 50000.0,
            ),
            pb.PerformanceDataPoint(
              timestamp: Int64(now.millisecondsSinceEpoch),
              value: 52500.0,
            ),
          ],
          minValue: 50000.0,
          maxValue: 52500.0,
        );

        // Act
        final domainHistory = protoHistory.toDomain();

        // Assert
        expect(
          domainHistory.percentageChange,
          equals(5.0),
        ); // (52500 - 50000) / 50000 * 100
        expect(domainHistory.absoluteChange, equals(2500.0));
        expect(domainHistory.isPositive, isTrue);
      },
    );
  });

  group('TimeRangeMapper', () {
    test('TimeRange.oneDay maps to TIME_RANGE_1D', () {
      expect(
        TimeRange.oneDay.toProto(),
        equals(pb_enum.TimeRange.TIME_RANGE_1D),
      );
    });

    test('TimeRange.oneWeek maps to TIME_RANGE_1W', () {
      expect(
        TimeRange.oneWeek.toProto(),
        equals(pb_enum.TimeRange.TIME_RANGE_1W),
      );
    });

    test('TimeRange.oneMonth maps to TIME_RANGE_1M', () {
      expect(
        TimeRange.oneMonth.toProto(),
        equals(pb_enum.TimeRange.TIME_RANGE_1M),
      );
    });

    test('TimeRange.threeMonths maps to TIME_RANGE_3M', () {
      expect(
        TimeRange.threeMonths.toProto(),
        equals(pb_enum.TimeRange.TIME_RANGE_3M),
      );
    });

    test('TimeRange.oneYear maps to TIME_RANGE_1Y', () {
      expect(
        TimeRange.oneYear.toProto(),
        equals(pb_enum.TimeRange.TIME_RANGE_1Y),
      );
    });

    test('all domain TimeRange values have proto mappings', () {
      // Verify each domain TimeRange can be converted to proto
      for (final range in TimeRange.values) {
        expect(range.toProto(), isA<pb_enum.TimeRange>());
      }
    });
  });
}
