// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecommendDTO _$RecommendDTOFromJson(Map<String, dynamic> json) {
  return _RecommendDTO.fromJson(json);
}

/// @nodoc
mixin _$RecommendDTO {
  String? get name => throw _privateConstructorUsedError;
  SkinConditionType get basicSkinType =>
      throw _privateConstructorUsedError; // Updated to use the new enum name
  List<SkinType>? get advancedSkinType => throw _privateConstructorUsedError;
  List<String> get cosNames => throw _privateConstructorUsedError;
  List<String> get cosPaths => throw _privateConstructorUsedError;
  List<String> get nutrNames => throw _privateConstructorUsedError;
  List<String> get nutrPaths => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendDTOCopyWith<RecommendDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendDTOCopyWith<$Res> {
  factory $RecommendDTOCopyWith(
          RecommendDTO value, $Res Function(RecommendDTO) then) =
      _$RecommendDTOCopyWithImpl<$Res, RecommendDTO>;
  @useResult
  $Res call(
      {String? name,
      SkinConditionType basicSkinType,
      List<SkinType>? advancedSkinType,
      List<String> cosNames,
      List<String> cosPaths,
      List<String> nutrNames,
      List<String> nutrPaths});
}

/// @nodoc
class _$RecommendDTOCopyWithImpl<$Res, $Val extends RecommendDTO>
    implements $RecommendDTOCopyWith<$Res> {
  _$RecommendDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? basicSkinType = null,
    Object? advancedSkinType = freezed,
    Object? cosNames = null,
    Object? cosPaths = null,
    Object? nutrNames = null,
    Object? nutrPaths = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      basicSkinType: null == basicSkinType
          ? _value.basicSkinType
          : basicSkinType // ignore: cast_nullable_to_non_nullable
              as SkinConditionType,
      advancedSkinType: freezed == advancedSkinType
          ? _value.advancedSkinType
          : advancedSkinType // ignore: cast_nullable_to_non_nullable
              as List<SkinType>?,
      cosNames: null == cosNames
          ? _value.cosNames
          : cosNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cosPaths: null == cosPaths
          ? _value.cosPaths
          : cosPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nutrNames: null == nutrNames
          ? _value.nutrNames
          : nutrNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nutrPaths: null == nutrPaths
          ? _value.nutrPaths
          : nutrPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendDTOImplCopyWith<$Res>
    implements $RecommendDTOCopyWith<$Res> {
  factory _$$RecommendDTOImplCopyWith(
          _$RecommendDTOImpl value, $Res Function(_$RecommendDTOImpl) then) =
      __$$RecommendDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      SkinConditionType basicSkinType,
      List<SkinType>? advancedSkinType,
      List<String> cosNames,
      List<String> cosPaths,
      List<String> nutrNames,
      List<String> nutrPaths});
}

