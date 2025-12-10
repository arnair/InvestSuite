import 'dart:math' as math;

import '../../domain/candle_data.dart';
import '../../domain/performance_model.dart';

/// Utility to generate OHLC candle data from performance data points
class CandleMapper {
  const CandleMapper._();

  /// Generates OHLC candle data from single-value data points
  ///
  /// Creates realistic OHLC values with simulated volatility
  /// based on the data point's value and index.
  static List<CandleData> fromDataPoints(
    List<PerformanceDataPoint> dataPoints,
  ) {
    return [
      for (final (index, point) in dataPoints.indexed)
        _createCandle(index, point),
    ];
  }

  static CandleData _createCandle(int index, PerformanceDataPoint point) {
    final value = point.value;

    // Create realistic OHLC with volatility (±1.5% range)
    final volatility = value * 0.015;
    final rand1 = ((index * 17 + 7) % 100) / 100.0 - 0.5;
    final rand2 = ((index * 31 + 13) % 100) / 100.0 - 0.5;

    final open = value + (volatility * rand1);
    final close = value + (volatility * rand2);
    final high = math.max(open, close) + volatility * 0.5;
    final low = math.min(open, close) - volatility * 0.5;

    return CandleData(
      timestamp: point.timestamp,
      open: open,
      high: high,
      low: low,
      close: close,
    );
  }
}
