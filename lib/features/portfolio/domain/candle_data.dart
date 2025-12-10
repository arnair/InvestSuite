import 'package:freezed_annotation/freezed_annotation.dart';

part 'candle_data.freezed.dart';
part 'candle_data.g.dart';

/// Immutable model representing OHLC candlestick data
@freezed
class CandleData with _$CandleData {
  const CandleData._();

  const factory CandleData({
    required DateTime timestamp,
    required double open,
    required double high,
    required double low,
    required double close,
  }) = _CandleData;

  factory CandleData.fromJson(Map<String, dynamic> json) =>
      _$CandleDataFromJson(json);

  /// Returns true if the candle is bullish (close >= open)
  bool get isBullish => close >= open;
}
