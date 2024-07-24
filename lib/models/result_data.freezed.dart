// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResultData _$ResultDataFromJson(Map<String, dynamic> json) {
  return _ResultData.fromJson(json);
}

/// @nodoc
mixin _$ResultData {
  String? get skintype => throw _privateConstructorUsedError;
  int get resultId => throw _privateConstructorUsedError;
  int get memberId => throw _privateConstructorUsedError;
  String get resultImage => throw _privateConstructorUsedError;
  String get faceImage => throw _privateConstructorUsedError;
  String get resultDetails => throw _privateConstructorUsedError;
  DateTime get resultDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultDataCopyWith<ResultData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDataCopyWith<$Res> {
  factory $ResultDataCopyWith(
          ResultData value, $Res Function(ResultData) then) =
      _$ResultDataCopyWithImpl<$Res, ResultData>;
  @useResult
  $Res call(
      {String? skintype,
      int resultId,
      int memberId,
      String resultImage,
      String faceImage,
      String resultDetails,
      DateTime resultDate});
}

/// @nodoc
class _$ResultDataCopyWithImpl<$Res, $Val extends ResultData>
    implements $ResultDataCopyWith<$Res> {
  _$ResultDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skintype = freezed,
    Object? resultId = null,
    Object? memberId = null,
    Object? resultImage = null,
    Object? faceImage = null,
    Object? resultDetails = null,
    Object? resultDate = null,
  }) {
    return _then(_value.copyWith(
      skintype: freezed == skintype
          ? _value.skintype
          : skintype // ignore: cast_nullable_to_non_nullable
              as String?,
      resultId: null == resultId
          ? _value.resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as int,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      resultImage: null == resultImage
          ? _value.resultImage
          : resultImage // ignore: cast_nullable_to_non_nullable
              as String,
      faceImage: null == faceImage
          ? _value.faceImage
          : faceImage // ignore: cast_nullable_to_non_nullable
              as String,
      resultDetails: null == resultDetails
          ? _value.resultDetails
          : resultDetails // ignore: cast_nullable_to_non_nullable
              as String,
      resultDate: null == resultDate
          ? _value.resultDate
          : resultDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultDataImplCopyWith<$Res>
    implements $ResultDataCopyWith<$Res> {
  factory _$$ResultDataImplCopyWith(
          _$ResultDataImpl value, $Res Function(_$ResultDataImpl) then) =
      __$$ResultDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? skintype,
      int resultId,
      int memberId,
      String resultImage,
      String faceImage,
      String resultDetails,
      DateTime resultDate});
}

/// @nodoc
class __$$ResultDataImplCopyWithImpl<$Res>
    extends _$ResultDataCopyWithImpl<$Res, _$ResultDataImpl>
    implements _$$ResultDataImplCopyWith<$Res> {
  __$$ResultDataImplCopyWithImpl(
      _$ResultDataImpl _value, $Res Function(_$ResultDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skintype = freezed,
    Object? resultId = null,
    Object? memberId = null,
    Object? resultImage = null,
    Object? faceImage = null,
    Object? resultDetails = null,
    Object? resultDate = null,
  }) {
    return _then(_$ResultDataImpl(
      skintype: freezed == skintype
          ? _value.skintype
          : skintype // ignore: cast_nullable_to_non_nullable
              as String?,
      resultId: null == resultId
          ? _value.resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as int,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      resultImage: null == resultImage
          ? _value.resultImage
          : resultImage // ignore: cast_nullable_to_non_nullable
              as String,
      faceImage: null == faceImage
          ? _value.faceImage
          : faceImage // ignore: cast_nullable_to_non_nullable
              as String,
      resultDetails: null == resultDetails
          ? _value.resultDetails
          : resultDetails // ignore: cast_nullable_to_non_nullable
              as String,
      resultDate: null == resultDate
          ? _value.resultDate
          : resultDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDataImpl implements _ResultData {
  const _$ResultDataImpl(
      {this.skintype,
      required this.resultId,
      required this.memberId,
      required this.resultImage,
      required this.faceImage,
      required this.resultDetails,
      required this.resultDate});

  factory _$ResultDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDataImplFromJson(json);

  @override
  final String? skintype;
  @override
  final int resultId;
  @override
  final int memberId;
  @override
  final String resultImage;
  @override
  final String faceImage;
  @override
  final String resultDetails;
  @override
  final DateTime resultDate;

  @override
  String toString() {
    return 'ResultData(skintype: $skintype, resultId: $resultId, memberId: $memberId, resultImage: $resultImage, faceImage: $faceImage, resultDetails: $resultDetails, resultDate: $resultDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDataImpl &&
            (identical(other.skintype, skintype) ||
                other.skintype == skintype) &&
            (identical(other.resultId, resultId) ||
                other.resultId == resultId) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.resultImage, resultImage) ||
                other.resultImage == resultImage) &&
            (identical(other.faceImage, faceImage) ||
                other.faceImage == faceImage) &&
            (identical(other.resultDetails, resultDetails) ||
                other.resultDetails == resultDetails) &&
            (identical(other.resultDate, resultDate) ||
                other.resultDate == resultDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, skintype, resultId, memberId,
      resultImage, faceImage, resultDetails, resultDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDataImplCopyWith<_$ResultDataImpl> get copyWith =>
      __$$ResultDataImplCopyWithImpl<_$ResultDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDataImplToJson(
      this,
    );
  }
}

abstract class _ResultData implements ResultData {
  const factory _ResultData(
      {final String? skintype,
      required final int resultId,
      required final int memberId,
      required final String resultImage,
      required final String faceImage,
      required final String resultDetails,
      required final DateTime resultDate}) = _$ResultDataImpl;

  factory _ResultData.fromJson(Map<String, dynamic> json) =
      _$ResultDataImpl.fromJson;

  @override
  String? get skintype;
  @override
  int get resultId;
  @override
  int get memberId;
  @override
  String get resultImage;
  @override
  String get faceImage;
  @override
  String get resultDetails;
  @override
  DateTime get resultDate;
  @override
  @JsonKey(ignore: true)
  _$$ResultDataImplCopyWith<_$ResultDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
