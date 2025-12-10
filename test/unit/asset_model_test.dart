import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/core/utils/formatters.dart';
import 'package:investsuite/features/portfolio/domain/asset_model.dart';

void main() {
  group('AssetModel', () {
    late AssetModel asset;

    setUp(() {
      asset = const AssetModel(
        id: '1',
        symbol: 'AAPL',
        name: 'Apple Inc.',
        type: AssetType.stock,
        currentPrice: 178.52,
        percentChange: 2.34,
        quantity: 25,
        totalValue: 4463.00,
      );
    });

    test('should create AssetModel with correct values', () {
      expect(asset.id, equals('1'));
      expect(asset.symbol, equals('AAPL'));
      expect(asset.name, equals('Apple Inc.'));
      expect(asset.type, equals(AssetType.stock));
      expect(asset.currentPrice, equals(178.52));
      expect(asset.percentChange, equals(2.34));
      expect(asset.quantity, equals(25));
      expect(asset.totalValue, equals(4463.00));
    });

    test('isPositive returns true for positive percent change', () {
      expect(asset.isPositive, isTrue);
    });

    test('isPositive returns false for negative percent change', () {
      final negativeAsset = asset.copyWith(percentChange: -1.5);
      expect(negativeAsset.isPositive, isFalse);
    });

    test('isPositive returns true for zero percent change', () {
      final zeroAsset = asset.copyWith(percentChange: 0);
      expect(zeroAsset.isPositive, isTrue);
    });

    test('currentPrice.asCurrency returns correct format', () {
      expect(asset.currentPrice.asCurrency, equals('\$178.52'));
    });

    test(
      'percentChange.asPercentWithSign returns correct format with positive sign',
      () {
        expect(asset.percentChange.asPercentWithSign, equals('+2.34%'));
      },
    );

    test(
      'percentChange.asPercentWithSign returns correct format for negative value',
      () {
        final negativeAsset = asset.copyWith(percentChange: -1.56);
        expect(negativeAsset.percentChange.asPercentWithSign, equals('-1.56%'));
      },
    );

    test('totalValue.asCurrency returns correct format', () {
      expect(asset.totalValue.asCurrency, equals('\$4463.00'));
    });

    test('formattedQuantity returns whole number for stocks', () {
      expect(asset.formattedQuantity, equals('25 shares'));
    });

    test('formattedQuantity returns 2 decimals for fractional stocks', () {
      final fractionalAsset = asset.copyWith(quantity: 77.72);
      expect(fractionalAsset.formattedQuantity, equals('77.72 shares'));
    });

    test('formattedQuantity returns units label for crypto', () {
      final cryptoAsset = const AssetModel(
        id: '1',
        symbol: 'BTC',
        name: 'Bitcoin',
        type: AssetType.crypto,
        currentPrice: 97500.0,
        percentChange: 2.5,
        quantity: 0.23,
        totalValue: 22425.0,
      );
      expect(cryptoAsset.formattedQuantity, equals('0.23 units'));
    });

    test('copyWith creates a new instance with updated values', () {
      final updatedAsset = asset.copyWith(
        currentPrice: 180.00,
        percentChange: 3.00,
      );

      expect(updatedAsset.id, equals(asset.id));
      expect(updatedAsset.symbol, equals(asset.symbol));
      expect(updatedAsset.currentPrice, equals(180.00));
      expect(updatedAsset.percentChange, equals(3.00));
    });

    test('equality works correctly', () {
      final asset2 = const AssetModel(
        id: '1',
        symbol: 'AAPL',
        name: 'Apple Inc.',
        type: AssetType.stock,
        currentPrice: 178.52,
        percentChange: 2.34,
        quantity: 25,
        totalValue: 4463.00,
      );

      expect(asset, equals(asset2));
    });

    test('serialization and deserialization works correctly', () {
      final json = asset.toJson();
      final deserializedAsset = AssetModel.fromJson(json);

      expect(deserializedAsset, equals(asset));
    });
  });

  group('AssetType', () {
    test('displayName returns correct value for stock', () {
      expect(AssetType.stock.displayName, equals('Stock'));
    });

    test('displayName returns correct value for crypto', () {
      expect(AssetType.crypto.displayName, equals('Crypto'));
    });

    test('icon returns correct emoji for each type', () {
      expect(AssetType.stock.icon, equals('📈'));
      expect(AssetType.crypto.icon, equals('₿'));
    });
  });
}
