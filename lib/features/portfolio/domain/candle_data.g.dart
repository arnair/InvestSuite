// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candle_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandleDataImpl _$$CandleDataImplFromJson(Map<String, dynamic> json) =>
    _$CandleDataImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      open: (json['open'] as num).toDouble(),
      high: (json['high'] as num).toDouble(),
      low: (json['low'] as num).toDouble(),
      close: (json['close'] as num).toDouble(),
    );

Map<String, dynamic> _$$CandleDataImplToJson(_$CandleDataImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
    };
