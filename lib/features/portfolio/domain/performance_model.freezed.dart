// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'performance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PerformanceDataPoint _$PerformanceDataPointFromJson(Map<String, dynamic> json) {
  return _PerformanceDataPoint.fromJson(json);
}

/// @nodoc
mixin _$PerformanceDataPoint {
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  /// Serializes this PerformanceDataPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceDataPointCopyWith<PerformanceDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceDataPointCopyWith<$Res> {
  factory $PerformanceDataPointCopyWith(
    PerformanceDataPoint value,
    $Res Function(PerformanceDataPoint) then,
  ) = _$PerformanceDataPointCopyWithImpl<$Res, PerformanceDataPoint>;
  @useResult
  $Res call({DateTime timestamp, double value});
}

/// @nodoc
class _$PerformanceDataPointCopyWithImpl<
  $Res,
  $Val extends PerformanceDataPoint
>
    implements $PerformanceDataPointCopyWith<$Res> {
  _$PerformanceDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? timestamp = null, Object? value = null}) {
    return _then(
      _value.copyWith(
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PerformanceDataPointImplCopyWith<$Res>
    implements $PerformanceDataPointCopyWith<$Res> {
  factory _$$PerformanceDataPointImplCopyWith(
    _$PerformanceDataPointImpl value,
    $Res Function(_$PerformanceDataPointImpl) then,
  ) = __$$PerformanceDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime timestamp, double value});
}

/// @nodoc
class __$$PerformanceDataPointImplCopyWithImpl<$Res>
    extends _$PerformanceDataPointCopyWithImpl<$Res, _$PerformanceDataPointImpl>
    implements _$$PerformanceDataPointImplCopyWith<$Res> {
  __$$PerformanceDataPointImplCopyWithImpl(
    _$PerformanceDataPointImpl _value,
    $Res Function(_$PerformanceDataPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PerformanceDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? timestamp = null, Object? value = null}) {
    return _then(
      _$PerformanceDataPointImpl(
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceDataPointImpl implements _PerformanceDataPoint {
  const _$PerformanceDataPointImpl({
    required this.timestamp,
    required this.value,
  });

  factory _$PerformanceDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceDataPointImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final double value;

  @override
  String toString() {
    return 'PerformanceDataPoint(timestamp: $timestamp, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceDataPointImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, value);

  /// Create a copy of PerformanceDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceDataPointImplCopyWith<_$PerformanceDataPointImpl>
  get copyWith =>
      __$$PerformanceDataPointImplCopyWithImpl<_$PerformanceDataPointImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceDataPointImplToJson(this);
  }
}

abstract class _PerformanceDataPoint implements PerformanceDataPoint {
  const factory _PerformanceDataPoint({
    required final DateTime timestamp,
    required final double value,
  }) = _$PerformanceDataPointImpl;

  factory _PerformanceDataPoint.fromJson(Map<String, dynamic> json) =
      _$PerformanceDataPointImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  double get value;

  /// Create a copy of PerformanceDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceDataPointImplCopyWith<_$PerformanceDataPointImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PerformanceHistory _$PerformanceHistoryFromJson(Map<String, dynamic> json) {
  return _PerformanceHistory.fromJson(json);
}

/// @nodoc
mixin _$PerformanceHistory {
  String get portfolioId => throw _privateConstructorUsedError;
  List<PerformanceDataPoint> get dataPoints =>
      throw _privateConstructorUsedError;
  double get minValue => throw _privateConstructorUsedError;
  double get maxValue => throw _privateConstructorUsedError;

  /// Serializes this PerformanceHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceHistoryCopyWith<PerformanceHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceHistoryCopyWith<$Res> {
  factory $PerformanceHistoryCopyWith(
    PerformanceHistory value,
    $Res Function(PerformanceHistory) then,
  ) = _$PerformanceHistoryCopyWithImpl<$Res, PerformanceHistory>;
  @useResult
  $Res call({
    String portfolioId,
    List<PerformanceDataPoint> dataPoints,
    double minValue,
    double maxValue,
  });
}

/// @nodoc
class _$PerformanceHistoryCopyWithImpl<$Res, $Val extends PerformanceHistory>
    implements $PerformanceHistoryCopyWith<$Res> {
  _$PerformanceHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? portfolioId = null,
    Object? dataPoints = null,
    Object? minValue = null,
    Object? maxValue = null,
  }) {
    return _then(
      _value.copyWith(
            portfolioId: null == portfolioId
                ? _value.portfolioId
                : portfolioId // ignore: cast_nullable_to_non_nullable
                      as String,
            dataPoints: null == dataPoints
                ? _value.dataPoints
                : dataPoints // ignore: cast_nullable_to_non_nullable
                      as List<PerformanceDataPoint>,
            minValue: null == minValue
                ? _value.minValue
                : minValue // ignore: cast_nullable_to_non_nullable
                      as double,
            maxValue: null == maxValue
                ? _value.maxValue
                : maxValue // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PerformanceHistoryImplCopyWith<$Res>
    implements $PerformanceHistoryCopyWith<$Res> {
  factory _$$PerformanceHistoryImplCopyWith(
    _$PerformanceHistoryImpl value,
    $Res Function(_$PerformanceHistoryImpl) then,
  ) = __$$PerformanceHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String portfolioId,
    List<PerformanceDataPoint> dataPoints,
    double minValue,
    double maxValue,
  });
}

/// @nodoc
class __$$PerformanceHistoryImplCopyWithImpl<$Res>
    extends _$PerformanceHistoryCopyWithImpl<$Res, _$PerformanceHistoryImpl>
    implements _$$PerformanceHistoryImplCopyWith<$Res> {
  __$$PerformanceHistoryImplCopyWithImpl(
    _$PerformanceHistoryImpl _value,
    $Res Function(_$PerformanceHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PerformanceHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? portfolioId = null,
    Object? dataPoints = null,
    Object? minValue = null,
    Object? maxValue = null,
  }) {
    return _then(
      _$PerformanceHistoryImpl(
        portfolioId: null == portfolioId
            ? _value.portfolioId
            : portfolioId // ignore: cast_nullable_to_non_nullable
                  as String,
        dataPoints: null == dataPoints
            ? _value._dataPoints
            : dataPoints // ignore: cast_nullable_to_non_nullable
                  as List<PerformanceDataPoint>,
        minValue: null == minValue
            ? _value.minValue
            : minValue // ignore: cast_nullable_to_non_nullable
                  as double,
        maxValue: null == maxValue
            ? _value.maxValue
            : maxValue // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceHistoryImpl extends _PerformanceHistory {
  const _$PerformanceHistoryImpl({
    required this.portfolioId,
    required final List<PerformanceDataPoint> dataPoints,
    required this.minValue,
    required this.maxValue,
  }) : _dataPoints = dataPoints,
       super._();

  factory _$PerformanceHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceHistoryImplFromJson(json);

  @override
  final String portfolioId;
  final List<PerformanceDataPoint> _dataPoints;
  @override
  List<PerformanceDataPoint> get dataPoints {
    if (_dataPoints is EqualUnmodifiableListView) return _dataPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataPoints);
  }

  @override
  final double minValue;
  @override
  final double maxValue;

  @override
  String toString() {
    return 'PerformanceHistory(portfolioId: $portfolioId, dataPoints: $dataPoints, minValue: $minValue, maxValue: $maxValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceHistoryImpl &&
            (identical(other.portfolioId, portfolioId) ||
                other.portfolioId == portfolioId) &&
            const DeepCollectionEquality().equals(
              other._dataPoints,
              _dataPoints,
            ) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    portfolioId,
    const DeepCollectionEquality().hash(_dataPoints),
    minValue,
    maxValue,
  );

  /// Create a copy of PerformanceHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceHistoryImplCopyWith<_$PerformanceHistoryImpl> get copyWith =>
      __$$PerformanceHistoryImplCopyWithImpl<_$PerformanceHistoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceHistoryImplToJson(this);
  }
}

abstract class _PerformanceHistory extends PerformanceHistory {
  const factory _PerformanceHistory({
    required final String portfolioId,
    required final List<PerformanceDataPoint> dataPoints,
    required final double minValue,
    required final double maxValue,
  }) = _$PerformanceHistoryImpl;
  const _PerformanceHistory._() : super._();

  factory _PerformanceHistory.fromJson(Map<String, dynamic> json) =
      _$PerformanceHistoryImpl.fromJson;

  @override
  String get portfolioId;
  @override
  List<PerformanceDataPoint> get dataPoints;
  @override
  double get minValue;
  @override
  double get maxValue;

  /// Create a copy of PerformanceHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceHistoryImplCopyWith<_$PerformanceHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
