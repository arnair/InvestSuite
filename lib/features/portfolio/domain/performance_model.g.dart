// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerformanceDataPointImpl _$$PerformanceDataPointImplFromJson(
  Map<String, dynamic> json,
) => _$PerformanceDataPointImpl(
  timestamp: DateTime.parse(json['timestamp'] as String),
  value: (json['value'] as num).toDouble(),
);

Map<String, dynamic> _$$PerformanceDataPointImplToJson(
  _$PerformanceDataPointImpl instance,
) => <String, dynamic>{
  'timestamp': instance.timestamp.toIso8601String(),
  'value': instance.value,
};

_$PerformanceHistoryImpl _$$PerformanceHistoryImplFromJson(
  Map<String, dynamic> json,
) => _$PerformanceHistoryImpl(
  portfolioId: json['portfolioId'] as String,
  dataPoints: (json['dataPoints'] as List<dynamic>)
      .map((e) => PerformanceDataPoint.fromJson(e as Map<String, dynamic>))
      .toList(),
  minValue: (json['minValue'] as num).toDouble(),
  maxValue: (json['maxValue'] as num).toDouble(),
);

Map<String, dynamic> _$$PerformanceHistoryImplToJson(
  _$PerformanceHistoryImpl instance,
) => <String, dynamic>{
  'portfolioId': instance.portfolioId,
  'dataPoints': instance.dataPoints,
  'minValue': instance.minValue,
  'maxValue': instance.maxValue,
};
