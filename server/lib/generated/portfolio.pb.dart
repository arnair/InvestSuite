// This is a generated file - do not edit.
//
// Generated from portfolio.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'portfolio.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'portfolio.pbenum.dart';

/// Asset represents a financial asset in the portfolio
class Asset extends $pb.GeneratedMessage {
  factory Asset({
    $core.String? id,
    $core.String? symbol,
    $core.String? name,
    AssetType? type,
    $core.double? currentPrice,
    $core.double? percentChange,
    $core.double? quantity,
    $core.double? totalValue,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (symbol != null) result.symbol = symbol;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    if (currentPrice != null) result.currentPrice = currentPrice;
    if (percentChange != null) result.percentChange = percentChange;
    if (quantity != null) result.quantity = quantity;
    if (totalValue != null) result.totalValue = totalValue;
    return result;
  }

  Asset._();

  factory Asset.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Asset.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Asset',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'symbol')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aE<AssetType>(4, _omitFieldNames ? '' : 'type',
        enumValues: AssetType.values)
    ..aD(5, _omitFieldNames ? '' : 'currentPrice')
    ..aD(6, _omitFieldNames ? '' : 'percentChange')
    ..aD(7, _omitFieldNames ? '' : 'quantity')
    ..aD(8, _omitFieldNames ? '' : 'totalValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset copyWith(void Function(Asset) updates) =>
      super.copyWith((message) => updates(message as Asset)) as Asset;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Asset create() => Asset._();
  @$core.override
  Asset createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Asset getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Asset>(create);
  static Asset? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  AssetType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(AssetType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get currentPrice => $_getN(4);
  @$pb.TagNumber(5)
  set currentPrice($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCurrentPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentPrice() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get percentChange => $_getN(5);
  @$pb.TagNumber(6)
  set percentChange($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPercentChange() => $_has(5);
  @$pb.TagNumber(6)
  void clearPercentChange() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get quantity => $_getN(6);
  @$pb.TagNumber(7)
  set quantity($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasQuantity() => $_has(6);
  @$pb.TagNumber(7)
  void clearQuantity() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get totalValue => $_getN(7);
  @$pb.TagNumber(8)
  set totalValue($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalValue() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalValue() => $_clearField(8);
}

/// Portfolio represents the entire user portfolio
class Portfolio extends $pb.GeneratedMessage {
  factory Portfolio({
    $core.String? id,
    $core.String? name,
    $core.Iterable<Asset>? assets,
    $core.double? totalValue,
    $core.double? totalPercentChange,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (assets != null) result.assets.addAll(assets);
    if (totalValue != null) result.totalValue = totalValue;
    if (totalPercentChange != null)
      result.totalPercentChange = totalPercentChange;
    return result;
  }

  Portfolio._();

  factory Portfolio.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Portfolio.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Portfolio',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pPM<Asset>(3, _omitFieldNames ? '' : 'assets', subBuilder: Asset.create)
    ..aD(4, _omitFieldNames ? '' : 'totalValue')
    ..aD(5, _omitFieldNames ? '' : 'totalPercentChange')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Portfolio clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Portfolio copyWith(void Function(Portfolio) updates) =>
      super.copyWith((message) => updates(message as Portfolio)) as Portfolio;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Portfolio create() => Portfolio._();
  @$core.override
  Portfolio createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Portfolio getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Portfolio>(create);
  static Portfolio? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<Asset> get assets => $_getList(2);

  @$pb.TagNumber(4)
  $core.double get totalValue => $_getN(3);
  @$pb.TagNumber(4)
  set totalValue($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalValue() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get totalPercentChange => $_getN(4);
  @$pb.TagNumber(5)
  set totalPercentChange($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotalPercentChange() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalPercentChange() => $_clearField(5);
}

/// PerformanceDataPoint for charting portfolio value over time
class PerformanceDataPoint extends $pb.GeneratedMessage {
  factory PerformanceDataPoint({
    $fixnum.Int64? timestamp,
    $core.double? value,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    if (value != null) result.value = value;
    return result;
  }

  PerformanceDataPoint._();

  factory PerformanceDataPoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PerformanceDataPoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PerformanceDataPoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..aD(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PerformanceDataPoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PerformanceDataPoint copyWith(void Function(PerformanceDataPoint) updates) =>
      super.copyWith((message) => updates(message as PerformanceDataPoint))
          as PerformanceDataPoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PerformanceDataPoint create() => PerformanceDataPoint._();
  @$core.override
  PerformanceDataPoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PerformanceDataPoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PerformanceDataPoint>(create);
  static PerformanceDataPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);
}

/// PerformanceHistory contains historical performance data
class PerformanceHistory extends $pb.GeneratedMessage {
  factory PerformanceHistory({
    $core.String? portfolioId,
    $core.Iterable<PerformanceDataPoint>? dataPoints,
    $core.double? minValue,
    $core.double? maxValue,
  }) {
    final result = create();
    if (portfolioId != null) result.portfolioId = portfolioId;
    if (dataPoints != null) result.dataPoints.addAll(dataPoints);
    if (minValue != null) result.minValue = minValue;
    if (maxValue != null) result.maxValue = maxValue;
    return result;
  }

  PerformanceHistory._();

  factory PerformanceHistory.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PerformanceHistory.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PerformanceHistory',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'portfolioId')
    ..pPM<PerformanceDataPoint>(2, _omitFieldNames ? '' : 'dataPoints',
        subBuilder: PerformanceDataPoint.create)
    ..aD(3, _omitFieldNames ? '' : 'minValue')
    ..aD(4, _omitFieldNames ? '' : 'maxValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PerformanceHistory clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PerformanceHistory copyWith(void Function(PerformanceHistory) updates) =>
      super.copyWith((message) => updates(message as PerformanceHistory))
          as PerformanceHistory;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PerformanceHistory create() => PerformanceHistory._();
  @$core.override
  PerformanceHistory createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PerformanceHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PerformanceHistory>(create);
  static PerformanceHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get portfolioId => $_getSZ(0);
  @$pb.TagNumber(1)
  set portfolioId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPortfolioId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortfolioId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<PerformanceDataPoint> get dataPoints => $_getList(1);

  @$pb.TagNumber(3)
  $core.double get minValue => $_getN(2);
  @$pb.TagNumber(3)
  set minValue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMinValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get maxValue => $_getN(3);
  @$pb.TagNumber(4)
  set maxValue($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMaxValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxValue() => $_clearField(4);
}

/// Request messages
class GetPortfolioRequest extends $pb.GeneratedMessage {
  factory GetPortfolioRequest({
    $core.String? portfolioId,
  }) {
    final result = create();
    if (portfolioId != null) result.portfolioId = portfolioId;
    return result;
  }

  GetPortfolioRequest._();

  factory GetPortfolioRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPortfolioRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPortfolioRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'portfolioId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPortfolioRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPortfolioRequest copyWith(void Function(GetPortfolioRequest) updates) =>
      super.copyWith((message) => updates(message as GetPortfolioRequest))
          as GetPortfolioRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPortfolioRequest create() => GetPortfolioRequest._();
  @$core.override
  GetPortfolioRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPortfolioRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPortfolioRequest>(create);
  static GetPortfolioRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get portfolioId => $_getSZ(0);
  @$pb.TagNumber(1)
  set portfolioId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPortfolioId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortfolioId() => $_clearField(1);
}

class GetPerformanceHistoryRequest extends $pb.GeneratedMessage {
  factory GetPerformanceHistoryRequest({
    $core.String? portfolioId,
    TimeRange? timeRange,
  }) {
    final result = create();
    if (portfolioId != null) result.portfolioId = portfolioId;
    if (timeRange != null) result.timeRange = timeRange;
    return result;
  }

  GetPerformanceHistoryRequest._();

  factory GetPerformanceHistoryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPerformanceHistoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPerformanceHistoryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'portfolioId')
    ..aE<TimeRange>(2, _omitFieldNames ? '' : 'timeRange',
        enumValues: TimeRange.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPerformanceHistoryRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPerformanceHistoryRequest copyWith(
          void Function(GetPerformanceHistoryRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetPerformanceHistoryRequest))
          as GetPerformanceHistoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPerformanceHistoryRequest create() =>
      GetPerformanceHistoryRequest._();
  @$core.override
  GetPerformanceHistoryRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPerformanceHistoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPerformanceHistoryRequest>(create);
  static GetPerformanceHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get portfolioId => $_getSZ(0);
  @$pb.TagNumber(1)
  set portfolioId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPortfolioId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortfolioId() => $_clearField(1);

  @$pb.TagNumber(2)
  TimeRange get timeRange => $_getN(1);
  @$pb.TagNumber(2)
  set timeRange(TimeRange value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTimeRange() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimeRange() => $_clearField(2);
}

/// Response messages
class GetPortfolioResponse extends $pb.GeneratedMessage {
  factory GetPortfolioResponse({
    Portfolio? portfolio,
  }) {
    final result = create();
    if (portfolio != null) result.portfolio = portfolio;
    return result;
  }

  GetPortfolioResponse._();

  factory GetPortfolioResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPortfolioResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPortfolioResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOM<Portfolio>(1, _omitFieldNames ? '' : 'portfolio',
        subBuilder: Portfolio.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPortfolioResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPortfolioResponse copyWith(void Function(GetPortfolioResponse) updates) =>
      super.copyWith((message) => updates(message as GetPortfolioResponse))
          as GetPortfolioResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPortfolioResponse create() => GetPortfolioResponse._();
  @$core.override
  GetPortfolioResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPortfolioResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPortfolioResponse>(create);
  static GetPortfolioResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Portfolio get portfolio => $_getN(0);
  @$pb.TagNumber(1)
  set portfolio(Portfolio value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPortfolio() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortfolio() => $_clearField(1);
  @$pb.TagNumber(1)
  Portfolio ensurePortfolio() => $_ensure(0);
}

class GetPerformanceHistoryResponse extends $pb.GeneratedMessage {
  factory GetPerformanceHistoryResponse({
    PerformanceHistory? history,
  }) {
    final result = create();
    if (history != null) result.history = history;
    return result;
  }

  GetPerformanceHistoryResponse._();

  factory GetPerformanceHistoryResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPerformanceHistoryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPerformanceHistoryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOM<PerformanceHistory>(1, _omitFieldNames ? '' : 'history',
        subBuilder: PerformanceHistory.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPerformanceHistoryResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPerformanceHistoryResponse copyWith(
          void Function(GetPerformanceHistoryResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetPerformanceHistoryResponse))
          as GetPerformanceHistoryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPerformanceHistoryResponse create() =>
      GetPerformanceHistoryResponse._();
  @$core.override
  GetPerformanceHistoryResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPerformanceHistoryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPerformanceHistoryResponse>(create);
  static GetPerformanceHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PerformanceHistory get history => $_getN(0);
  @$pb.TagNumber(1)
  set history(PerformanceHistory value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasHistory() => $_has(0);
  @$pb.TagNumber(1)
  void clearHistory() => $_clearField(1);
  @$pb.TagNumber(1)
  PerformanceHistory ensureHistory() => $_ensure(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
