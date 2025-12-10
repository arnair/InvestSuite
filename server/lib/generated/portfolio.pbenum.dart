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

import 'package:protobuf/protobuf.dart' as $pb;

/// AssetType enum for different asset categories
class AssetType extends $pb.ProtobufEnum {
  static const AssetType ASSET_TYPE_UNSPECIFIED =
      AssetType._(0, _omitEnumNames ? '' : 'ASSET_TYPE_UNSPECIFIED');
  static const AssetType ASSET_TYPE_STOCK =
      AssetType._(1, _omitEnumNames ? '' : 'ASSET_TYPE_STOCK');
  static const AssetType ASSET_TYPE_CRYPTO =
      AssetType._(2, _omitEnumNames ? '' : 'ASSET_TYPE_CRYPTO');

  static const $core.List<AssetType> values = <AssetType>[
    ASSET_TYPE_UNSPECIFIED,
    ASSET_TYPE_STOCK,
    ASSET_TYPE_CRYPTO,
  ];

  static final $core.List<AssetType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static AssetType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AssetType._(super.value, super.name);
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

  static const $core.List<TimeRange> values = <TimeRange>[
    TIME_RANGE_UNSPECIFIED,
    TIME_RANGE_1D,
    TIME_RANGE_1W,
    TIME_RANGE_1M,
    TIME_RANGE_3M,
    TIME_RANGE_1Y,
  ];

  static final $core.List<TimeRange?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static TimeRange? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TimeRange._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
