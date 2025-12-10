import 'package:investsuite/features/portfolio/domain/asset_model.dart';
import 'package:investsuite/features/portfolio/domain/performance_model.dart';
import 'package:investsuite/features/portfolio/domain/portfolio_model.dart';

/// Factory for creating test data
class TestData {
  TestData._();

  /// Creates a sample asset for testing
  static AssetModel createAsset({
    String id = 'asset-1',
    String symbol = 'AAPL',
    String name = 'Apple Inc.',
    AssetType type = AssetType.stock,
    double currentPrice = 150.0,
    double percentChange = 2.5,
    double quantity = 10.0,
    double? totalValue,
  }) {
    return AssetModel(
      id: id,
      symbol: symbol,
      name: name,
      type: type,
      currentPrice: currentPrice,
      percentChange: percentChange,
      quantity: quantity,
      totalValue: totalValue ?? (currentPrice * quantity),
    );
  }

  /// Creates a sample portfolio for testing
  static PortfolioModel createPortfolio({
    String id = 'portfolio-1',
    String name = 'Test Portfolio',
    List<AssetModel>? assets,
    double? totalValue,
    double totalPercentChange = 3.5,
  }) {
    final portfolioAssets =
        assets ??
        [
          createAsset(
            id: 'asset-1',
            symbol: 'AAPL',
            name: 'Apple Inc.',
            currentPrice: 150.0,
            quantity: 10.0,
            percentChange: 2.5,
          ),
          createAsset(
            id: 'asset-2',
            symbol: 'GOOGL',
            name: 'Alphabet Inc.',
            currentPrice: 140.0,
            quantity: 5.0,
            percentChange: -1.2,
          ),
          createAsset(
            id: 'asset-3',
            symbol: 'MSFT',
            name: 'Microsoft Corp.',
            currentPrice: 380.0,
            quantity: 8.0,
            percentChange: 1.8,
          ),
        ];

    final calculatedTotalValue =
        totalValue ??
        portfolioAssets.fold<double>(
          0.0,
          (sum, asset) => sum + asset.totalValue,
        );

    return PortfolioModel(
      id: id,
      name: name,
      assets: portfolioAssets,
      totalValue: calculatedTotalValue,
      totalPercentChange: totalPercentChange,
    );
  }

  /// Creates a sample performance data point for testing
  static PerformanceDataPoint createDataPoint({
    DateTime? timestamp,
    double value = 1000.0,
  }) {
    return PerformanceDataPoint(
      timestamp: timestamp ?? DateTime.now(),
      value: value,
    );
  }

  /// Creates a sample performance history for testing
  static PerformanceHistory createPerformanceHistory({
    String portfolioId = 'portfolio-1',
    List<PerformanceDataPoint>? dataPoints,
    double? minValue,
    double? maxValue,
  }) {
    final historyDataPoints = dataPoints ?? _generateDataPoints();

    final values = historyDataPoints.map((dp) => dp.value).toList();
    final calculatedMin =
        minValue ??
        (values.isEmpty ? 0.0 : values.reduce((a, b) => a < b ? a : b));
    final calculatedMax =
        maxValue ??
        (values.isEmpty ? 0.0 : values.reduce((a, b) => a > b ? a : b));

    return PerformanceHistory(
      portfolioId: portfolioId,
      dataPoints: historyDataPoints,
      minValue: calculatedMin,
      maxValue: calculatedMax,
    );
  }

  /// Generates sample data points for performance history
  static List<PerformanceDataPoint> _generateDataPoints({
    int count = 30,
    double startValue = 50000.0,
    double endValue = 52500.0,
  }) {
    final now = DateTime.now();
    final points = <PerformanceDataPoint>[];

    for (var i = 0; i < count; i++) {
      final progress = i / (count - 1);
      final value = startValue + (endValue - startValue) * progress;
      // Add some variation
      final variation = (i % 3 - 1) * 100.0;

      points.add(
        PerformanceDataPoint(
          timestamp: now.subtract(Duration(days: count - i - 1)),
          value: value + variation,
        ),
      );
    }

    return points;
  }

  /// Creates an empty portfolio for testing edge cases
  static PortfolioModel createEmptyPortfolio({
    String id = 'portfolio-empty',
    String name = 'Empty Portfolio',
  }) {
    return PortfolioModel(
      id: id,
      name: name,
      assets: [],
      totalValue: 0.0,
      totalPercentChange: 0.0,
    );
  }

  /// Creates an empty performance history for testing edge cases
  static PerformanceHistory createEmptyPerformanceHistory({
    String portfolioId = 'portfolio-empty',
  }) {
    return PerformanceHistory(
      portfolioId: portfolioId,
      dataPoints: [],
      minValue: 0.0,
      maxValue: 0.0,
    );
  }

  /// Creates a negative performance portfolio for testing
  static PortfolioModel createNegativePortfolio() {
    return createPortfolio(
      id: 'portfolio-negative',
      name: 'Negative Portfolio',
      totalPercentChange: -5.5,
      assets: [
        createAsset(
          id: 'asset-1',
          symbol: 'FAIL',
          name: 'Failing Stock',
          currentPrice: 10.0,
          quantity: 100.0,
          percentChange: -15.0,
        ),
      ],
    );
  }
}
