// This is a generated file - do not edit.
//
// Generated from portfolio.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use assetTypeDescriptor instead')
const AssetType$json = {
  '1': 'AssetType',
  '2': [
    {'1': 'ASSET_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'ASSET_TYPE_STOCK', '2': 1},
    {'1': 'ASSET_TYPE_CRYPTO', '2': 2},
  ],
};

/// Descriptor for `AssetType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List assetTypeDescriptor = $convert.base64Decode(
    'CglBc3NldFR5cGUSGgoWQVNTRVRfVFlQRV9VTlNQRUNJRklFRBAAEhQKEEFTU0VUX1RZUEVfU1'
    'RPQ0sQARIVChFBU1NFVF9UWVBFX0NSWVBUTxAC');

@$core.Deprecated('Use timeRangeDescriptor instead')
const TimeRange$json = {
  '1': 'TimeRange',
  '2': [
    {'1': 'TIME_RANGE_UNSPECIFIED', '2': 0},
    {'1': 'TIME_RANGE_1D', '2': 1},
    {'1': 'TIME_RANGE_1W', '2': 2},
    {'1': 'TIME_RANGE_1M', '2': 3},
    {'1': 'TIME_RANGE_3M', '2': 4},
    {'1': 'TIME_RANGE_1Y', '2': 5},
  ],
};

/// Descriptor for `TimeRange`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List timeRangeDescriptor = $convert.base64Decode(
    'CglUaW1lUmFuZ2USGgoWVElNRV9SQU5HRV9VTlNQRUNJRklFRBAAEhEKDVRJTUVfUkFOR0VfMU'
    'QQARIRCg1USU1FX1JBTkdFXzFXEAISEQoNVElNRV9SQU5HRV8xTRADEhEKDVRJTUVfUkFOR0Vf'
    'M00QBBIRCg1USU1FX1JBTkdFXzFZEAU=');

@$core.Deprecated('Use assetDescriptor instead')
const Asset$json = {
  '1': 'Asset',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'symbol', '3': 2, '4': 1, '5': 9, '10': 'symbol'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'type',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.investsuite.AssetType',
      '10': 'type'
    },
    {'1': 'current_price', '3': 5, '4': 1, '5': 1, '10': 'currentPrice'},
    {'1': 'percent_change', '3': 6, '4': 1, '5': 1, '10': 'percentChange'},
    {'1': 'quantity', '3': 7, '4': 1, '5': 1, '10': 'quantity'},
    {'1': 'total_value', '3': 8, '4': 1, '5': 1, '10': 'totalValue'},
  ],
};

/// Descriptor for `Asset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetDescriptor = $convert.base64Decode(
    'CgVBc3NldBIOCgJpZBgBIAEoCVICaWQSFgoGc3ltYm9sGAIgASgJUgZzeW1ib2wSEgoEbmFtZR'
    'gDIAEoCVIEbmFtZRIqCgR0eXBlGAQgASgOMhYuaW52ZXN0c3VpdGUuQXNzZXRUeXBlUgR0eXBl'
    'EiMKDWN1cnJlbnRfcHJpY2UYBSABKAFSDGN1cnJlbnRQcmljZRIlCg5wZXJjZW50X2NoYW5nZR'
    'gGIAEoAVINcGVyY2VudENoYW5nZRIaCghxdWFudGl0eRgHIAEoAVIIcXVhbnRpdHkSHwoLdG90'
    'YWxfdmFsdWUYCCABKAFSCnRvdGFsVmFsdWU=');

@$core.Deprecated('Use portfolioDescriptor instead')
const Portfolio$json = {
  '1': 'Portfolio',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'assets',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.investsuite.Asset',
      '10': 'assets'
    },
    {'1': 'total_value', '3': 4, '4': 1, '5': 1, '10': 'totalValue'},
    {
      '1': 'total_percent_change',
      '3': 5,
      '4': 1,
      '5': 1,
      '10': 'totalPercentChange'
    },
  ],
};

/// Descriptor for `Portfolio`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List portfolioDescriptor = $convert.base64Decode(
    'CglQb3J0Zm9saW8SDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSKgoGYXNzZX'
    'RzGAMgAygLMhIuaW52ZXN0c3VpdGUuQXNzZXRSBmFzc2V0cxIfCgt0b3RhbF92YWx1ZRgEIAEo'
    'AVIKdG90YWxWYWx1ZRIwChR0b3RhbF9wZXJjZW50X2NoYW5nZRgFIAEoAVISdG90YWxQZXJjZW'
    '50Q2hhbmdl');

@$core.Deprecated('Use performanceDataPointDescriptor instead')
const PerformanceDataPoint$json = {
  '1': 'PerformanceDataPoint',
  '2': [
    {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'value', '3': 2, '4': 1, '5': 1, '10': 'value'},
  ],
};

