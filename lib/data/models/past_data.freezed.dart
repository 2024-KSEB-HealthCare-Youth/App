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

PastData _$PastDataFromJson(Map<String, dynamic> json) {
  return _PastData.fromJson(json);
}

/// @nodoc
mixin _$PastData {
  List<int> get resultId => throw _privateConstructorUsedError;
  List<DateTime> get resultDate => throw _privateConstructorUsedError;

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
  $Res call({List<int> resultId, List<DateTime> resultDate});
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
    Object? resultId = null,
    Object? resultDate = null,
  }) {
    return _then(_value.copyWith(
      resultId: null == resultId
          ? _value.resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as List<int>,
      resultDate: null == resultDate
          ? _value.resultDate
          : resultDate // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
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
  $Res call({List<int> resultId, List<DateTime> resultDate});
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
    Object? resultId = null,
    Object? resultDate = null,
  }) {
    return _then(_$PastDataImpl(
      resultId: null == resultId
          ? _value._resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as List<int>,
      resultDate: null == resultDate
          ? _value._resultDate
          : resultDate // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PastDataImpl implements _PastData {
  const _$PastDataImpl(
      {required final List<int> resultId,
      required final List<DateTime> resultDate})
      : _resultId = resultId,
        _resultDate = resultDate;

  factory _$PastDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PastDataImplFromJson(json);

  final List<int> _resultId;
  @override
  List<int> get resultId {
    if (_resultId is EqualUnmodifiableListView) return _resultId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resultId);
  }

  final List<DateTime> _resultDate;
  @override
  List<DateTime> get resultDate {
    if (_resultDate is EqualUnmodifiableListView) return _resultDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resultDate);
  }

  @override
  String toString() {
    return 'PastData(resultId: $resultId, resultDate: $resultDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PastDataImpl &&
            const DeepCollectionEquality().equals(other._resultId, _resultId) &&
            const DeepCollectionEquality()
                .equals(other._resultDate, _resultDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_resultId),
      const DeepCollectionEquality().hash(_resultDate));

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
  const factory _PastData(
      {required final List<int> resultId,
      required final List<DateTime> resultDate}) = _$PastDataImpl;

  factory _PastData.fromJson(Map<String, dynamic> json) =
      _$PastDataImpl.fromJson;

  @override
  List<int> get resultId;
  @override
  List<DateTime> get resultDate;
  @override
  @JsonKey(ignore: true)
  _$$PastDataImplCopyWith<_$PastDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
