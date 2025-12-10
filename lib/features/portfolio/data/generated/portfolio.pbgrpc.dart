//
//  Generated code. Do not modify.
//  source: portfolio.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/grpc.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'portfolio.pb.dart' as $0;

export 'portfolio.pb.dart';

@$pb.GrpcServiceName('investsuite.PortfolioService')
class PortfolioServiceClient extends $grpc.Client {
  static final _$getPortfolio =
      $grpc.ClientMethod<$0.GetPortfolioRequest, $0.GetPortfolioResponse>(
          '/investsuite.PortfolioService/GetPortfolio',
          ($0.GetPortfolioRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetPortfolioResponse.fromBuffer(value));
  static final _$getPerformanceHistory = $grpc.ClientMethod<
          $0.GetPerformanceHistoryRequest, $0.GetPerformanceHistoryResponse>(
      '/investsuite.PortfolioService/GetPerformanceHistory',
      ($0.GetPerformanceHistoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetPerformanceHistoryResponse.fromBuffer(value));

  PortfolioServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetPortfolioResponse> getPortfolio(
      $0.GetPortfolioRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPortfolio, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPerformanceHistoryResponse> getPerformanceHistory(
      $0.GetPerformanceHistoryRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPerformanceHistory, request, options: options);
  }
}

@$pb.GrpcServiceName('investsuite.PortfolioService')
abstract class PortfolioServiceBase extends $grpc.Service {
  $core.String get $name => 'investsuite.PortfolioService';

  PortfolioServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetPortfolioRequest, $0.GetPortfolioResponse>(
            'GetPortfolio',
            getPortfolio_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetPortfolioRequest.fromBuffer(value),
            ($0.GetPortfolioResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPerformanceHistoryRequest,
            $0.GetPerformanceHistoryResponse>(
        'GetPerformanceHistory',
        getPerformanceHistory_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetPerformanceHistoryRequest.fromBuffer(value),
        ($0.GetPerformanceHistoryResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetPortfolioResponse> getPortfolio_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetPortfolioRequest> request) async {
    return getPortfolio(call, await request);
  }

  $async.Future<$0.GetPerformanceHistoryResponse> getPerformanceHistory_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetPerformanceHistoryRequest> request) async {
    return getPerformanceHistory(call, await request);
  }

  $async.Future<$0.GetPortfolioResponse> getPortfolio(
      $grpc.ServiceCall call, $0.GetPortfolioRequest request);
  $async.Future<$0.GetPerformanceHistoryResponse> getPerformanceHistory(
      $grpc.ServiceCall call, $0.GetPerformanceHistoryRequest request);
}
