import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/core/utils/formatters.dart';
import 'package:investsuite/features/portfolio/domain/asset_model.dart';
import 'package:investsuite/features/portfolio/domain/portfolio_model.dart';

void main() {
  group('PortfolioModel', () {
    late PortfolioModel portfolio;
    late List<AssetModel> assets;

    setUp(() {
      assets = [
        const AssetModel(
          id: '1',
          symbol: 'AAPL',
          name: 'Apple Inc.',
          type: AssetType.stock,
          currentPrice: 178.52,
          percentChange: 2.34,
          quantity: 25,
          totalValue: 4463.00,
        ),
        const AssetModel(
          id: '2',
          symbol: 'NVDA',
          name: 'NVIDIA Corporation',
          type: AssetType.stock,
          currentPrice: 432.15,
          percentChange: 0.92,
          quantity: 20,
          totalValue: 8643.00,
        ),
        const AssetModel(
          id: '3',
          symbol: 'BTC',
          name: 'Bitcoin',
          type: AssetType.crypto,
          currentPrice: 97500.0,
          percentChange: -0.12,
          quantity: 0.037,
          totalValue: 3622.50,
        ),
      ];

      portfolio = PortfolioModel(
        id: 'portfolio-1',
        name: 'My Investment Portfolio',
        assets: assets,
        totalValue: 16728.50,
        totalPercentChange: 1.58,
      );
    });

    test('should create PortfolioModel with correct values', () {
      expect(portfolio.id, equals('portfolio-1'));
      expect(portfolio.name, equals('My Investment Portfolio'));
      expect(portfolio.assets.length, equals(3));
      expect(portfolio.totalValue, equals(16728.50));
      expect(portfolio.totalPercentChange, equals(1.58));
    });

    test('isPositive returns true for positive total percent change', () {
      expect(portfolio.isPositive, isTrue);
    });

    test('isPositive returns false for negative total percent change', () {
      final negativePortfolio = portfolio.copyWith(totalPercentChange: -2.5);
      expect(negativePortfolio.isPositive, isFalse);
    });

    test('totalValue.asCurrency returns correct format', () {
      expect(portfolio.totalValue.asCurrency, equals('\$16728.50'));
    });

    test(
      'totalPercentChange.asPercentWithSign returns correct format with positive sign',
      () {
        expect(
          portfolio.totalPercentChange.asPercentWithSign,
          equals('+1.58%'),
        );
      },
    );

    test(
      'totalPercentChange.asPercentWithSign returns correct format for negative value',
      () {
        final negativePortfolio = portfolio.copyWith(totalPercentChange: -0.75);
        expect(
          negativePortfolio.totalPercentChange.asPercentWithSign,
          equals('-0.75%'),
        );
      },
    );

    test('copyWith creates a new instance with updated values', () {
      final updatedPortfolio = portfolio.copyWith(
        name: 'Updated Portfolio',
        totalValue: 20000.00,
      );

      expect(updatedPortfolio.id, equals(portfolio.id));
      expect(updatedPortfolio.name, equals('Updated Portfolio'));
      expect(updatedPortfolio.totalValue, equals(20000.00));
      expect(updatedPortfolio.assets, equals(portfolio.assets));
    });

    test('equality works correctly', () {
      final portfolio2 = PortfolioModel(
        id: 'portfolio-1',
        name: 'My Investment Portfolio',
        assets: assets,
        totalValue: 16728.50,
        totalPercentChange: 1.58,
      );

      expect(portfolio, equals(portfolio2));
    });

    test('serialization and deserialization works correctly', () {
      // Create JSON from scratch to test proper deserialization
      final json = {
        'id': 'portfolio-1',
        'name': 'Test Portfolio',
        'assets': [
          {
            'id': '1',
            'symbol': 'AAPL',
            'name': 'Apple Inc.',
            'type': 'stock',
            'currentPrice': 178.52,
            'percentChange': 2.34,
            'quantity': 25.0,
            'totalValue': 4463.00,
          },
        ],
        'totalValue': 4463.00,
        'totalPercentChange': 2.34,
      };

      final deserializedPortfolio = PortfolioModel.fromJson(json);

      expect(deserializedPortfolio.id, equals('portfolio-1'));
      expect(deserializedPortfolio.name, equals('Test Portfolio'));
      expect(deserializedPortfolio.totalValue, equals(4463.00));
      expect(deserializedPortfolio.totalPercentChange, equals(2.34));
      expect(deserializedPortfolio.assets.length, equals(1));
      expect(deserializedPortfolio.assets.first.symbol, equals('AAPL'));
    });
  });
}