/// @nodoc
class __$$RecommendDTOImplCopyWithImpl<$Res>
    extends _$RecommendDTOCopyWithImpl<$Res, _$RecommendDTOImpl>
    implements _$$RecommendDTOImplCopyWith<$Res> {
  __$$RecommendDTOImplCopyWithImpl(
      _$RecommendDTOImpl _value, $Res Function(_$RecommendDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? basicSkinType = null,
    Object? advancedSkinType = freezed,
    Object? cosNames = null,
    Object? cosPaths = null,
    Object? nutrNames = null,
    Object? nutrPaths = null,
  }) {
    return _then(_$RecommendDTOImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      basicSkinType: null == basicSkinType
          ? _value.basicSkinType
          : basicSkinType // ignore: cast_nullable_to_non_nullable
              as SkinConditionType,
      advancedSkinType: freezed == advancedSkinType
          ? _value._advancedSkinType
          : advancedSkinType // ignore: cast_nullable_to_non_nullable
              as List<SkinType>?,
      cosNames: null == cosNames
          ? _value._cosNames
          : cosNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cosPaths: null == cosPaths
          ? _value._cosPaths
          : cosPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nutrNames: null == nutrNames
          ? _value._nutrNames
          : nutrNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nutrPaths: null == nutrPaths
          ? _value._nutrPaths
          : nutrPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendDTOImpl implements _RecommendDTO {
  const _$RecommendDTOImpl(
      {this.name,
      required this.basicSkinType,
      required final List<SkinType>? advancedSkinType,
      required final List<String> cosNames,
      required final List<String> cosPaths,
      required final List<String> nutrNames,
      required final List<String> nutrPaths})
      : _advancedSkinType = advancedSkinType,
        _cosNames = cosNames,
        _cosPaths = cosPaths,
        _nutrNames = nutrNames,
        _nutrPaths = nutrPaths;

  factory _$RecommendDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendDTOImplFromJson(json);

  @override
  final String? name;
  @override
  final SkinConditionType basicSkinType;
// Updated to use the new enum name
  final List<SkinType>? _advancedSkinType;
// Updated to use the new enum name
  @override
  List<SkinType>? get advancedSkinType {
    final value = _advancedSkinType;
    if (value == null) return null;
    if (_advancedSkinType is EqualUnmodifiableListView)
      return _advancedSkinType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String> _cosNames;
  @override
  List<String> get cosNames {
    if (_cosNames is EqualUnmodifiableListView) return _cosNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cosNames);
  }

  final List<String> _cosPaths;
  @override
  List<String> get cosPaths {
    if (_cosPaths is EqualUnmodifiableListView) return _cosPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cosPaths);
  }

  final List<String> _nutrNames;
  @override
  List<String> get nutrNames {
    if (_nutrNames is EqualUnmodifiableListView) return _nutrNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutrNames);
  }

  final List<String> _nutrPaths;
  @override
  List<String> get nutrPaths {
    if (_nutrPaths is EqualUnmodifiableListView) return _nutrPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutrPaths);
  }

  @override
  String toString() {
    return 'RecommendDTO(name: $name, basicSkinType: $basicSkinType, advancedSkinType: $advancedSkinType, cosNames: $cosNames, cosPaths: $cosPaths, nutrNames: $nutrNames, nutrPaths: $nutrPaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendDTOImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.basicSkinType, basicSkinType) ||
                other.basicSkinType == basicSkinType) &&
            const DeepCollectionEquality()
                .equals(other._advancedSkinType, _advancedSkinType) &&
            const DeepCollectionEquality().equals(other._cosNames, _cosNames) &&
            const DeepCollectionEquality().equals(other._cosPaths, _cosPaths) &&
            const DeepCollectionEquality()
                .equals(other._nutrNames, _nutrNames) &&
            const DeepCollectionEquality()
                .equals(other._nutrPaths, _nutrPaths));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      basicSkinType,
      const DeepCollectionEquality().hash(_advancedSkinType),
      const DeepCollectionEquality().hash(_cosNames),
      const DeepCollectionEquality().hash(_cosPaths),
      const DeepCollectionEquality().hash(_nutrNames),
      const DeepCollectionEquality().hash(_nutrPaths));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendDTOImplCopyWith<_$RecommendDTOImpl> get copyWith =>
      __$$RecommendDTOImplCopyWithImpl<_$RecommendDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendDTOImplToJson(
      this,
    );
  }
}

abstract class _RecommendDTO implements RecommendDTO {
  const factory _RecommendDTO(
      {final String? name,
      required final SkinConditionType basicSkinType,
      required final List<SkinType>? advancedSkinType,
      required final List<String> cosNames,
      required final List<String> cosPaths,
      required final List<String> nutrNames,
      required final List<String> nutrPaths}) = _$RecommendDTOImpl;

  factory _RecommendDTO.fromJson(Map<String, dynamic> json) =
      _$RecommendDTOImpl.fromJson;

  @override
  String? get name;
  @override
  SkinConditionType get basicSkinType;
  @override // Updated to use the new enum name
  List<SkinType>? get advancedSkinType;
  @override
  List<String> get cosNames;
  @override
  List<String> get cosPaths;
  @override
  List<String> get nutrNames;
  @override
  List<String> get nutrPaths;
  @override
  @JsonKey(ignore: true)
  _$$RecommendDTOImplCopyWith<_$RecommendDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
