// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PortfolioModelImpl _$$PortfolioModelImplFromJson(Map<String, dynamic> json) =>
    _$PortfolioModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => AssetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalValue: (json['totalValue'] as num).toDouble(),
      totalPercentChange: (json['totalPercentChange'] as num).toDouble(),
    );

Map<String, dynamic> _$$PortfolioModelImplToJson(
  _$PortfolioModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'assets': instance.assets,
  'totalValue': instance.totalValue,
  'totalPercentChange': instance.totalPercentChange,
};
