import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_model.freezed.dart';
part 'asset_model.g.dart';

/// Enum representing different types of financial assets
enum AssetType {
  @JsonValue('stock')
  stock('Stock', '📈'),
  @JsonValue('crypto')
  crypto('Crypto', '₿');

  const AssetType(this.displayName, this.icon);

  final String displayName;

  final String icon;
}

/// Immutable model representing a financial asset
@freezed
class AssetModel with _$AssetModel {
  const AssetModel._();

  const factory AssetModel({
    required String id,
    required String symbol,
    required String name,
    required AssetType type,
    required double currentPrice,
    required double percentChange,
    required double quantity,
    required double totalValue,
  }) = _AssetModel;

  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);

  /// Returns true if the asset is performing positively
  bool get isPositive => percentChange >= 0;

  /// Formatted quantity with appropriate label
  /// Shows up to 2 decimals for fractional quantities, 0 for whole numbers
  String get formattedQuantity {
    final label = type == AssetType.crypto ? 'units' : 'shares';
    final decimals = quantity % 1 != 0 ? 2 : 0;
    return '${quantity.toStringAsFixed(decimals)} $label';
  }
}
