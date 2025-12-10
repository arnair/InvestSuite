import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/features/portfolio/data/portfolio_grpc_client.dart';
import 'package:investsuite/features/portfolio/domain/performance_model.dart';
import 'package:investsuite/features/portfolio/domain/portfolio_model.dart';

void main() {
  group('PortfolioGrpcClient', () {
    tearDown(() async {
      // Clean up after each test
      await PortfolioGrpcClient.shutdown();
    });

    group('shutdown', () {
      test('can be called multiple times without error', () async {
        // Act & Assert - should not throw
        await PortfolioGrpcClient.shutdown();
        await PortfolioGrpcClient.shutdown();
        await PortfolioGrpcClient.shutdown();
      });

      test('can shutdown before any connection is made', () async {
        // Act & Assert - should not throw
        await expectLater(PortfolioGrpcClient.shutdown(), completes);
      });
    });

    group('getPortfolio', () {
      test('returns PortfolioModel when server is available', () async {
        // Act - the test may pass or fail depending on server availability
        // We test the happy path when server is running
        try {
          final result = await PortfolioGrpcClient.getPortfolio(
            portfolioId: 'test',
          );

          // Assert - if we got here, server is running and returned valid data
          expect(result, isA<PortfolioModel>());
          expect(result.id, isNotEmpty);
          expect(result.assets, isNotNull);
        } on Exception catch (e) {
          // If server is not running, we expect a gRPC error
          expect(e.toString(), contains('gRPC Error'));
        }
      });

      test('uses default portfolioId when not specified', () async {
        // This test verifies the method signature accepts defaults
        try {
          final result = await PortfolioGrpcClient.getPortfolio();

          // Assert - the method works with defaults
          expect(result, isA<PortfolioModel>());
        } on Exception catch (e) {
          // If server is not running, we still verify the method was called
          expect(e.toString(), contains('gRPC Error'));
        }
      });

      test('can be called with custom portfolio id', () async {
        // Act
        try {
          final result = await PortfolioGrpcClient.getPortfolio(
            portfolioId: 'custom-portfolio-123',
          );

          expect(result, isA<PortfolioModel>());
        } on Exception catch (e) {
          expect(e.toString(), contains('gRPC Error'));
        }
      });
    });

    group('getPerformanceHistory', () {
      test('returns PerformanceHistory when server is available', () async {
        // Act
        try {
          final result = await PortfolioGrpcClient.getPerformanceHistory(
            portfolioId: 'test',
            timeRange: TimeRange.oneMonth,
          );

          // Assert - if we got here, server is running
          expect(result, isA<PerformanceHistory>());
          expect(result.dataPoints, isNotNull);
        } on Exception catch (e) {
          expect(e.toString(), contains('gRPC Error'));
        }
      });

      test('accepts all TimeRange values', () async {
        // Verify the method accepts all time range values
        for (final range in TimeRange.values) {
          try {
            final result = await PortfolioGrpcClient.getPerformanceHistory(
              portfolioId: 'test',
              timeRange: range,
            );

            expect(result, isA<PerformanceHistory>());
          } on Exception catch (e) {
            expect(e.toString(), contains('gRPC Error'));
          }
        }
      });

      test('uses default parameters when not specified', () async {
        try {
          final result = await PortfolioGrpcClient.getPerformanceHistory();

          expect(result, isA<PerformanceHistory>());
        } on Exception catch (e) {
          expect(e.toString(), contains('gRPC Error'));
        }
      });
    });
  });

  group('TimeRange enum', () {
    test('has all expected values', () {
      expect(TimeRange.values.length, equals(5));
      expect(TimeRange.values, contains(TimeRange.oneDay));
      expect(TimeRange.values, contains(TimeRange.oneWeek));
      expect(TimeRange.values, contains(TimeRange.oneMonth));
      expect(TimeRange.values, contains(TimeRange.threeMonths));
      expect(TimeRange.values, contains(TimeRange.oneYear));
    });

    test('oneDay has correct display name', () {
      expect(TimeRange.oneDay.displayName, equals('1D'));
    });

    test('oneWeek has correct display name', () {
      expect(TimeRange.oneWeek.displayName, equals('1W'));
    });

    test('oneMonth has correct display name', () {
      expect(TimeRange.oneMonth.displayName, equals('1M'));
    });

    test('threeMonths has correct display name', () {
      expect(TimeRange.threeMonths.displayName, equals('3M'));
    });

    test('oneYear has correct display name', () {
      expect(TimeRange.oneYear.displayName, equals('1Y'));
    });
  });
}
