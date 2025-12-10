// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PortfolioModel _$PortfolioModelFromJson(Map<String, dynamic> json) {
  return _PortfolioModel.fromJson(json);
}

/// @nodoc
mixin _$PortfolioModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<AssetModel> get assets => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;
  double get totalPercentChange => throw _privateConstructorUsedError;

  /// Serializes this PortfolioModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PortfolioModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PortfolioModelCopyWith<PortfolioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioModelCopyWith<$Res> {
  factory $PortfolioModelCopyWith(
    PortfolioModel value,
    $Res Function(PortfolioModel) then,
  ) = _$PortfolioModelCopyWithImpl<$Res, PortfolioModel>;
  @useResult
  $Res call({
    String id,
    String name,
    List<AssetModel> assets,
    double totalValue,
    double totalPercentChange,
  });
}

/// @nodoc
class _$PortfolioModelCopyWithImpl<$Res, $Val extends PortfolioModel>
    implements $PortfolioModelCopyWith<$Res> {
  _$PortfolioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PortfolioModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? assets = null,
    Object? totalValue = null,
    Object? totalPercentChange = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            assets: null == assets
                ? _value.assets
                : assets // ignore: cast_nullable_to_non_nullable
                      as List<AssetModel>,
            totalValue: null == totalValue
                ? _value.totalValue
                : totalValue // ignore: cast_nullable_to_non_nullable
                      as double,
            totalPercentChange: null == totalPercentChange
                ? _value.totalPercentChange
                : totalPercentChange // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PortfolioModelImplCopyWith<$Res>
    implements $PortfolioModelCopyWith<$Res> {
  factory _$$PortfolioModelImplCopyWith(
    _$PortfolioModelImpl value,
    $Res Function(_$PortfolioModelImpl) then,
  ) = __$$PortfolioModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    List<AssetModel> assets,
    double totalValue,
    double totalPercentChange,
  });
}

/// @nodoc
class __$$PortfolioModelImplCopyWithImpl<$Res>
    extends _$PortfolioModelCopyWithImpl<$Res, _$PortfolioModelImpl>
    implements _$$PortfolioModelImplCopyWith<$Res> {
  __$$PortfolioModelImplCopyWithImpl(
    _$PortfolioModelImpl _value,
    $Res Function(_$PortfolioModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PortfolioModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? assets = null,
    Object? totalValue = null,
    Object? totalPercentChange = null,
  }) {
    return _then(
      _$PortfolioModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        assets: null == assets
            ? _value._assets
            : assets // ignore: cast_nullable_to_non_nullable
                  as List<AssetModel>,
        totalValue: null == totalValue
            ? _value.totalValue
            : totalValue // ignore: cast_nullable_to_non_nullable
                  as double,
        totalPercentChange: null == totalPercentChange
            ? _value.totalPercentChange
            : totalPercentChange // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfolioModelImpl extends _PortfolioModel {
  const _$PortfolioModelImpl({
    required this.id,
    required this.name,
    required final List<AssetModel> assets,
    required this.totalValue,
    required this.totalPercentChange,
  }) : _assets = assets,
       super._();

  factory _$PortfolioModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<AssetModel> _assets;
  @override
  List<AssetModel> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  final double totalValue;
  @override
  final double totalPercentChange;

  @override
  String toString() {
    return 'PortfolioModel(id: $id, name: $name, assets: $assets, totalValue: $totalValue, totalPercentChange: $totalPercentChange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.totalPercentChange, totalPercentChange) ||
                other.totalPercentChange == totalPercentChange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_assets),
    totalValue,
    totalPercentChange,
  );

  /// Create a copy of PortfolioModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioModelImplCopyWith<_$PortfolioModelImpl> get copyWith =>
      __$$PortfolioModelImplCopyWithImpl<_$PortfolioModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioModelImplToJson(this);
  }
}

abstract class _PortfolioModel extends PortfolioModel {
  const factory _PortfolioModel({
    required final String id,
    required final String name,
    required final List<AssetModel> assets,
    required final double totalValue,
    required final double totalPercentChange,
  }) = _$PortfolioModelImpl;
  const _PortfolioModel._() : super._();

  factory _PortfolioModel.fromJson(Map<String, dynamic> json) =
      _$PortfolioModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<AssetModel> get assets;
  @override
  double get totalValue;
  @override
  double get totalPercentChange;

  /// Create a copy of PortfolioModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioModelImplCopyWith<_$PortfolioModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
