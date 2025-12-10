import '../generated/portfolio.pb.dart' as pb;
import '../generated/portfolio.pbenum.dart' as pb_enum;
import '../../domain/asset_model.dart';

/// Extension to convert proto Asset to domain AssetModel
extension AssetMapper on pb.Asset {
  AssetModel toDomain() => AssetModel(
    id: id,
    symbol: symbol,
    name: name,
    type: type.toDomain(),
    currentPrice: currentPrice,
    percentChange: percentChange,
    quantity: quantity,
    totalValue: totalValue,
  );
}

/// Extension to convert proto AssetType to domain AssetType
extension AssetTypeMapper on pb_enum.AssetType {
  AssetType toDomain() {
    switch (this) {
      case pb_enum.AssetType.ASSET_TYPE_STOCK:
        return AssetType.stock;
      case pb_enum.AssetType.ASSET_TYPE_CRYPTO:
        return AssetType.crypto;
      default:
        return AssetType.stock;
    }
  }
}
