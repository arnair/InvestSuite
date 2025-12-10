import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/features/portfolio/data/generated/portfolio.pb.dart'
    as pb;
import 'package:investsuite/features/portfolio/data/generated/portfolio.pbenum.dart'
    as pb_enum;
import 'package:investsuite/features/portfolio/data/mappers/portfolio_mapper.dart';
import 'package:investsuite/features/portfolio/domain/asset_model.dart';

void main() {
  group('PortfolioMapper', () {
    test(
      'toDomain converts proto Portfolio to domain PortfolioModel correctly',
      () {
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
              percentChange: -0.5,
              quantity: 0.5,
              totalValue: 48750.0,
            ),
          ],
          totalValue: 53213.00,
          totalPercentChange: 1.58,
        );

        // Act
        final domainPortfolio = protoPortfolio.toDomain();

        // Assert
        expect(domainPortfolio.id, equals('portfolio-1'));
        expect(domainPortfolio.name, equals('My Investment Portfolio'));
        expect(domainPortfolio.assets.length, equals(2));
        expect(domainPortfolio.totalValue, equals(53213.00));
        expect(domainPortfolio.totalPercentChange, equals(1.58));
      },
    );

    test('toDomain correctly converts nested assets', () {
      // Arrange
      final protoPortfolio = pb.Portfolio(
        id: 'portfolio-1',
        name: 'Test Portfolio',
        assets: [
          pb.Asset(
            id: 'asset-1',
            symbol: 'NVDA',
            name: 'NVIDIA Corporation',
            type: pb_enum.AssetType.ASSET_TYPE_STOCK,
            currentPrice: 432.15,
            percentChange: 5.5,
            quantity: 20.0,
            totalValue: 8643.00,
          ),
        ],
        totalValue: 8643.00,
        totalPercentChange: 5.5,
      );

      // Act
      final domainPortfolio = protoPortfolio.toDomain();

      // Assert
      expect(domainPortfolio.assets.first.symbol, equals('NVDA'));
      expect(domainPortfolio.assets.first.name, equals('NVIDIA Corporation'));
      expect(domainPortfolio.assets.first.type, equals(AssetType.stock));
      expect(domainPortfolio.assets.first.currentPrice, equals(432.15));
      expect(domainPortfolio.assets.first.percentChange, equals(5.5));
      expect(domainPortfolio.assets.first.isPositive, isTrue);
    });

    test('toDomain handles empty assets list', () {
      // Arrange
      final protoPortfolio = pb.Portfolio(
        id: 'portfolio-empty',
        name: 'Empty Portfolio',
        totalValue: 0.0,
        totalPercentChange: 0.0,
      );

      // Act
      final domainPortfolio = protoPortfolio.toDomain();

      // Assert
      expect(domainPortfolio.id, equals('portfolio-empty'));
      expect(domainPortfolio.name, equals('Empty Portfolio'));
      expect(domainPortfolio.assets, isEmpty);
      expect(domainPortfolio.totalValue, equals(0.0));
      expect(domainPortfolio.totalPercentChange, equals(0.0));
    });

    test('toDomain handles negative total percent change', () {
      // Arrange
      final protoPortfolio = pb.Portfolio(
        id: 'portfolio-negative',
        name: 'Negative Portfolio',
        assets: [
          pb.Asset(
            id: 'asset-1',
            symbol: 'FAIL',
            name: 'Failing Stock',
            type: pb_enum.AssetType.ASSET_TYPE_STOCK,
            currentPrice: 10.0,
            percentChange: -15.0,
            quantity: 100.0,
            totalValue: 1000.0,
          ),
        ],
        totalValue: 1000.0,
        totalPercentChange: -15.0,
      );

      // Act
      final domainPortfolio = protoPortfolio.toDomain();

      // Assert
      expect(domainPortfolio.totalPercentChange, equals(-15.0));
      expect(domainPortfolio.isPositive, isFalse);
    });

    test('toDomain handles multiple asset types', () {
      // Arrange
      final protoPortfolio = pb.Portfolio(
        id: 'portfolio-mixed',
        name: 'Mixed Portfolio',
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
            percentChange: -0.5,
            quantity: 0.5,
            totalValue: 48750.0,
          ),
          pb.Asset(
            id: 'asset-3',
            symbol: 'VOO',
            name: 'Vanguard S&P 500 ETF',
            type: pb_enum.AssetType.ASSET_TYPE_ETF,
            currentPrice: 450.0,
            percentChange: 1.2,
            quantity: 10.0,
            totalValue: 4500.0,
          ),
        ],
        totalValue: 57713.00,
        totalPercentChange: 2.1,
      );

      // Act
      final domainPortfolio = protoPortfolio.toDomain();

      // Assert
      expect(domainPortfolio.assets.length, equals(3));
      expect(domainPortfolio.assets[0].type, equals(AssetType.stock));
      expect(domainPortfolio.assets[1].type, equals(AssetType.crypto));
      // ETF maps to stock as default
      expect(domainPortfolio.assets[2].type, equals(AssetType.stock));
    });

    test('toDomain preserves asset order', () {
      // Arrange
      final protoPortfolio = pb.Portfolio(
        id: 'portfolio-1',
        name: 'Test Portfolio',
        assets: [
          pb.Asset(id: '1', symbol: 'FIRST'),
          pb.Asset(id: '2', symbol: 'SECOND'),
          pb.Asset(id: '3', symbol: 'THIRD'),
        ],
        totalValue: 0.0,
        totalPercentChange: 0.0,
      );

      // Act
      final domainPortfolio = protoPortfolio.toDomain();

      // Assert
      expect(domainPortfolio.assets[0].symbol, equals('FIRST'));
      expect(domainPortfolio.assets[1].symbol, equals('SECOND'));
      expect(domainPortfolio.assets[2].symbol, equals('THIRD'));
    });
  });
}
