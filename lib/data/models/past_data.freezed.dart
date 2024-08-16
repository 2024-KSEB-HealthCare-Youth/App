// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'past_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResultItem _$ResultItemFromJson(Map<String, dynamic> json) {
  return _ResultItem.fromJson(json);
}

/// @nodoc
mixin _$ResultItem {
  int get resultId => throw _privateConstructorUsedError;
  DateTime get resultDate => throw _privateConstructorUsedError;
  List<Expert>? get advancedSkinTypeList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultItemCopyWith<ResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultItemCopyWith<$Res> {
  factory $ResultItemCopyWith(
          ResultItem value, $Res Function(ResultItem) then) =
      _$ResultItemCopyWithImpl<$Res, ResultItem>;
  @useResult
  $Res call(
      {int resultId, DateTime resultDate, List<Expert>? advancedSkinTypeList});
}

/// @nodoc
class _$ResultItemCopyWithImpl<$Res, $Val extends ResultItem>
    implements $ResultItemCopyWith<$Res> {
  _$ResultItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultId = null,
    Object? resultDate = null,
    Object? advancedSkinTypeList = freezed,
  }) {
    return _then(_value.copyWith(
      resultId: null == resultId
          ? _value.resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as int,
      resultDate: null == resultDate
          ? _value.resultDate
          : resultDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      advancedSkinTypeList: freezed == advancedSkinTypeList
          ? _value.advancedSkinTypeList
          : advancedSkinTypeList // ignore: cast_nullable_to_non_nullable
              as List<Expert>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultItemImplCopyWith<$Res>
    implements $ResultItemCopyWith<$Res> {
  factory _$$ResultItemImplCopyWith(
          _$ResultItemImpl value, $Res Function(_$ResultItemImpl) then) =
      __$$ResultItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int resultId, DateTime resultDate, List<Expert>? advancedSkinTypeList});
}

/// @nodoc
class __$$ResultItemImplCopyWithImpl<$Res>
    extends _$ResultItemCopyWithImpl<$Res, _$ResultItemImpl>
    implements _$$ResultItemImplCopyWith<$Res> {
  __$$ResultItemImplCopyWithImpl(
      _$ResultItemImpl _value, $Res Function(_$ResultItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultId = null,
    Object? resultDate = null,
    Object? advancedSkinTypeList = freezed,
  }) {
    return _then(_$ResultItemImpl(
      resultId: null == resultId
          ? _value.resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as int,
      resultDate: null == resultDate
          ? _value.resultDate
          : resultDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      advancedSkinTypeList: freezed == advancedSkinTypeList
          ? _value._advancedSkinTypeList
          : advancedSkinTypeList // ignore: cast_nullable_to_non_nullable
              as List<Expert>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultItemImpl implements _ResultItem {
  const _$ResultItemImpl(
      {required this.resultId,
      required this.resultDate,
      required final List<Expert>? advancedSkinTypeList})
      : _advancedSkinTypeList = advancedSkinTypeList;

  factory _$ResultItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultItemImplFromJson(json);

  @override
  final int resultId;
  @override
  final DateTime resultDate;
  final List<Expert>? _advancedSkinTypeList;
  @override
  List<Expert>? get advancedSkinTypeList {
    final value = _advancedSkinTypeList;
    if (value == null) return null;
    if (_advancedSkinTypeList is EqualUnmodifiableListView)
      return _advancedSkinTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResultItem(resultId: $resultId, resultDate: $resultDate, advancedSkinTypeList: $advancedSkinTypeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultItemImpl &&
            (identical(other.resultId, resultId) ||
                other.resultId == resultId) &&
            (identical(other.resultDate, resultDate) ||
                other.resultDate == resultDate) &&
            const DeepCollectionEquality()
                .equals(other._advancedSkinTypeList, _advancedSkinTypeList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resultId, resultDate,
      const DeepCollectionEquality().hash(_advancedSkinTypeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultItemImplCopyWith<_$ResultItemImpl> get copyWith =>
      __$$ResultItemImplCopyWithImpl<_$ResultItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultItemImplToJson(
      this,
    );
  }
}

abstract class _ResultItem implements ResultItem {
  const factory _ResultItem(
      {required final int resultId,
      required final DateTime resultDate,
      required final List<Expert>? advancedSkinTypeList}) = _$ResultItemImpl;

  factory _ResultItem.fromJson(Map<String, dynamic> json) =
      _$ResultItemImpl.fromJson;

  @override
  int get resultId;
  @override
  DateTime get resultDate;
  @override
  List<Expert>? get advancedSkinTypeList;
  @override
  @JsonKey(ignore: true)
  _$$ResultItemImplCopyWith<_$ResultItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PastData _$PastDataFromJson(Map<String, dynamic> json) {
  return _PastData.fromJson(json);
}

/// @nodoc
mixin _$PastData {
  List<ResultItem> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PastDataCopyWith<PastData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PastDataCopyWith<$Res> {
  factory $PastDataCopyWith(PastData value, $Res Function(PastData) then) =
      _$PastDataCopyWithImpl<$Res, PastData>;
  @useResult
  $Res call({List<ResultItem> results});
}

/// @nodoc
class _$PastDataCopyWithImpl<$Res, $Val extends PastData>
    implements $PastDataCopyWith<$Res> {
  _$PastDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PastDataImplCopyWith<$Res>
    implements $PastDataCopyWith<$Res> {
  factory _$$PastDataImplCopyWith(
          _$PastDataImpl value, $Res Function(_$PastDataImpl) then) =
      __$$PastDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ResultItem> results});
}

/// @nodoc
class __$$PastDataImplCopyWithImpl<$Res>
    extends _$PastDataCopyWithImpl<$Res, _$PastDataImpl>
    implements _$$PastDataImplCopyWith<$Res> {
  __$$PastDataImplCopyWithImpl(
      _$PastDataImpl _value, $Res Function(_$PastDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$PastDataImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PastDataImpl implements _PastData {
  const _$PastDataImpl({required final List<ResultItem> results})
      : _results = results;

  factory _$PastDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PastDataImplFromJson(json);

  final List<ResultItem> _results;
  @override
  List<ResultItem> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PastData(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PastDataImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PastDataImplCopyWith<_$PastDataImpl> get copyWith =>
      __$$PastDataImplCopyWithImpl<_$PastDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PastDataImplToJson(
      this,
    );
  }
}

abstract class _PastData implements PastData {
  const factory _PastData({required final List<ResultItem> results}) =
      _$PastDataImpl;

  factory _PastData.fromJson(Map<String, dynamic> json) =
      _$PastDataImpl.fromJson;

  @override
  List<ResultItem> get results;
  @override
  @JsonKey(ignore: true)
  _$$PastDataImplCopyWith<_$PastDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