/// Descriptor for `PerformanceDataPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List performanceDataPointDescriptor = $convert.base64Decode(
    'ChRQZXJmb3JtYW5jZURhdGFQb2ludBIcCgl0aW1lc3RhbXAYASABKANSCXRpbWVzdGFtcBIUCg'
    'V2YWx1ZRgCIAEoAVIFdmFsdWU=');

@$core.Deprecated('Use performanceHistoryDescriptor instead')
const PerformanceHistory$json = {
  '1': 'PerformanceHistory',
  '2': [
    {'1': 'portfolio_id', '3': 1, '4': 1, '5': 9, '10': 'portfolioId'},
    {
      '1': 'data_points',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.investsuite.PerformanceDataPoint',
      '10': 'dataPoints'
    },
    {'1': 'min_value', '3': 3, '4': 1, '5': 1, '10': 'minValue'},
    {'1': 'max_value', '3': 4, '4': 1, '5': 1, '10': 'maxValue'},
  ],
};

/// Descriptor for `PerformanceHistory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List performanceHistoryDescriptor = $convert.base64Decode(
    'ChJQZXJmb3JtYW5jZUhpc3RvcnkSIQoMcG9ydGZvbGlvX2lkGAEgASgJUgtwb3J0Zm9saW9JZB'
    'JCCgtkYXRhX3BvaW50cxgCIAMoCzIhLmludmVzdHN1aXRlLlBlcmZvcm1hbmNlRGF0YVBvaW50'
    'UgpkYXRhUG9pbnRzEhsKCW1pbl92YWx1ZRgDIAEoAVIIbWluVmFsdWUSGwoJbWF4X3ZhbHVlGA'
    'QgASgBUghtYXhWYWx1ZQ==');

@$core.Deprecated('Use getPortfolioRequestDescriptor instead')
const GetPortfolioRequest$json = {
  '1': 'GetPortfolioRequest',
  '2': [
    {'1': 'portfolio_id', '3': 1, '4': 1, '5': 9, '10': 'portfolioId'},
  ],
};

/// Descriptor for `GetPortfolioRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPortfolioRequestDescriptor = $convert.base64Decode(
    'ChNHZXRQb3J0Zm9saW9SZXF1ZXN0EiEKDHBvcnRmb2xpb19pZBgBIAEoCVILcG9ydGZvbGlvSW'
    'Q=');

@$core.Deprecated('Use getPerformanceHistoryRequestDescriptor instead')
const GetPerformanceHistoryRequest$json = {
  '1': 'GetPerformanceHistoryRequest',
  '2': [
    {'1': 'portfolio_id', '3': 1, '4': 1, '5': 9, '10': 'portfolioId'},
    {
      '1': 'time_range',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.investsuite.TimeRange',
      '10': 'timeRange'
    },
  ],
};

/// Descriptor for `GetPerformanceHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPerformanceHistoryRequestDescriptor =
    $convert.base64Decode(
        'ChxHZXRQZXJmb3JtYW5jZUhpc3RvcnlSZXF1ZXN0EiEKDHBvcnRmb2xpb19pZBgBIAEoCVILcG'
        '9ydGZvbGlvSWQSNQoKdGltZV9yYW5nZRgCIAEoDjIWLmludmVzdHN1aXRlLlRpbWVSYW5nZVIJ'
        'dGltZVJhbmdl');

@$core.Deprecated('Use getPortfolioResponseDescriptor instead')
const GetPortfolioResponse$json = {
  '1': 'GetPortfolioResponse',
  '2': [
    {
      '1': 'portfolio',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.investsuite.Portfolio',
      '10': 'portfolio'
    },
  ],
};

/// Descriptor for `GetPortfolioResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPortfolioResponseDescriptor = $convert.base64Decode(
    'ChRHZXRQb3J0Zm9saW9SZXNwb25zZRI0Cglwb3J0Zm9saW8YASABKAsyFi5pbnZlc3RzdWl0ZS'
    '5Qb3J0Zm9saW9SCXBvcnRmb2xpbw==');

@$core.Deprecated('Use getPerformanceHistoryResponseDescriptor instead')
const GetPerformanceHistoryResponse$json = {
  '1': 'GetPerformanceHistoryResponse',
  '2': [
    {
      '1': 'history',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.investsuite.PerformanceHistory',
      '10': 'history'
    },
  ],
};

/// Descriptor for `GetPerformanceHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPerformanceHistoryResponseDescriptor =
    $convert.base64Decode(
        'Ch1HZXRQZXJmb3JtYW5jZUhpc3RvcnlSZXNwb25zZRI5CgdoaXN0b3J5GAEgASgLMh8uaW52ZX'
        'N0c3VpdGUuUGVyZm9ybWFuY2VIaXN0b3J5UgdoaXN0b3J5');
