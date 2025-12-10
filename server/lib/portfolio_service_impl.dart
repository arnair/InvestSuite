import 'dart:convert';
import 'dart:math' as math;

import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;
import 'package:fixnum/fixnum.dart';
import 'generated/portfolio.pb.dart';
import 'generated/portfolio.pbenum.dart';
import 'generated/portfolio.pbgrpc.dart';
import 'portfolio_config.dart';

/// gRPC Service Implementation for Portfolio data
/// Fetches real stock data from Finnhub API and serves via gRPC protocol
class PortfolioServiceImpl extends PortfolioServiceBase {
  // Finnhub API configuration (loaded from .env)
  static String _finnhubApiKey = '';
  static const String _finnhubBaseUrl = 'https://finnhub.io/api/v1';

  static final http.Client _httpClient = http.Client();

  static void initialize({required String finnhubApiKey}) {
    _finnhubApiKey = finnhubApiKey;
  }

  static Map<String, double> _lastPrices = {};
  static Map<String, double> _lastPercentChanges = {};

  // Store current portfolio values for history sync
  static double _currentPortfolioValue = 61400.0;
  static double _currentDailyChangePercent = 0.5;

  @override
  Future<GetPortfolioResponse> getPortfolio(
    ServiceCall call,
    GetPortfolioRequest request,
  ) async {
    // Fetch all quotes in parallel
    final quoteFutures = portfolioStocks
        .map((stock) => _fetchQuote(stock['symbol']))
        .toList();
    final quotes = await Future.wait(quoteFutures);

    final List<Asset> assets = [];

    for (int i = 0; i < portfolioStocks.length; i++) {
      final stock = portfolioStocks[i];
      final quote = quotes[i];
      final isCrypto = stock['type'] == 'crypto';
      final displaySymbol = stock['displaySymbol'] ?? stock['symbol'];

      double currentPrice;
      double percentChange;

      // Use API data if available, otherwise use cached price
      if (quote != null && quote['c'] != null && quote['c'] != 0) {
        currentPrice = (quote['c'] as num).toDouble();
        final previousClose = (quote['pc'] as num?)?.toDouble() ?? currentPrice;
        percentChange = previousClose > 0
            ? ((currentPrice - previousClose) / previousClose) * 100
            : 0.0;

        // Cache the successful data
        _lastPrices[displaySymbol] = currentPrice;
        _lastPercentChanges[displaySymbol] = percentChange;
      } else if (_lastPrices.containsKey(displaySymbol)) {
        // Use cached data if API fails
        currentPrice = _lastPrices[displaySymbol]!;
        percentChange = _lastPercentChanges[displaySymbol] ?? 0.0;
      } else {
        continue;
      }

      assets.add(
        Asset(
          id: '${i + 1}',
          symbol: displaySymbol,
          name: stock['name'],
          type: isCrypto
              ? AssetType.ASSET_TYPE_CRYPTO
              : AssetType.ASSET_TYPE_STOCK,
          currentPrice: currentPrice,
          percentChange: percentChange,
          quantity: stock['quantity'],
          totalValue: currentPrice * stock['quantity'],
        ),
      );
    }

    // Fail only if no data available at all (no API and no cache)
    if (assets.isEmpty) {
      throw GrpcError.unavailable('No data available from API');
    }

    final totalValue = assets.fold<double>(0, (sum, a) => sum + a.totalValue);
    final totalPercentChange = totalValue > 0
        ? assets.fold<double>(
                0,
                (sum, a) => sum + (a.percentChange * a.totalValue),
              ) /
              totalValue
        : 0.0;

    // Store for history sync
    _currentPortfolioValue = totalValue;
    _currentDailyChangePercent = totalPercentChange;

    final portfolio = Portfolio(
      id: request.portfolioId.isEmpty ? 'default' : request.portfolioId,
      name: 'My Investment Portfolio',
      assets: assets,
      totalValue: totalValue,
      totalPercentChange: totalPercentChange,
    );

    return GetPortfolioResponse(portfolio: portfolio);
  }

  @override
  Future<GetPerformanceHistoryResponse> getPerformanceHistory(
    ServiceCall call,
    GetPerformanceHistoryRequest request,
  ) async {
    final now = DateTime.now();

    // Generate realistic historical data based on current portfolio value
    final dataPoints = _generateHistoricalDataPoints(request.timeRange, now);

    final values = dataPoints.map((p) => p.value).toList();
    final minValue = values.reduce((a, b) => a < b ? a : b);
    final maxValue = values.reduce((a, b) => a > b ? a : b);

    final history = PerformanceHistory(
      portfolioId: request.portfolioId,
      dataPoints: dataPoints,
      minValue: minValue,
      maxValue: maxValue,
    );

    return GetPerformanceHistoryResponse(history: history);
  }

