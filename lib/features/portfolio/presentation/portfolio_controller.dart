import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/formatters.dart';
import '../data/portfolio_repository.dart';
import '../domain/portfolio_model.dart';

part 'portfolio_controller.g.dart';

/// Auto-refresh interval in seconds (set to 0 to disable)
/// Finnhub: 60 calls/min ÷ 4 assets = 15 refreshes/min = every 4 seconds
const int _autoRefreshIntervalSeconds = 4;

/// Provider for managing portfolio state with auto-refresh
@riverpod
class PortfolioController extends _$PortfolioController {
  Timer? _autoRefreshTimer;

  PortfolioRepository get _repository => ref.read(portfolioRepositoryProvider);

  @override
  AsyncValue<PortfolioModel> build() {
    // Clean up timer when provider is disposed
    ref.onDispose(() {
      _autoRefreshTimer?.cancel();
    });

    // STRATEGY: Delay portfolio loading to let performance history load first
    // This prevents overwhelming the free API with too many simultaneous requests
    Timer(const Duration(seconds: 3), () {
      _fetchPortfolio();
      _startAutoRefresh();
    });

    return const AsyncValue.loading();
  }

  void _startAutoRefresh() {
    if (_autoRefreshIntervalSeconds > 0) {
      _autoRefreshTimer?.cancel();
      _autoRefreshTimer = Timer.periodic(
        Duration(seconds: _autoRefreshIntervalSeconds),
        (_) => _silentRefresh(),
      );
    }
  }

  /// Silent refresh - doesn't show loading state (gRPC only)
  Future<void> _silentRefresh() async {
    try {
      final portfolio = await _repository.getPortfolio().timeout(
        const Duration(seconds: 5),
      );
      state = AsyncValue.data(portfolio);
    } catch (e) {
      // Refresh failed
    }
  }

  Future<void> _fetchPortfolio() async {
    try {
      final portfolio = await _repository.getPortfolio();
      state = AsyncValue.data(portfolio);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// Refresh portfolio data (shows loading)
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    await _fetchPortfolio();
  }
}

/// Computed provider for portfolio summary statistics
@riverpod
PortfolioSummary? portfolioSummary(Ref ref) {
  final portfolioState = ref.watch(portfolioControllerProvider);

  return portfolioState.whenOrNull(
    data: (portfolio) => PortfolioSummary(
      totalValue: portfolio.totalValue,
      totalPercentChange: portfolio.totalPercentChange,
      assetCount: portfolio.assets.length,
      isPositive: portfolio.isPositive,
    ),
  );
}

/// Simple data class for portfolio summary
class PortfolioSummary {
  /// Initial investment amount (could come from backend/user settings in the future)
  static const double initialInvestment = 50000.0;

  final double totalValue;
  final double totalPercentChange;
  final int assetCount;
  final bool isPositive;

  const PortfolioSummary({
    required this.totalValue,
    required this.totalPercentChange,
    required this.assetCount,
    required this.isPositive,
  });

  String get formattedTotalValue => totalValue.asCurrency;

  /// Profit/loss from initial investment
  double get profitLoss => totalValue - initialInvestment;

  /// Profit/loss percentage from initial investment
  double get profitLossPercent => (profitLoss / initialInvestment) * 100;

  /// Whether total profit is positive
  bool get isProfitPositive => profitLoss >= 0;

  /// Formatted initial investment
  String get formattedInitialInvestment => initialInvestment.asCurrencyWhole;

  /// Formatted profit/loss with sign
  String get formattedProfitLoss => profitLoss.asCurrencyWithSign;
}
