import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/features/portfolio/data/generated/portfolio.pb.dart'
    as pb;
import 'package:investsuite/features/portfolio/data/generated/portfolio.pbenum.dart'
    as pb_enum;
import 'package:investsuite/features/portfolio/data/mappers/asset_mapper.dart';
import 'package:investsuite/features/portfolio/domain/asset_model.dart';

void main() {
  group('AssetMapper', () {
    test('toDomain converts proto Asset to domain AssetModel correctly', () {
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

    test('toDomain handles crypto asset type', () {
      // Arrange
      final protoAsset = pb.Asset(
        id: 'asset-2',
        symbol: 'BTC',
        name: 'Bitcoin',
        type: pb_enum.AssetType.ASSET_TYPE_CRYPTO,
        currentPrice: 97500.0,
        percentChange: -1.5,
        quantity: 0.5,
        totalValue: 48750.0,
      );

      // Act
      final domainAsset = protoAsset.toDomain();

      // Assert
      expect(domainAsset.type, equals(AssetType.crypto));
      expect(domainAsset.symbol, equals('BTC'));
    });

    test('toDomain handles default values', () {
      // Arrange - proto with default/empty values
      final protoAsset = pb.Asset();

      // Act
      final domainAsset = protoAsset.toDomain();

      // Assert
      expect(domainAsset.id, equals(''));
      expect(domainAsset.symbol, equals(''));
      expect(domainAsset.name, equals(''));
      expect(domainAsset.currentPrice, equals(0.0));
      expect(domainAsset.percentChange, equals(0.0));
      expect(domainAsset.quantity, equals(0.0));
      expect(domainAsset.totalValue, equals(0.0));
    });

    test('toDomain handles negative percent change', () {
      // Arrange
      final protoAsset = pb.Asset(
        id: 'asset-3',
        symbol: 'TSLA',
        name: 'Tesla Inc.',
        type: pb_enum.AssetType.ASSET_TYPE_STOCK,
        currentPrice: 248.42,
        percentChange: -5.67,
        quantity: 10.0,
        totalValue: 2484.20,
      );

      // Act
      final domainAsset = protoAsset.toDomain();

      // Assert
      expect(domainAsset.percentChange, equals(-5.67));
      expect(domainAsset.isPositive, isFalse);
    });
  });

  group('AssetTypeMapper', () {
    test('ASSET_TYPE_STOCK maps to AssetType.stock', () {
      expect(
        pb_enum.AssetType.ASSET_TYPE_STOCK.toDomain(),
        equals(AssetType.stock),
      );
    });

    test('ASSET_TYPE_CRYPTO maps to AssetType.crypto', () {
      expect(
        pb_enum.AssetType.ASSET_TYPE_CRYPTO.toDomain(),
        equals(AssetType.crypto),
      );
    });

    test('ASSET_TYPE_UNSPECIFIED defaults to AssetType.stock', () {
      expect(
        pb_enum.AssetType.ASSET_TYPE_UNSPECIFIED.toDomain(),
        equals(AssetType.stock),
      );
    });

    test('ASSET_TYPE_ETF defaults to AssetType.stock', () {
      expect(
        pb_enum.AssetType.ASSET_TYPE_ETF.toDomain(),
        equals(AssetType.stock),
      );
    });

    test('ASSET_TYPE_BOND defaults to AssetType.stock', () {
      expect(
        pb_enum.AssetType.ASSET_TYPE_BOND.toDomain(),
        equals(AssetType.stock),
      );
    });
  });
}
