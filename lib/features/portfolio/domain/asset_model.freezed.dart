// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AssetModel _$AssetModelFromJson(Map<String, dynamic> json) {
  return _AssetModel.fromJson(json);
}

/// @nodoc
mixin _$AssetModel {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  AssetType get type => throw _privateConstructorUsedError;
  double get currentPrice => throw _privateConstructorUsedError;
  double get percentChange => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;

  /// Serializes this AssetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetModelCopyWith<AssetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetModelCopyWith<$Res> {
  factory $AssetModelCopyWith(
    AssetModel value,
    $Res Function(AssetModel) then,
  ) = _$AssetModelCopyWithImpl<$Res, AssetModel>;
  @useResult
  $Res call({
    String id,
    String symbol,
    String name,
    AssetType type,
    double currentPrice,
    double percentChange,
    double quantity,
    double totalValue,
  });
}

/// @nodoc
class _$AssetModelCopyWithImpl<$Res, $Val extends AssetModel>
    implements $AssetModelCopyWith<$Res> {
  _$AssetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = null,
    Object? type = null,
    Object? currentPrice = null,
    Object? percentChange = null,
    Object? quantity = null,
    Object? totalValue = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            symbol: null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as AssetType,
            currentPrice: null == currentPrice
                ? _value.currentPrice
                : currentPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            percentChange: null == percentChange
                ? _value.percentChange
                : percentChange // ignore: cast_nullable_to_non_nullable
                      as double,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as double,
            totalValue: null == totalValue
                ? _value.totalValue
                : totalValue // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssetModelImplCopyWith<$Res>
    implements $AssetModelCopyWith<$Res> {
  factory _$$AssetModelImplCopyWith(
    _$AssetModelImpl value,
    $Res Function(_$AssetModelImpl) then,
  ) = __$$AssetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String symbol,
    String name,
    AssetType type,
    double currentPrice,
    double percentChange,
    double quantity,
    double totalValue,
  });
}

/// @nodoc
class __$$AssetModelImplCopyWithImpl<$Res>
    extends _$AssetModelCopyWithImpl<$Res, _$AssetModelImpl>
    implements _$$AssetModelImplCopyWith<$Res> {
  __$$AssetModelImplCopyWithImpl(
    _$AssetModelImpl _value,
    $Res Function(_$AssetModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AssetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = null,
    Object? type = null,
    Object? currentPrice = null,
    Object? percentChange = null,
    Object? quantity = null,
    Object? totalValue = null,
  }) {
    return _then(
      _$AssetModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        symbol: null == symbol
            ? _value.symbol
            : symbol // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AssetType,
        currentPrice: null == currentPrice
            ? _value.currentPrice
            : currentPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        percentChange: null == percentChange
            ? _value.percentChange
            : percentChange // ignore: cast_nullable_to_non_nullable
                  as double,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double,
        totalValue: null == totalValue
            ? _value.totalValue
            : totalValue // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetModelImpl extends _AssetModel {
  const _$AssetModelImpl({
    required this.id,
    required this.symbol,
    required this.name,
    required this.type,
    required this.currentPrice,
    required this.percentChange,
    required this.quantity,
    required this.totalValue,
  }) : super._();

  factory _$AssetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetModelImplFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String name;
  @override
  final AssetType type;
  @override
  final double currentPrice;
  @override
  final double percentChange;
  @override
  final double quantity;
  @override
  final double totalValue;

  @override
  String toString() {
    return 'AssetModel(id: $id, symbol: $symbol, name: $name, type: $type, currentPrice: $currentPrice, percentChange: $percentChange, quantity: $quantity, totalValue: $totalValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.percentChange, percentChange) ||
                other.percentChange == percentChange) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    symbol,
    name,
    type,
    currentPrice,
    percentChange,
    quantity,
    totalValue,
  );

  /// Create a copy of AssetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetModelImplCopyWith<_$AssetModelImpl> get copyWith =>
      __$$AssetModelImplCopyWithImpl<_$AssetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetModelImplToJson(this);
  }
}

abstract class _AssetModel extends AssetModel {
  const factory _AssetModel({
    required final String id,
    required final String symbol,
    required final String name,
    required final AssetType type,
    required final double currentPrice,
    required final double percentChange,
    required final double quantity,
    required final double totalValue,
  }) = _$AssetModelImpl;
  const _AssetModel._() : super._();

  factory _AssetModel.fromJson(Map<String, dynamic> json) =
      _$AssetModelImpl.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String get name;
  @override
  AssetType get type;
  @override
  double get currentPrice;
  @override
  double get percentChange;
  @override
  double get quantity;
  @override
  double get totalValue;

  /// Create a copy of AssetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetModelImplCopyWith<_$AssetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
