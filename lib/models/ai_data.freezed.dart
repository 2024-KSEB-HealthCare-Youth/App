// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiData _$AiDataFromJson(Map<String, dynamic> json) {
  return _AiData.fromJson(json);
}

/// @nodoc
mixin _$AiData {
  List<String> get cosNames => throw _privateConstructorUsedError;
  List<String> get cosPaths => throw _privateConstructorUsedError;
  List<String> get nutrNames => throw _privateConstructorUsedError;
  List<String> get nutPaths => throw _privateConstructorUsedError;
  String get simpleSkin => throw _privateConstructorUsedError;
  List<SkinType> get expertSkin => throw _privateConstructorUsedError;
  String get resultPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiDataCopyWith<AiData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiDataCopyWith<$Res> {
  factory $AiDataCopyWith(AiData value, $Res Function(AiData) then) =
      _$AiDataCopyWithImpl<$Res, AiData>;
  @useResult
  $Res call(
      {List<String> cosNames,
      List<String> cosPaths,
      List<String> nutrNames,
      List<String> nutPaths,
      String simpleSkin,
      List<SkinType> expertSkin,
      String resultPath});
}

/// @nodoc
class _$AiDataCopyWithImpl<$Res, $Val extends AiData>
    implements $AiDataCopyWith<$Res> {
  _$AiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cosNames = null,
    Object? cosPaths = null,
    Object? nutrNames = null,
    Object? nutPaths = null,
    Object? simpleSkin = null,
    Object? expertSkin = null,
    Object? resultPath = null,
  }) {
    return _then(_value.copyWith(
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
      nutPaths: null == nutPaths
          ? _value.nutPaths
          : nutPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      simpleSkin: null == simpleSkin
          ? _value.simpleSkin
          : simpleSkin // ignore: cast_nullable_to_non_nullable
              as String,
      expertSkin: null == expertSkin
          ? _value.expertSkin
          : expertSkin // ignore: cast_nullable_to_non_nullable
              as List<SkinType>,
      resultPath: null == resultPath
          ? _value.resultPath
          : resultPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiDataImplCopyWith<$Res> implements $AiDataCopyWith<$Res> {
  factory _$$AiDataImplCopyWith(
          _$AiDataImpl value, $Res Function(_$AiDataImpl) then) =
      __$$AiDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> cosNames,
      List<String> cosPaths,
      List<String> nutrNames,
      List<String> nutPaths,
      String simpleSkin,
      List<SkinType> expertSkin,
      String resultPath});
}

/// @nodoc
class __$$AiDataImplCopyWithImpl<$Res>
    extends _$AiDataCopyWithImpl<$Res, _$AiDataImpl>
    implements _$$AiDataImplCopyWith<$Res> {
  __$$AiDataImplCopyWithImpl(
      _$AiDataImpl _value, $Res Function(_$AiDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cosNames = null,
    Object? cosPaths = null,
    Object? nutrNames = null,
    Object? nutPaths = null,
    Object? simpleSkin = null,
    Object? expertSkin = null,
    Object? resultPath = null,
  }) {
    return _then(_$AiDataImpl(
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
      nutPaths: null == nutPaths
          ? _value._nutPaths
          : nutPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      simpleSkin: null == simpleSkin
          ? _value.simpleSkin
          : simpleSkin // ignore: cast_nullable_to_non_nullable
              as String,
      expertSkin: null == expertSkin
          ? _value._expertSkin
          : expertSkin // ignore: cast_nullable_to_non_nullable
              as List<SkinType>,
      resultPath: null == resultPath
          ? _value.resultPath
          : resultPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiDataImpl implements _AiData {
  const _$AiDataImpl(
      {required final List<String> cosNames,
      required final List<String> cosPaths,
      required final List<String> nutrNames,
      required final List<String> nutPaths,
      required this.simpleSkin,
      required final List<SkinType> expertSkin,
      required this.resultPath})
      : _cosNames = cosNames,
        _cosPaths = cosPaths,
        _nutrNames = nutrNames,
        _nutPaths = nutPaths,
        _expertSkin = expertSkin;

  factory _$AiDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiDataImplFromJson(json);

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

  final List<String> _nutPaths;
  @override
  List<String> get nutPaths {
    if (_nutPaths is EqualUnmodifiableListView) return _nutPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutPaths);
  }

  @override
  final String simpleSkin;
  final List<SkinType> _expertSkin;
  @override
  List<SkinType> get expertSkin {
    if (_expertSkin is EqualUnmodifiableListView) return _expertSkin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expertSkin);
  }

  @override
  final String resultPath;

  @override
  String toString() {
    return 'AiData(cosNames: $cosNames, cosPaths: $cosPaths, nutrNames: $nutrNames, nutPaths: $nutPaths, simpleSkin: $simpleSkin, expertSkin: $expertSkin, resultPath: $resultPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiDataImpl &&
            const DeepCollectionEquality().equals(other._cosNames, _cosNames) &&
            const DeepCollectionEquality().equals(other._cosPaths, _cosPaths) &&
            const DeepCollectionEquality()
                .equals(other._nutrNames, _nutrNames) &&
            const DeepCollectionEquality().equals(other._nutPaths, _nutPaths) &&
            (identical(other.simpleSkin, simpleSkin) ||
                other.simpleSkin == simpleSkin) &&
            const DeepCollectionEquality()
                .equals(other._expertSkin, _expertSkin) &&
            (identical(other.resultPath, resultPath) ||
                other.resultPath == resultPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cosNames),
      const DeepCollectionEquality().hash(_cosPaths),
      const DeepCollectionEquality().hash(_nutrNames),
      const DeepCollectionEquality().hash(_nutPaths),
      simpleSkin,
      const DeepCollectionEquality().hash(_expertSkin),
      resultPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiDataImplCopyWith<_$AiDataImpl> get copyWith =>
      __$$AiDataImplCopyWithImpl<_$AiDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiDataImplToJson(
      this,
    );
  }
}

abstract class _AiData implements AiData {
  const factory _AiData(
      {required final List<String> cosNames,
      required final List<String> cosPaths,
      required final List<String> nutrNames,
      required final List<String> nutPaths,
      required final String simpleSkin,
      required final List<SkinType> expertSkin,
      required final String resultPath}) = _$AiDataImpl;

  factory _AiData.fromJson(Map<String, dynamic> json) = _$AiDataImpl.fromJson;

  @override
  List<String> get cosNames;
  @override
  List<String> get cosPaths;
  @override
  List<String> get nutrNames;
  @override
  List<String> get nutPaths;
  @override
  String get simpleSkin;
  @override
  List<SkinType> get expertSkin;
  @override
  String get resultPath;
  @override
  @JsonKey(ignore: true)
  _$$AiDataImplCopyWith<_$AiDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