  Future<Map<String, dynamic>?> _fetchQuote(String symbol) async {
    try {
      final response = await _httpClient
          .get(
            Uri.parse(
              '$_finnhubBaseUrl/quote?symbol=$symbol&token=$_finnhubApiKey',
            ),
          )
          .timeout(const Duration(seconds: 2)); // Fast timeout!
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (_) {}
    return null;
  }

  List<PerformanceDataPoint> _generateHistoricalDataPoints(
    TimeRange range,
    DateTime now,
  ) {
    final dataPoints = <PerformanceDataPoint>[];

    const int numPoints = 12;

    // Total time span for each range
    Duration totalSpan;
    switch (range) {
      case TimeRange.TIME_RANGE_1D:
        totalSpan = const Duration(hours: 24);
      case TimeRange.TIME_RANGE_1W:
        totalSpan = const Duration(days: 7);
      case TimeRange.TIME_RANGE_1M:
        totalSpan = const Duration(days: 30);
      case TimeRange.TIME_RANGE_3M:
        totalSpan = const Duration(days: 90);
      case TimeRange.TIME_RANGE_1Y:
        totalSpan = const Duration(days: 365);
      default:
        totalSpan = const Duration(days: 30);
    }

    // Use actual current portfolio value and daily change
    final currentValue = _currentPortfolioValue;
    final dailyChangePercent = _currentDailyChangePercent;

    // Calculate start values
    final startValue = switch (range) {
      TimeRange.TIME_RANGE_1D =>
        currentValue / (1 + dailyChangePercent / 100), // Match "Today" %
      TimeRange.TIME_RANGE_1W =>
        currentValue /
            (1 + dailyChangePercent * 7 / 100), // ~7 days of daily change
      TimeRange.TIME_RANGE_1M => currentValue * 0.96, // ~4% monthly change
      TimeRange.TIME_RANGE_3M => currentValue * 0.90, // ~11% quarterly growth
      TimeRange.TIME_RANGE_1Y => 50000.0, // Started at $50k
      _ => currentValue * 0.95,
    };

    final endValue = currentValue;

    double pseudoRandom(int seed) {
      return ((seed * 9301 + 49297) % 233280) / 233280.0;
    }

    final startTime = now.subtract(totalSpan);
    final intervalMs = totalSpan.inMilliseconds / (numPoints - 1);

    for (int i = 0; i < numPoints; i++) {
      final timestamp = startTime.add(
        Duration(milliseconds: (intervalMs * i).round()),
      );
      final progress = i / (numPoints - 1);

      double baseValue = startValue + (endValue - startValue) * progress;

      // Add controlled volatility
      double volatilityPercent = switch (range) {
        TimeRange.TIME_RANGE_1D => 0.1, // ±0.1% intraday (very smooth)
        TimeRange.TIME_RANGE_1W => 0.3, // ±0.3%
        TimeRange.TIME_RANGE_1M => 0.8, // ±0.8%
        TimeRange.TIME_RANGE_3M => 1.5, // ±1.5%
        TimeRange.TIME_RANGE_1Y => 2.5, // ±2.5%
        _ => 1.0,
      };

      // Smooth wave pattern
      final wave =
          math.sin(progress * math.pi * 3) * 0.5 +
          math.sin(progress * math.pi * 7) * 0.3 +
          (pseudoRandom(i * 13) - 0.5) * 0.2;

      final volatility = baseValue * (volatilityPercent / 100) * wave;
      double value = baseValue + volatility;

      // Add realistic market events for 1Y
      if (range == TimeRange.TIME_RANGE_1Y) {
        if (progress > 0.2 && progress < 0.35) {
          value -=
              baseValue * 0.02 * math.sin((progress - 0.2) * math.pi * 6.67);
        }
        if (progress > 0.5 && progress < 0.7) {
          value += baseValue * 0.03 * math.sin((progress - 0.5) * math.pi * 5);
        }
      }

      // Force exact start and end values
      if (i == 0) value = startValue;
      if (i == numPoints - 1) value = endValue;

      dataPoints.add(
        PerformanceDataPoint(
          timestamp: Int64(timestamp.millisecondsSinceEpoch),
          value: value,
        ),
      );
    }

    return dataPoints;
  }
}
