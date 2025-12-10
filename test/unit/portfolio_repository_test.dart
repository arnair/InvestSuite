import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:investsuite/features/portfolio/data/portfolio_repository.dart';
import 'package:investsuite/features/portfolio/domain/performance_model.dart';
import 'package:investsuite/features/portfolio/domain/portfolio_model.dart';

import '../helpers/mock_repository.dart';
import '../helpers/test_data.dart';

void main() {
  late MockPortfolioRepository mockRepository;

  setUpAll(() {
    registerFallbackValue(TimeRange.oneMonth);
  });

  setUp(() {
    mockRepository = MockPortfolioRepository();
  });

  group('PortfolioRepository interface', () {
    test('getPortfolio returns PortfolioModel', () async {
      // Arrange
      final expectedPortfolio = TestData.createPortfolio();
      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenAnswer((_) async => expectedPortfolio);

      // Act
      final result = await mockRepository.getPortfolio(portfolioId: 'test-id');

      // Assert
      expect(result, isA<PortfolioModel>());
      expect(result.id, equals(expectedPortfolio.id));
      verify(
        () => mockRepository.getPortfolio(portfolioId: 'test-id'),
      ).called(1);
    });

    test('getPortfolio uses default portfolio id', () async {
      // Arrange
      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenAnswer((_) async => TestData.createPortfolio());

      // Act
      await mockRepository.getPortfolio();

      // Assert
      verify(
        () => mockRepository.getPortfolio(portfolioId: 'default'),
      ).called(1);
    });

    test('getPerformanceHistory returns PerformanceHistory', () async {
      // Arrange
      final expectedHistory = TestData.createPerformanceHistory();
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => expectedHistory);

      // Act
      final result = await mockRepository.getPerformanceHistory(
        portfolioId: 'test-id',
        timeRange: TimeRange.oneMonth,
      );

      // Assert
      expect(result, isA<PerformanceHistory>());
      expect(result.portfolioId, equals(expectedHistory.portfolioId));
    });

    test('getPerformanceHistory uses default parameters', () async {
      // Arrange
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => TestData.createPerformanceHistory());

      // Act
      await mockRepository.getPerformanceHistory();

      // Assert
      verify(
        () => mockRepository.getPerformanceHistory(
          portfolioId: 'default',
          timeRange: TimeRange.oneMonth,
        ),
      ).called(1);
    });

    test('getPerformanceHistory accepts different time ranges', () async {
      // Arrange
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => TestData.createPerformanceHistory());

      // Act & Assert - test all time ranges
      for (final range in TimeRange.values) {
        await mockRepository.getPerformanceHistory(
          portfolioId: 'test',
          timeRange: range,
        );
        verify(
          () => mockRepository.getPerformanceHistory(
            portfolioId: 'test',
            timeRange: range,
          ),
        ).called(1);
      }
    });

    test('getPortfolio throws exception on error', () async {
      // Arrange
      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenThrow(Exception('Network error'));

      // Act & Assert
      expect(
        () => mockRepository.getPortfolio(portfolioId: 'test'),
        throwsException,
      );
    });

    test('getPerformanceHistory throws exception on error', () async {
      // Arrange
      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenThrow(Exception('Server unavailable'));

      // Act & Assert
      expect(
        () => mockRepository.getPerformanceHistory(
          portfolioId: 'test',
          timeRange: TimeRange.oneMonth,
        ),
        throwsException,
      );
    });
  });

  group('PortfolioGrpcRepository', () {
    test('implements PortfolioRepository interface', () {
      // Arrange & Act
      final repository = PortfolioGrpcRepository();

      // Assert
      expect(repository, isA<PortfolioRepository>());
    });
  });

  group('portfolioRepositoryProvider', () {
    test('provides PortfolioRepository instance', () {
      // Arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Act
      final repository = container.read(portfolioRepositoryProvider);

      // Assert
      expect(repository, isA<PortfolioRepository>());
    });

    test('can be overridden with mock', () {
      // Arrange
      final mockRepo = MockPortfolioRepository();
      final container = ProviderContainer(
        overrides: [portfolioRepositoryProvider.overrideWithValue(mockRepo)],
      );
      addTearDown(container.dispose);

      // Act
      final repository = container.read(portfolioRepositoryProvider);

      // Assert
      expect(repository, equals(mockRepo));
    });
  });

  group('Repository with complex data', () {
    test('handles portfolio with many assets', () async {
      // Arrange
      final assets = List.generate(
        50,
        (i) => TestData.createAsset(
          id: 'asset-$i',
          symbol: 'SYM$i',
          name: 'Asset $i',
          currentPrice: 100.0 + i,
        ),
      );
      final largePortfolio = TestData.createPortfolio(assets: assets);

      when(
        () =>
            mockRepository.getPortfolio(portfolioId: any(named: 'portfolioId')),
      ).thenAnswer((_) async => largePortfolio);

      // Act
      final result = await mockRepository.getPortfolio();

      // Assert
      expect(result.assets.length, equals(50));
      expect(result.assets.first.symbol, equals('SYM0'));
      expect(result.assets.last.symbol, equals('SYM49'));
    });

    test('handles performance history with many data points', () async {
      // Arrange
      final dataPoints = List.generate(
        365,
        (i) => TestData.createDataPoint(
          timestamp: DateTime.now().subtract(Duration(days: 365 - i)),
          value: 50000.0 + (i * 10),
        ),
      );
      final longHistory = TestData.createPerformanceHistory(
        dataPoints: dataPoints,
      );

      when(
        () => mockRepository.getPerformanceHistory(
          portfolioId: any(named: 'portfolioId'),
          timeRange: any(named: 'timeRange'),
        ),
      ).thenAnswer((_) async => longHistory);

      // Act
      final result = await mockRepository.getPerformanceHistory(
        timeRange: TimeRange.oneYear,
      );

      // Assert
      expect(result.dataPoints.length, equals(365));
    });
  });
}
