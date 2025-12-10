import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/performance_model.dart';
import '../domain/portfolio_model.dart';
import 'portfolio_grpc_client.dart';

part 'portfolio_repository.g.dart';

/// Abstract interface for portfolio data access
abstract class PortfolioRepository {
  Future<PortfolioModel> getPortfolio({String portfolioId = 'default'});

  Future<PerformanceHistory> getPerformanceHistory({
    String portfolioId = 'default',
    TimeRange timeRange = TimeRange.oneMonth,
  });
}

/// gRPC implementation of PortfolioRepository
class PortfolioGrpcRepository implements PortfolioRepository {
  @override
  Future<PortfolioModel> getPortfolio({String portfolioId = 'default'}) {
    return PortfolioGrpcClient.getPortfolio(portfolioId: portfolioId);
  }

  @override
  Future<PerformanceHistory> getPerformanceHistory({
    String portfolioId = 'default',
    TimeRange timeRange = TimeRange.oneMonth,
  }) {
    return PortfolioGrpcClient.getPerformanceHistory(
      portfolioId: portfolioId,
      timeRange: timeRange,
    );
  }
}

/// Provider for the portfolio repository
@riverpod
PortfolioRepository portfolioRepository(Ref ref) {
  return PortfolioGrpcRepository();
}
