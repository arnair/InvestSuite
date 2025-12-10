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

import 'package:protobuf/protobuf.dart' as $pb;

/// AssetType enum for different asset categories
class AssetType extends $pb.ProtobufEnum {
  static const AssetType ASSET_TYPE_UNSPECIFIED =
      AssetType._(0, _omitEnumNames ? '' : 'ASSET_TYPE_UNSPECIFIED');
  static const AssetType ASSET_TYPE_STOCK =
      AssetType._(1, _omitEnumNames ? '' : 'ASSET_TYPE_STOCK');
  static const AssetType ASSET_TYPE_ETF =
      AssetType._(2, _omitEnumNames ? '' : 'ASSET_TYPE_ETF');
  static const AssetType ASSET_TYPE_BOND =
      AssetType._(3, _omitEnumNames ? '' : 'ASSET_TYPE_BOND');
  static const AssetType ASSET_TYPE_CRYPTO =
      AssetType._(4, _omitEnumNames ? '' : 'ASSET_TYPE_CRYPTO');

  static const $core.List<AssetType> values = <AssetType>[
    ASSET_TYPE_UNSPECIFIED,
    ASSET_TYPE_STOCK,
    ASSET_TYPE_ETF,
    ASSET_TYPE_BOND,
    ASSET_TYPE_CRYPTO,
  ];

  static final $core.Map<$core.int, AssetType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static AssetType? valueOf($core.int value) => _byValue[value];

  const AssetType._($core.int v, $core.String n) : super(v, n);
}

/// TimeRange enum for performance history
class TimeRange extends $pb.ProtobufEnum {
  static const TimeRange TIME_RANGE_UNSPECIFIED =
      TimeRange._(0, _omitEnumNames ? '' : 'TIME_RANGE_UNSPECIFIED');
  static const TimeRange TIME_RANGE_1D =
      TimeRange._(1, _omitEnumNames ? '' : 'TIME_RANGE_1D');
  static const TimeRange TIME_RANGE_1W =
      TimeRange._(2, _omitEnumNames ? '' : 'TIME_RANGE_1W');
  static const TimeRange TIME_RANGE_1M =
      TimeRange._(3, _omitEnumNames ? '' : 'TIME_RANGE_1M');
  static const TimeRange TIME_RANGE_3M =
      TimeRange._(4, _omitEnumNames ? '' : 'TIME_RANGE_3M');
  static const TimeRange TIME_RANGE_1Y =
      TimeRange._(5, _omitEnumNames ? '' : 'TIME_RANGE_1Y');
  static const TimeRange TIME_RANGE_2Y =
      TimeRange._(6, _omitEnumNames ? '' : 'TIME_RANGE_2Y');

  static const $core.List<TimeRange> values = <TimeRange>[
    TIME_RANGE_UNSPECIFIED,
    TIME_RANGE_1D,
    TIME_RANGE_1W,
    TIME_RANGE_1M,
    TIME_RANGE_3M,
    TIME_RANGE_1Y,
    TIME_RANGE_2Y,
  ];

  static final $core.Map<$core.int, TimeRange> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static TimeRange? valueOf($core.int value) => _byValue[value];

  const TimeRange._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
