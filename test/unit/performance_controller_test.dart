import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:investsuite/features/portfolio/data/portfolio_repository.dart';
import 'package:investsuite/features/portfolio/domain/performance_model.dart';
import 'package:investsuite/features/portfolio/presentation/performance_controller.dart';

import '../helpers/mock_repository.dart';
import '../helpers/test_data.dart';

void main() {
  late MockPortfolioRepository mockRepository;

  setUpAll(() {
    // Register fallback values for mocktail
    registerFallbackValue(TimeRange.oneMonth);
  });

  setUp(() {
    mockRepository = MockPortfolioRepository();
  });

  group('SelectedTimeRange', () {
    test('initial value is oneMonth', () {
      // Arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Act
      final timeRange = container.read(selectedTimeRangeProvider);

      // Assert
      expect(timeRange, equals(TimeRange.oneMonth));
    });

    test('setTimeRange updates state', () {
      // Arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Act
      container
          .read(selectedTimeRangeProvider.notifier)
          .setTimeRange(TimeRange.oneYear);

      // Assert
      expect(
        container.read(selectedTimeRangeProvider),
        equals(TimeRange.oneYear),
      );
    });

    test('can cycle through all time ranges', () {
      // Arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(selectedTimeRangeProvider.notifier);

      // Act & Assert
      for (final range in TimeRange.values) {
        notifier.setTimeRange(range);
        expect(container.read(selectedTimeRangeProvider), equals(range));
      }
    });
  });

  group('PerformanceController', () {
    test('initial state is loading', () {
      // Arrange
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => TestData.createPerformanceHistory());

      final container = ProviderContainer(
        overrides: [
          portfolioRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
      addTearDown(container.dispose);

      // Act
      final state = container.read(performanceControllerProvider);

      // Assert
      expect(state.isLoading, isTrue);
    });

    test('mock repository can be configured', () async {
      // Arrange
      final testHistory = TestData.createPerformanceHistory(
        portfolioId: 'test-portfolio',
      );
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => testHistory);

      // Act
      final result = await mockRepository.getPerformanceHistory(
        portfolioId: 'default',
        timeRange: TimeRange.oneMonth,
      );

      // Assert
      expect(result.portfolioId, equals('test-portfolio'));
      verify(
        () => mockRepository.getPerformanceHistory(
          portfolioId: 'default',
          timeRange: TimeRange.oneMonth,
        ),
      ).called(1);
    });

    test('mock repository can simulate errors', () async {
      // Arrange
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenThrow(Exception('Network error'));

      // Act & Assert
      expect(
        () => mockRepository.getPerformanceHistory(
          portfolioId: 'default',
          timeRange: TimeRange.oneMonth,
        ),
        throwsException,
      );
    });
  });

  group('PerformanceHistory calculations', () {
    test('percentageChange is calculated correctly', () {
      // Arrange
      final history = TestData.createPerformanceHistory(
        dataPoints: [
          TestData.createDataPoint(
            timestamp: DateTime(2024, 1, 1),
            value: 50000.0,
          ),
          TestData.createDataPoint(
            timestamp: DateTime(2024, 1, 15),
            value: 52500.0,
          ),
        ],
      );

      // Assert
      expect(history.percentageChange, equals(5.0));
      expect(history.isPositive, isTrue);
    });

    test('absoluteChange is calculated correctly', () {
      // Arrange
      final history = TestData.createPerformanceHistory(
        dataPoints: [
          TestData.createDataPoint(
            timestamp: DateTime(2024, 1, 1),
            value: 50000.0,
          ),
          TestData.createDataPoint(
            timestamp: DateTime(2024, 1, 15),
            value: 52500.0,
          ),
        ],
      );

      // Assert
      expect(history.absoluteChange, equals(2500.0));
    });

    test('empty history returns 0 for calculations', () {
      // Arrange
      final emptyHistory = TestData.createEmptyPerformanceHistory();

      // Assert
      expect(emptyHistory.percentageChange, equals(0.0));
      expect(emptyHistory.absoluteChange, equals(0.0));
      expect(emptyHistory.isPositive, isTrue); // 0 is considered positive
    });

    test('negative performance is calculated correctly', () {
      // Arrange
      final history = TestData.createPerformanceHistory(
        dataPoints: [
          TestData.createDataPoint(
            timestamp: DateTime(2024, 1, 1),
            value: 50000.0,
          ),
          TestData.createDataPoint(
            timestamp: DateTime(2024, 1, 15),
            value: 47500.0,
          ),
        ],
      );

      // Assert
      expect(history.percentageChange, equals(-5.0));
      expect(history.absoluteChange, equals(-2500.0));
      expect(history.isPositive, isFalse);
    });

    test('handles single data point', () {
      // Arrange
      final history = TestData.createPerformanceHistory(
        dataPoints: [
          TestData.createDataPoint(
            timestamp: DateTime(2024, 1, 1),
            value: 50000.0,
          ),
        ],
      );

      // Assert - first and last are the same
      expect(history.percentageChange, equals(0.0));
      expect(history.absoluteChange, equals(0.0));
    });
  });

  group('TimeRange', () {
    test('all time ranges have display names', () {
      for (final range in TimeRange.values) {
        expect(range.displayName, isNotEmpty);
      }
    });

    test('display names are correct', () {
      expect(TimeRange.oneDay.displayName, equals('1D'));
      expect(TimeRange.oneWeek.displayName, equals('1W'));
      expect(TimeRange.oneMonth.displayName, equals('1M'));
      expect(TimeRange.threeMonths.displayName, equals('3M'));
      expect(TimeRange.oneYear.displayName, equals('1Y'));
    });

    test('formatDate returns non-empty strings', () {
      final now = DateTime.now();
      for (final range in TimeRange.values) {
        expect(range.formatDate(now), isNotEmpty);
      }
    });
  });
}
