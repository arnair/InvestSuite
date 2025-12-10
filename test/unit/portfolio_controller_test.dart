import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:investsuite/features/portfolio/data/portfolio_repository.dart';
import 'package:investsuite/features/portfolio/domain/performance_model.dart';
import 'package:investsuite/features/portfolio/presentation/portfolio_controller.dart';

import '../helpers/mock_repository.dart';
import '../helpers/test_data.dart';

void main() {
  late MockPortfolioRepository mockRepository;
  late ProviderContainer container;

  setUpAll(() {
    // Register fallback values for mocktail
    registerFallbackValue(TimeRange.oneMonth);
  });

  setUp(() {
    mockRepository = MockPortfolioRepository();
  });

  tearDown(() {
    container.dispose();
  });

  ProviderContainer createTestContainer() {
    return ProviderContainer(
      overrides: [
        portfolioRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
  }

  group('PortfolioController', () {
    test('initial state is loading', () {
      // Arrange
      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenAnswer((_) async => TestData.createPortfolio());
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => TestData.createPerformanceHistory());

      container = createTestContainer();

      // Act
      final state = container.read(portfolioControllerProvider);

      // Assert
      expect(state.isLoading, isTrue);
    });

    test('refresh fetches portfolio data', () async {
      // Arrange
      final testPortfolio = TestData.createPortfolio();
      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenAnswer((_) async => testPortfolio);
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => TestData.createPerformanceHistory());

      container = createTestContainer();

      // Act
      await container.read(portfolioControllerProvider.notifier).refresh();

      final state = container.read(portfolioControllerProvider);

      // Assert
      expect(state.hasValue, isTrue);
      expect(state.value, equals(testPortfolio));
      verify(
        () => mockRepository.getPortfolio(portfolioId: 'default'),
      ).called(greaterThanOrEqualTo(1));
    });

    test('refresh handles error gracefully', () async {
      // Arrange
      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenThrow(Exception('Network error'));
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => TestData.createPerformanceHistory());

      container = createTestContainer();

      // Act
      await container.read(portfolioControllerProvider.notifier).refresh();

      final state = container.read(portfolioControllerProvider);

      // Assert
      expect(state.hasError, isTrue);
    });

    test('repository is called with correct portfolio id', () async {
      // Arrange
      final testPortfolio = TestData.createPortfolio();
      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenAnswer((_) async => testPortfolio);
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => TestData.createPerformanceHistory());

      container = createTestContainer();

      // Act
      await container.read(portfolioControllerProvider.notifier).refresh();

      // Assert
      verify(
        () => mockRepository.getPortfolio(portfolioId: 'default'),
      ).called(1);
    });
  });

  group('PortfolioSummary', () {
    test('returns null when portfolio is loading', () {
      // Arrange
      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenAnswer((_) async => TestData.createPortfolio());
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => TestData.createPerformanceHistory());

      container = createTestContainer();

      // Act
      final summary = container.read(portfolioSummaryProvider);

      // Assert
      expect(summary, isNull);
    });

    test('returns summary when portfolio is loaded', () async {
      // Arrange
      final testPortfolio = TestData.createPortfolio(
        totalValue: 55000.0,
        totalPercentChange: 3.5,
      );
      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenAnswer((_) async => testPortfolio);
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => TestData.createPerformanceHistory());

      container = createTestContainer();

      // Wait for load via refresh
      await container.read(portfolioControllerProvider.notifier).refresh();

      // Act
      final summary = container.read(portfolioSummaryProvider);

      // Assert
      expect(summary, isNotNull);
      expect(summary!.totalValue, equals(55000.0));
      expect(summary.totalPercentChange, equals(3.5));
      expect(summary.isPositive, isTrue);
    });

    test('calculates profit/loss from initial investment', () async {
      // Arrange
      final testPortfolio = TestData.createPortfolio(totalValue: 55000.0);
      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenAnswer((_) async => testPortfolio);
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => TestData.createPerformanceHistory());

      container = createTestContainer();

      // Wait for load
      await container.read(portfolioControllerProvider.notifier).refresh();

      // Act
      final summary = container.read(portfolioSummaryProvider);

      // Assert - initial investment is 50000
      expect(summary!.profitLoss, equals(5000.0));
      expect(summary.profitLossPercent, equals(10.0));
      expect(summary.isProfitPositive, isTrue);
    });

    test('handles negative profit/loss', () async {
      // Arrange
      final testPortfolio = TestData.createPortfolio(
        totalValue: 45000.0,
        totalPercentChange: -10.0,
      );
      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenAnswer((_) async => testPortfolio);
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => TestData.createPerformanceHistory());

      container = createTestContainer();

      // Wait for load
      await container.read(portfolioControllerProvider.notifier).refresh();

      // Act
      final summary = container.read(portfolioSummaryProvider);

      // Assert
      expect(summary!.profitLoss, equals(-5000.0));
      expect(summary.isProfitPositive, isFalse);
      expect(summary.isPositive, isFalse);
    });
  });

  group('PortfolioSummary formatting', () {
    test('formats currency values correctly', () async {
      // Arrange
      final testPortfolio = TestData.createPortfolio(totalValue: 55123.45);
      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenAnswer((_) async => testPortfolio);
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => TestData.createPerformanceHistory());

      container = createTestContainer();

      await container.read(portfolioControllerProvider.notifier).refresh();

      // Act
      final summary = container.read(portfolioSummaryProvider);

      // Assert - check that formatting produces a string with the value
      expect(summary!.formattedTotalValue, contains('55123'));
      expect(summary.formattedInitialInvestment, contains('50000'));
    });
  });
}
