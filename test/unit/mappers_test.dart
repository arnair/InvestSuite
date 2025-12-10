import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/features/portfolio/data/generated/portfolio.pb.dart'
    as pb;
import 'package:investsuite/features/portfolio/data/generated/portfolio.pbenum.dart'
    as pb_enum;
import 'package:investsuite/features/portfolio/data/mappers/asset_mapper.dart';
import 'package:investsuite/features/portfolio/data/mappers/candle_mapper.dart';
import 'package:investsuite/features/portfolio/data/mappers/performance_mapper.dart';
import 'package:investsuite/features/portfolio/data/mappers/portfolio_mapper.dart';
import 'package:investsuite/features/portfolio/domain/asset_model.dart';
import 'package:investsuite/features/portfolio/domain/performance_model.dart';

void main() {
  group('AssetMapper', () {
    test('converts proto Asset to domain AssetModel correctly', () {
      // Arrange
      final protoAsset = pb.Asset(
        id: 'asset-1',
        symbol: 'AAPL',
        name: 'Apple Inc.',
        type: pb_enum.AssetType.ASSET_TYPE_STOCK,
        currentPrice: 178.52,
        percentChange: 2.34,
        quantity: 25.0,
        totalValue: 4463.00,
      );

      // Act
      final domainAsset = protoAsset.toDomain();

      // Assert
      expect(domainAsset.id, equals('asset-1'));
      expect(domainAsset.symbol, equals('AAPL'));
      expect(domainAsset.name, equals('Apple Inc.'));
      expect(domainAsset.type, equals(AssetType.stock));
      expect(domainAsset.currentPrice, equals(178.52));
      expect(domainAsset.percentChange, equals(2.34));
      expect(domainAsset.quantity, equals(25.0));
      expect(domainAsset.totalValue, equals(4463.00));
    });

    test('converts crypto asset type correctly', () {
      // Arrange
      final protoAsset = pb.Asset(
        id: 'btc-1',
        symbol: 'BTC',
        name: 'Bitcoin',
        type: pb_enum.AssetType.ASSET_TYPE_CRYPTO,
        currentPrice: 97500.0,
        percentChange: 5.5,
        quantity: 0.5,
        totalValue: 48750.0,
      );

      // Act
      final domainAsset = protoAsset.toDomain();

      // Assert
      expect(domainAsset.type, equals(AssetType.crypto));
    });

    test('defaults to stock type for unspecified asset type', () {
      // Arrange
      final protoAsset = pb.Asset(
        id: 'unknown-1',
        symbol: 'UNK',
        name: 'Unknown Asset',
        type: pb_enum.AssetType.ASSET_TYPE_UNSPECIFIED,
        currentPrice: 100.0,
        percentChange: 0.0,
        quantity: 1.0,
        totalValue: 100.0,
      );

      // Act
      final domainAsset = protoAsset.toDomain();

      // Assert
      expect(domainAsset.type, equals(AssetType.stock));
    });

    test('defaults to stock type for ETF asset type', () {
      // Arrange
      final protoAsset = pb.Asset(
        id: 'etf-1',
        symbol: 'SPY',
        name: 'SPDR S&P 500',
        type: pb_enum.AssetType.ASSET_TYPE_ETF,
        currentPrice: 450.0,
        percentChange: 1.2,
        quantity: 10.0,
        totalValue: 4500.0,
      );

      // Act
      final domainAsset = protoAsset.toDomain();

      // Assert - ETF maps to stock in current domain model
      expect(domainAsset.type, equals(AssetType.stock));
    });

    test('defaults to stock type for BOND asset type', () {
      // Arrange
      final protoAsset = pb.Asset(
        id: 'bond-1',
        symbol: 'BND',
        name: 'Bond Fund',
        type: pb_enum.AssetType.ASSET_TYPE_BOND,
        currentPrice: 80.0,
        percentChange: 0.5,
        quantity: 50.0,
        totalValue: 4000.0,
      );

      // Act
      final domainAsset = protoAsset.toDomain();

      // Assert
      expect(domainAsset.type, equals(AssetType.stock));
    });
  });

  group('AssetTypeMapper', () {
    test('maps ASSET_TYPE_STOCK to stock', () {
      expect(
        pb_enum.AssetType.ASSET_TYPE_STOCK.toDomain(),
        equals(AssetType.stock),
      );
    });

    test('maps ASSET_TYPE_CRYPTO to crypto', () {
      expect(
        pb_enum.AssetType.ASSET_TYPE_CRYPTO.toDomain(),
        equals(AssetType.crypto),
      );
    });

    test('maps ASSET_TYPE_UNSPECIFIED to stock as default', () {
      expect(
        pb_enum.AssetType.ASSET_TYPE_UNSPECIFIED.toDomain(),
        equals(AssetType.stock),
      );
    });

    test('maps ASSET_TYPE_ETF to stock as default', () {
      expect(
        pb_enum.AssetType.ASSET_TYPE_ETF.toDomain(),
        equals(AssetType.stock),
      );
    });

    test('maps ASSET_TYPE_BOND to stock as default', () {
      expect(
        pb_enum.AssetType.ASSET_TYPE_BOND.toDomain(),
        equals(AssetType.stock),
      );
    });
  });

  group('PerformanceDataPointMapper', () {
    test('converts proto PerformanceDataPoint to domain correctly', () {
      // Arrange
      final timestamp = DateTime(2024, 1, 15, 10, 30);
      final protoDataPoint = pb.PerformanceDataPoint(
        timestamp: Int64(timestamp.millisecondsSinceEpoch),
        value: 52500.0,
      );

      // Act
      final domainDataPoint = protoDataPoint.toDomain();

      // Assert
      expect(domainDataPoint.timestamp, equals(timestamp));
      expect(domainDataPoint.value, equals(52500.0));
    });

    test('handles zero timestamp', () {
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
    });

    test('handles large timestamp values', () {
      // Arrange - year 2030
      final futureDate = DateTime(2030, 12, 31, 23, 59, 59);
      final protoDataPoint = pb.PerformanceDataPoint(
        timestamp: Int64(futureDate.millisecondsSinceEpoch),
        value: 100000.0,
      );

      // Act
      final domainDataPoint = protoDataPoint.toDomain();

      // Assert
      expect(domainDataPoint.timestamp.year, equals(2030));
      expect(domainDataPoint.timestamp.month, equals(12));
    });
  });

  group('PerformanceHistoryMapper', () {
    test('converts proto PerformanceHistory to domain correctly', () {
      // Arrange
      final now = DateTime.now();
      final protoHistory = pb.PerformanceHistory(
        portfolioId: 'portfolio-1',
        dataPoints: [
          pb.PerformanceDataPoint(
            timestamp: Int64(
              now.subtract(const Duration(days: 1)).millisecondsSinceEpoch,
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
      expect(domainHistory.portfolioId, equals('portfolio-1'));
      expect(domainHistory.dataPoints.length, equals(2));
      expect(domainHistory.minValue, equals(50000.0));
      expect(domainHistory.maxValue, equals(52500.0));
    });

    test('converts empty data points list', () {
      // Arrange
      final protoHistory = pb.PerformanceHistory(
        portfolioId: 'empty-portfolio',
        dataPoints: [],
        minValue: 0.0,
        maxValue: 0.0,
      );

      // Act
      final domainHistory = protoHistory.toDomain();

      // Assert
      expect(domainHistory.dataPoints, isEmpty);
      expect(domainHistory.portfolioId, equals('empty-portfolio'));
    });

    test('preserves data points order', () {
      // Arrange
      final protoHistory = pb.PerformanceHistory(
        portfolioId: 'test',
        dataPoints: [
          pb.PerformanceDataPoint(timestamp: Int64(1000), value: 100.0),
          pb.PerformanceDataPoint(timestamp: Int64(2000), value: 200.0),
          pb.PerformanceDataPoint(timestamp: Int64(3000), value: 300.0),
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
  });

  group('TimeRangeMapper', () {
    test('maps oneDay to TIME_RANGE_1D', () {
      expect(
        TimeRange.oneDay.toProto(),
        equals(pb_enum.TimeRange.TIME_RANGE_1D),
      );
    });

    test('maps oneWeek to TIME_RANGE_1W', () {
      expect(
        TimeRange.oneWeek.toProto(),
        equals(pb_enum.TimeRange.TIME_RANGE_1W),
      );
    });

    test('maps oneMonth to TIME_RANGE_1M', () {
      expect(
        TimeRange.oneMonth.toProto(),
        equals(pb_enum.TimeRange.TIME_RANGE_1M),
      );
    });

    test('maps threeMonths to TIME_RANGE_3M', () {
      expect(
        TimeRange.threeMonths.toProto(),
        equals(pb_enum.TimeRange.TIME_RANGE_3M),
      );
    });

    test('maps oneYear to TIME_RANGE_1Y', () {
      expect(
        TimeRange.oneYear.toProto(),
        equals(pb_enum.TimeRange.TIME_RANGE_1Y),
      );
    });

    test('all domain TimeRange values can be mapped to proto', () {
      for (final range in TimeRange.values) {
        expect(range.toProto(), isA<pb_enum.TimeRange>());
      }
    });
  });

  group('PortfolioMapper', () {
    test('converts proto Portfolio to domain PortfolioModel correctly', () {
      // Arrange
      final protoPortfolio = pb.Portfolio(
        id: 'portfolio-1',
        name: 'My Investment Portfolio',
        assets: [
          pb.Asset(
            id: 'asset-1',
            symbol: 'AAPL',
            name: 'Apple Inc.',
            type: pb_enum.AssetType.ASSET_TYPE_STOCK,
            currentPrice: 178.52,
            percentChange: 2.34,
            quantity: 25.0,
            totalValue: 4463.00,
          ),
          pb.Asset(
            id: 'asset-2',
            symbol: 'BTC',
            name: 'Bitcoin',
            type: pb_enum.AssetType.ASSET_TYPE_CRYPTO,
            currentPrice: 97500.0,
            percentChange: -1.5,
            quantity: 0.5,
            totalValue: 48750.0,
          ),
        ],
        totalValue: 53213.00,
        totalPercentChange: 1.75,
      );

      // Act
      final domainPortfolio = protoPortfolio.toDomain();

      // Assert
      expect(domainPortfolio.id, equals('portfolio-1'));
      expect(domainPortfolio.name, equals('My Investment Portfolio'));
      expect(domainPortfolio.assets.length, equals(2));
      expect(domainPortfolio.totalValue, equals(53213.00));
      expect(domainPortfolio.totalPercentChange, equals(1.75));

      // Verify assets are converted correctly
      expect(domainPortfolio.assets[0].symbol, equals('AAPL'));
      expect(domainPortfolio.assets[0].type, equals(AssetType.stock));
      expect(domainPortfolio.assets[1].symbol, equals('BTC'));
      expect(domainPortfolio.assets[1].type, equals(AssetType.crypto));
    });

    test('converts portfolio with empty assets list', () {
      // Arrange
      final protoPortfolio = pb.Portfolio(
        id: 'empty-portfolio',
        name: 'Empty Portfolio',
        assets: [],
        totalValue: 0.0,
        totalPercentChange: 0.0,
      );

      // Act
      final domainPortfolio = protoPortfolio.toDomain();

      // Assert
      expect(domainPortfolio.assets, isEmpty);
      expect(domainPortfolio.totalValue, equals(0.0));
    });

    test('preserves assets order', () {
      // Arrange
      final protoPortfolio = pb.Portfolio(
        id: 'test',
        name: 'Test',
        assets: [
          pb.Asset(id: '1', symbol: 'AAA'),
          pb.Asset(id: '2', symbol: 'BBB'),
          pb.Asset(id: '3', symbol: 'CCC'),
        ],
        totalValue: 0.0,
        totalPercentChange: 0.0,
      );

      // Act
      final domainPortfolio = protoPortfolio.toDomain();

      // Assert
      expect(domainPortfolio.assets[0].symbol, equals('AAA'));
      expect(domainPortfolio.assets[1].symbol, equals('BBB'));
      expect(domainPortfolio.assets[2].symbol, equals('CCC'));
    });
  });

  group('CandleMapper', () {
    test('generates candle data from data points', () {
      // Arrange
      final dataPoints = [
        PerformanceDataPoint(timestamp: DateTime(2024, 1, 1), value: 50000.0),
        PerformanceDataPoint(timestamp: DateTime(2024, 1, 2), value: 51000.0),
        PerformanceDataPoint(timestamp: DateTime(2024, 1, 3), value: 52000.0),
      ];

      // Act
      final candles = CandleMapper.fromDataPoints(dataPoints);

      // Assert
      expect(candles.length, equals(3));
      expect(candles[0].timestamp, equals(DateTime(2024, 1, 1)));
      expect(candles[1].timestamp, equals(DateTime(2024, 1, 2)));
      expect(candles[2].timestamp, equals(DateTime(2024, 1, 3)));
    });

    test('generates OHLC values with realistic volatility', () {
      // Arrange
      final dataPoints = [
        PerformanceDataPoint(timestamp: DateTime(2024, 1, 1), value: 50000.0),
      ];

      // Act
      final candles = CandleMapper.fromDataPoints(dataPoints);

      // Assert
      final candle = candles.first;
      // High should be >= both open and close
      expect(candle.high, greaterThanOrEqualTo(candle.open));
      expect(candle.high, greaterThanOrEqualTo(candle.close));
      // Low should be <= both open and close
      expect(candle.low, lessThanOrEqualTo(candle.open));
      expect(candle.low, lessThanOrEqualTo(candle.close));
    });

    test('generates consistent candles for same input', () {
      // Arrange
      final dataPoints = [
        PerformanceDataPoint(timestamp: DateTime(2024, 1, 1), value: 50000.0),
      ];

      // Act - generate twice
      final candles1 = CandleMapper.fromDataPoints(dataPoints);
      final candles2 = CandleMapper.fromDataPoints(dataPoints);

      // Assert - should be deterministic
      expect(candles1.first.open, equals(candles2.first.open));
      expect(candles1.first.high, equals(candles2.first.high));
      expect(candles1.first.low, equals(candles2.first.low));
      expect(candles1.first.close, equals(candles2.first.close));
    });

    test('handles empty data points', () {
      // Arrange
      final dataPoints = <PerformanceDataPoint>[];

      // Act
      final candles = CandleMapper.fromDataPoints(dataPoints);

      // Assert
      expect(candles, isEmpty);
    });

    test('volatility is proportional to value', () {
      // Arrange
      final smallValue = PerformanceDataPoint(
        timestamp: DateTime(2024, 1, 1),
        value: 1000.0,
      );
      final largeValue = PerformanceDataPoint(
        timestamp: DateTime(2024, 1, 1),
        value: 100000.0,
      );

      // Act
      final smallCandles = CandleMapper.fromDataPoints([smallValue]);
      final largeCandles = CandleMapper.fromDataPoints([largeValue]);

      // Assert - larger values should have larger absolute volatility
      final smallRange = smallCandles.first.high - smallCandles.first.low;
      final largeRange = largeCandles.first.high - largeCandles.first.low;
      expect(largeRange, greaterThan(smallRange));
    });
  });
}
