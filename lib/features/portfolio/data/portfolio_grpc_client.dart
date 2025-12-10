import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';

import 'generated/portfolio.pb.dart' as pb;
import 'generated/portfolio.pbgrpc.dart' hide TimeRange, PerformanceHistory;
import '../domain/performance_model.dart';
import '../domain/portfolio_model.dart';
import 'mappers/performance_mapper.dart';
import 'mappers/portfolio_mapper.dart';

/// gRPC Client for connecting to the InvestSuite gRPC Server
class PortfolioGrpcClient {
  static PortfolioServiceClient? _client;
  static ClientChannel? _channel;

  // Server configuration
  static String get _serverHost {
    if (Platform.isAndroid) {
      return '10.0.2.2'; // Android emulator -> host machine
    }
    return 'localhost'; // iOS simulator
  }

  static const int _serverPort = 50051;

  /// Use insecure credentials in debug mode, secure in release
  static ChannelCredentials get _credentials {
    if (kDebugMode) {
      return const ChannelCredentials.insecure();
    }
    return const ChannelCredentials.secure();
  }

  /// Initialize the gRPC channel and client
  static void _ensureInitialized() {
    if (_channel == null) {
      _channel = ClientChannel(
        _serverHost,
        port: _serverPort,
        options: ChannelOptions(credentials: _credentials),
      );
      _client = PortfolioServiceClient(_channel!);
    }
  }

  /// Shutdown the gRPC channel
  static Future<void> shutdown() async {
    await _channel?.shutdown();
    _channel = null;
    _client = null;
  }

  /// Fetch portfolio data via gRPC
  static Future<PortfolioModel> getPortfolio({
    String portfolioId = 'default',
  }) async {
    _ensureInitialized();

    try {
      final request = pb.GetPortfolioRequest(portfolioId: portfolioId);
      final response = await _client!.getPortfolio(request);

      return response.portfolio.toDomain();
    } on GrpcError catch (e) {
      throw Exception('gRPC Error: ${e.message}');
    }
  }

  /// Fetch performance history via gRPC
  static Future<PerformanceHistory> getPerformanceHistory({
    String portfolioId = 'default',
    TimeRange timeRange = TimeRange.oneMonth,
  }) async {
    _ensureInitialized();

    try {
      final request = pb.GetPerformanceHistoryRequest(
        portfolioId: portfolioId,
        timeRange: timeRange.toProto(),
      );
      final response = await _client!.getPerformanceHistory(request);

      return response.history.toDomain();
    } on GrpcError catch (e) {
      throw Exception('gRPC Error: ${e.message}');
    }
  }
}
