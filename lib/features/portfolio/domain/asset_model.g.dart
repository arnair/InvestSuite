// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetModelImpl _$$AssetModelImplFromJson(Map<String, dynamic> json) =>
    _$AssetModelImpl(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$AssetTypeEnumMap, json['type']),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      percentChange: (json['percentChange'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      totalValue: (json['totalValue'] as num).toDouble(),
    );

Map<String, dynamic> _$$AssetModelImplToJson(_$AssetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'type': _$AssetTypeEnumMap[instance.type]!,
      'currentPrice': instance.currentPrice,
      'percentChange': instance.percentChange,
      'quantity': instance.quantity,
      'totalValue': instance.totalValue,
    };

const _$AssetTypeEnumMap = {
  AssetType.stock: 'stock',
  AssetType.crypto: 'crypto',
};
