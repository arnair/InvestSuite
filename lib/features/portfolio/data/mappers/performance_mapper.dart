import '../generated/portfolio.pb.dart' as pb;
import '../generated/portfolio.pbenum.dart' as pb_enum;
import '../../domain/performance_model.dart';

/// Extension to convert proto PerformanceHistory to domain model
extension PerformanceHistoryMapper on pb.PerformanceHistory {
  PerformanceHistory toDomain() => PerformanceHistory(
    portfolioId: portfolioId,
    dataPoints: dataPoints.map((p) => p.toDomain()).toList(),
    minValue: minValue,
    maxValue: maxValue,
  );
}

/// Extension to convert proto PerformanceDataPoint to domain model
extension PerformanceDataPointMapper on pb.PerformanceDataPoint {
  PerformanceDataPoint toDomain() => PerformanceDataPoint(
    timestamp: DateTime.fromMillisecondsSinceEpoch(timestamp.toInt()),
    value: value,
  );
}

/// Extension to convert domain TimeRange to proto TimeRange
extension TimeRangeMapper on TimeRange {
  pb_enum.TimeRange toProto() {
    switch (this) {
      case TimeRange.oneDay:
        return pb_enum.TimeRange.TIME_RANGE_1D;
      case TimeRange.oneWeek:
        return pb_enum.TimeRange.TIME_RANGE_1W;
      case TimeRange.oneMonth:
        return pb_enum.TimeRange.TIME_RANGE_1M;
      case TimeRange.threeMonths:
        return pb_enum.TimeRange.TIME_RANGE_3M;
      case TimeRange.oneYear:
        return pb_enum.TimeRange.TIME_RANGE_1Y;
    }
  }
}
