//
//  Generated code. Do not modify.
//  source: portfolio.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'portfolio.pbenum.dart';

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
    final $result = create();
    if (id != null) $result.id = id;
    if (symbol != null) $result.symbol = symbol;
    if (name != null) $result.name = name;
    if (type != null) $result.type = type;
    if (currentPrice != null) $result.currentPrice = currentPrice;
    if (percentChange != null) $result.percentChange = percentChange;
    if (quantity != null) $result.quantity = quantity;
    if (totalValue != null) $result.totalValue = totalValue;
    return $result;
  }

  Asset._() : super();

  factory Asset.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Asset.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Asset',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'symbol')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..e<AssetType>(4, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: AssetType.ASSET_TYPE_UNSPECIFIED,
        valueOf: AssetType.valueOf,
        enumValues: AssetType.values)
    ..a<$core.double>(
        5, _omitFieldNames ? '' : 'currentPrice', $pb.PbFieldType.OD)
    ..a<$core.double>(
        6, _omitFieldNames ? '' : 'percentChange', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.OD)
    ..a<$core.double>(
        8, _omitFieldNames ? '' : 'totalValue', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead.')
  Asset clone() => Asset()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead.')
  Asset copyWith(void Function(Asset) updates) =>
      super.copyWith((message) => updates(message as Asset)) as Asset;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Asset create() => Asset._();

  Asset createEmptyInstance() => create();

  static $pb.PbList<Asset> createRepeated() => $pb.PbList<Asset>();

  @$core.pragma('dart2js:noInline')
  static Asset getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Asset>(create);
  static Asset? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  AssetType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(AssetType v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get currentPrice => $_getN(4);
  @$pb.TagNumber(5)
  set currentPrice($core.double v) {
    $_setDouble(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCurrentPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get percentChange => $_getN(5);
  @$pb.TagNumber(6)
  set percentChange($core.double v) {
    $_setDouble(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPercentChange() => $_has(5);
  @$pb.TagNumber(6)
  void clearPercentChange() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get quantity => $_getN(6);
  @$pb.TagNumber(7)
  set quantity($core.double v) {
    $_setDouble(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasQuantity() => $_has(6);
  @$pb.TagNumber(7)
  void clearQuantity() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get totalValue => $_getN(7);
  @$pb.TagNumber(8)
  set totalValue($core.double v) {
    $_setDouble(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTotalValue() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalValue() => clearField(8);
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
    final $result = create();
    if (id != null) $result.id = id;
    if (name != null) $result.name = name;
    if (assets != null) $result.assets.addAll(assets);
    if (totalValue != null) $result.totalValue = totalValue;
    if (totalPercentChange != null) {
      $result.totalPercentChange = totalPercentChange;
    }
    return $result;
  }

  Portfolio._() : super();

  factory Portfolio.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Portfolio.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Portfolio',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pc<Asset>(3, _omitFieldNames ? '' : 'assets', $pb.PbFieldType.PM,
        subBuilder: Asset.create)
    ..a<$core.double>(
        4, _omitFieldNames ? '' : 'totalValue', $pb.PbFieldType.OD)
    ..a<$core.double>(
        5, _omitFieldNames ? '' : 'totalPercentChange', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead.')
  Portfolio clone() => Portfolio()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead.')
  Portfolio copyWith(void Function(Portfolio) updates) =>
      super.copyWith((message) => updates(message as Portfolio)) as Portfolio;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Portfolio create() => Portfolio._();

  Portfolio createEmptyInstance() => create();

  static $pb.PbList<Portfolio> createRepeated() => $pb.PbList<Portfolio>();

  @$core.pragma('dart2js:noInline')
  static Portfolio getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Portfolio>(create);
  static Portfolio? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Asset> get assets => $_getList(2);

  @$pb.TagNumber(4)
  $core.double get totalValue => $_getN(3);
  @$pb.TagNumber(4)
  set totalValue($core.double v) {
    $_setDouble(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTotalValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalValue() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get totalPercentChange => $_getN(4);
  @$pb.TagNumber(5)
  set totalPercentChange($core.double v) {
    $_setDouble(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTotalPercentChange() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalPercentChange() => clearField(5);
}

/// PerformanceDataPoint for charting portfolio value over time
class PerformanceDataPoint extends $pb.GeneratedMessage {
  factory PerformanceDataPoint({
    $fixnum.Int64? timestamp,
    $core.double? value,
  }) {
    final $result = create();
    if (timestamp != null) $result.timestamp = timestamp;
    if (value != null) $result.value = value;
    return $result;
  }

  PerformanceDataPoint._() : super();

  factory PerformanceDataPoint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory PerformanceDataPoint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PerformanceDataPoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead.')
  PerformanceDataPoint clone() =>
      PerformanceDataPoint()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead.')
  PerformanceDataPoint copyWith(void Function(PerformanceDataPoint) updates) =>
      super.copyWith((message) => updates(message as PerformanceDataPoint))
          as PerformanceDataPoint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PerformanceDataPoint create() => PerformanceDataPoint._();

  PerformanceDataPoint createEmptyInstance() => create();

  static $pb.PbList<PerformanceDataPoint> createRepeated() =>
      $pb.PbList<PerformanceDataPoint>();

  @$core.pragma('dart2js:noInline')
  static PerformanceDataPoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PerformanceDataPoint>(create);
  static PerformanceDataPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

/// PerformanceHistory contains historical performance data
class PerformanceHistory extends $pb.GeneratedMessage {
  factory PerformanceHistory({
    $core.String? portfolioId,
    $core.Iterable<PerformanceDataPoint>? dataPoints,
    $core.double? minValue,
    $core.double? maxValue,
  }) {
    final $result = create();
    if (portfolioId != null) $result.portfolioId = portfolioId;
    if (dataPoints != null) $result.dataPoints.addAll(dataPoints);
    if (minValue != null) $result.minValue = minValue;
    if (maxValue != null) $result.maxValue = maxValue;
    return $result;
  }

  PerformanceHistory._() : super();

  factory PerformanceHistory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory PerformanceHistory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PerformanceHistory',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'portfolioId')
    ..pc<PerformanceDataPoint>(
        2, _omitFieldNames ? '' : 'dataPoints', $pb.PbFieldType.PM,
        subBuilder: PerformanceDataPoint.create)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'minValue', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'maxValue', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead.')
  PerformanceHistory clone() => PerformanceHistory()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead.')
  PerformanceHistory copyWith(void Function(PerformanceHistory) updates) =>
      super.copyWith((message) => updates(message as PerformanceHistory))
          as PerformanceHistory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PerformanceHistory create() => PerformanceHistory._();

  PerformanceHistory createEmptyInstance() => create();

  static $pb.PbList<PerformanceHistory> createRepeated() =>
      $pb.PbList<PerformanceHistory>();

  @$core.pragma('dart2js:noInline')
  static PerformanceHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PerformanceHistory>(create);
  static PerformanceHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get portfolioId => $_getSZ(0);
  @$pb.TagNumber(1)
  set portfolioId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPortfolioId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortfolioId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<PerformanceDataPoint> get dataPoints => $_getList(1);

  @$pb.TagNumber(3)
  $core.double get minValue => $_getN(2);
  @$pb.TagNumber(3)
  set minValue($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMinValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get maxValue => $_getN(3);
  @$pb.TagNumber(4)
  set maxValue($core.double v) {
    $_setDouble(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMaxValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxValue() => clearField(4);
}

/// Request messages
class GetPortfolioRequest extends $pb.GeneratedMessage {
  factory GetPortfolioRequest({
    $core.String? portfolioId,
  }) {
    final $result = create();
    if (portfolioId != null) $result.portfolioId = portfolioId;
    return $result;
  }

  GetPortfolioRequest._() : super();

  factory GetPortfolioRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory GetPortfolioRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPortfolioRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'portfolioId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead.')
  GetPortfolioRequest clone() => GetPortfolioRequest()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead.')
  GetPortfolioRequest copyWith(void Function(GetPortfolioRequest) updates) =>
      super.copyWith((message) => updates(message as GetPortfolioRequest))
          as GetPortfolioRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPortfolioRequest create() => GetPortfolioRequest._();

  GetPortfolioRequest createEmptyInstance() => create();

  static $pb.PbList<GetPortfolioRequest> createRepeated() =>
      $pb.PbList<GetPortfolioRequest>();

  @$core.pragma('dart2js:noInline')
  static GetPortfolioRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPortfolioRequest>(create);
  static GetPortfolioRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get portfolioId => $_getSZ(0);
  @$pb.TagNumber(1)
  set portfolioId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPortfolioId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortfolioId() => clearField(1);
}

class GetPerformanceHistoryRequest extends $pb.GeneratedMessage {
  factory GetPerformanceHistoryRequest({
    $core.String? portfolioId,
    TimeRange? timeRange,
  }) {
    final $result = create();
    if (portfolioId != null) $result.portfolioId = portfolioId;
    if (timeRange != null) $result.timeRange = timeRange;
    return $result;
  }

  GetPerformanceHistoryRequest._() : super();

  factory GetPerformanceHistoryRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory GetPerformanceHistoryRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPerformanceHistoryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'portfolioId')
    ..e<TimeRange>(2, _omitFieldNames ? '' : 'timeRange', $pb.PbFieldType.OE,
        defaultOrMaker: TimeRange.TIME_RANGE_UNSPECIFIED,
        valueOf: TimeRange.valueOf,
        enumValues: TimeRange.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead.')
  GetPerformanceHistoryRequest clone() =>
      GetPerformanceHistoryRequest()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead.')
  GetPerformanceHistoryRequest copyWith(
          void Function(GetPerformanceHistoryRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetPerformanceHistoryRequest))
          as GetPerformanceHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPerformanceHistoryRequest create() =>
      GetPerformanceHistoryRequest._();

  GetPerformanceHistoryRequest createEmptyInstance() => create();

  static $pb.PbList<GetPerformanceHistoryRequest> createRepeated() =>
      $pb.PbList<GetPerformanceHistoryRequest>();

  @$core.pragma('dart2js:noInline')
  static GetPerformanceHistoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPerformanceHistoryRequest>(create);
  static GetPerformanceHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get portfolioId => $_getSZ(0);
  @$pb.TagNumber(1)
  set portfolioId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPortfolioId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortfolioId() => clearField(1);

  @$pb.TagNumber(2)
  TimeRange get timeRange => $_getN(1);
  @$pb.TagNumber(2)
  set timeRange(TimeRange v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTimeRange() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimeRange() => clearField(2);
}

/// Response messages
class GetPortfolioResponse extends $pb.GeneratedMessage {
  factory GetPortfolioResponse({
    Portfolio? portfolio,
  }) {
    final $result = create();
    if (portfolio != null) $result.portfolio = portfolio;
    return $result;
  }

  GetPortfolioResponse._() : super();

  factory GetPortfolioResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory GetPortfolioResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPortfolioResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOM<Portfolio>(1, _omitFieldNames ? '' : 'portfolio',
        subBuilder: Portfolio.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead.')
  GetPortfolioResponse clone() =>
      GetPortfolioResponse()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead.')
  GetPortfolioResponse copyWith(void Function(GetPortfolioResponse) updates) =>
      super.copyWith((message) => updates(message as GetPortfolioResponse))
          as GetPortfolioResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPortfolioResponse create() => GetPortfolioResponse._();

  GetPortfolioResponse createEmptyInstance() => create();

  static $pb.PbList<GetPortfolioResponse> createRepeated() =>
      $pb.PbList<GetPortfolioResponse>();

  @$core.pragma('dart2js:noInline')
  static GetPortfolioResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPortfolioResponse>(create);
  static GetPortfolioResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Portfolio get portfolio => $_getN(0);
  @$pb.TagNumber(1)
  set portfolio(Portfolio v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPortfolio() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortfolio() => clearField(1);
  @$pb.TagNumber(1)
  Portfolio ensurePortfolio() => $_ensure(0);
}

class GetPerformanceHistoryResponse extends $pb.GeneratedMessage {
  factory GetPerformanceHistoryResponse({
    PerformanceHistory? history,
  }) {
    final $result = create();
    if (history != null) $result.history = history;
    return $result;
  }

  GetPerformanceHistoryResponse._() : super();

  factory GetPerformanceHistoryResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory GetPerformanceHistoryResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPerformanceHistoryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'investsuite'),
      createEmptyInstance: create)
    ..aOM<PerformanceHistory>(1, _omitFieldNames ? '' : 'history',
        subBuilder: PerformanceHistory.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead.')
  GetPerformanceHistoryResponse clone() =>
      GetPerformanceHistoryResponse()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead.')
  GetPerformanceHistoryResponse copyWith(
          void Function(GetPerformanceHistoryResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetPerformanceHistoryResponse))
          as GetPerformanceHistoryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPerformanceHistoryResponse create() =>
      GetPerformanceHistoryResponse._();

  GetPerformanceHistoryResponse createEmptyInstance() => create();

  static $pb.PbList<GetPerformanceHistoryResponse> createRepeated() =>
      $pb.PbList<GetPerformanceHistoryResponse>();

  @$core.pragma('dart2js:noInline')
  static GetPerformanceHistoryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPerformanceHistoryResponse>(create);
  static GetPerformanceHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PerformanceHistory get history => $_getN(0);
  @$pb.TagNumber(1)
  set history(PerformanceHistory v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHistory() => $_has(0);
  @$pb.TagNumber(1)
  void clearHistory() => clearField(1);
  @$pb.TagNumber(1)
  PerformanceHistory ensureHistory() => $_ensure(0);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
