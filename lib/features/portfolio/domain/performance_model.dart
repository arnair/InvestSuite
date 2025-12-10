import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/date_formatters.dart';

part 'performance_model.freezed.dart';
part 'performance_model.g.dart';

/// Enum for selecting time range of performance data
enum TimeRange {
  @JsonValue('1d')
  oneDay('1D'),
  @JsonValue('1w')
  oneWeek('1W'),
  @JsonValue('1m')
  oneMonth('1M'),
  @JsonValue('3m')
  threeMonths('3M'),
  @JsonValue('1y')
  oneYear('1Y');

  const TimeRange(this.displayName);

  final String displayName;

  /// Format a date appropriately for this time range
  String formatDate(DateTime date) => switch (this) {
    oneDay => date.asHour,
    oneWeek => date.asDayOfWeek,
    oneMonth => date.asMonthDay,
    threeMonths => date.asMonthDay,
    oneYear => date.asMonth,
  };
}

/// Immutable model representing a single data point in performance history
@freezed
class PerformanceDataPoint with _$PerformanceDataPoint {
  const factory PerformanceDataPoint({
    required DateTime timestamp,
    required double value,
  }) = _PerformanceDataPoint;

  factory PerformanceDataPoint.fromJson(Map<String, dynamic> json) =>
      _$PerformanceDataPointFromJson(json);
}

/// Immutable model representing portfolio performance history
@freezed
class PerformanceHistory with _$PerformanceHistory {
  const PerformanceHistory._();

  const factory PerformanceHistory({
    required String portfolioId,
    required List<PerformanceDataPoint> dataPoints,
    required double minValue,
    required double maxValue,
  }) = _PerformanceHistory;

  factory PerformanceHistory.fromJson(Map<String, dynamic> json) =>
      _$PerformanceHistoryFromJson(json);

  /// Calculate the percentage change from first to last data point
  double get percentageChange {
    if (dataPoints.isEmpty) return 0;
    final first = dataPoints.first.value;
    final last = dataPoints.last.value;
    if (first == 0) return 0;
    return ((last - first) / first) * 100;
  }

  /// Calculate the absolute dollar change from first to last data point
  double get absoluteChange {
    if (dataPoints.isEmpty) return 0;
    final first = dataPoints.first.value;
    final last = dataPoints.last.value;
    return last - first;
  }

  /// Returns true if performance is positive
  bool get isPositive => percentageChange >= 0;
}
