// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResultDetailDTO _$ResultDetailDTOFromJson(Map<String, dynamic> json) {
  return _ResultDetailDTO.fromJson(json);
}

/// @nodoc
mixin _$ResultDetailDTO {
  int get memberId => throw _privateConstructorUsedError;
  String get faceImage => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  DateTime get resultDate => throw _privateConstructorUsedError;
  Map<String, double> get probabilities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultDetailDTOCopyWith<ResultDetailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDetailDTOCopyWith<$Res> {
  factory $ResultDetailDTOCopyWith(
          ResultDetailDTO value, $Res Function(ResultDetailDTO) then) =
      _$ResultDetailDTOCopyWithImpl<$Res, ResultDetailDTO>;
  @useResult
  $Res call(
      {int memberId,
      String faceImage,
      String? details,
      DateTime resultDate,
      Map<String, double> probabilities});
}

/// @nodoc
class _$ResultDetailDTOCopyWithImpl<$Res, $Val extends ResultDetailDTO>
    implements $ResultDetailDTOCopyWith<$Res> {
  _$ResultDetailDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? faceImage = null,
    Object? details = freezed,
    Object? resultDate = null,
    Object? probabilities = null,
  }) {
    return _then(_value.copyWith(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      faceImage: null == faceImage
          ? _value.faceImage
          : faceImage // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      resultDate: null == resultDate
          ? _value.resultDate
          : resultDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      probabilities: null == probabilities
          ? _value.probabilities
          : probabilities // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultDetailDTOImplCopyWith<$Res>
    implements $ResultDetailDTOCopyWith<$Res> {
  factory _$$ResultDetailDTOImplCopyWith(_$ResultDetailDTOImpl value,
          $Res Function(_$ResultDetailDTOImpl) then) =
      __$$ResultDetailDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int memberId,
      String faceImage,
      String? details,
      DateTime resultDate,
      Map<String, double> probabilities});
}

/// @nodoc
class __$$ResultDetailDTOImplCopyWithImpl<$Res>
    extends _$ResultDetailDTOCopyWithImpl<$Res, _$ResultDetailDTOImpl>
    implements _$$ResultDetailDTOImplCopyWith<$Res> {
  __$$ResultDetailDTOImplCopyWithImpl(
      _$ResultDetailDTOImpl _value, $Res Function(_$ResultDetailDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? faceImage = null,
    Object? details = freezed,
    Object? resultDate = null,
    Object? probabilities = null,
  }) {
    return _then(_$ResultDetailDTOImpl(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      faceImage: null == faceImage
          ? _value.faceImage
          : faceImage // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      resultDate: null == resultDate
          ? _value.resultDate
          : resultDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      probabilities: null == probabilities
          ? _value._probabilities
          : probabilities // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDetailDTOImpl implements _ResultDetailDTO {
  const _$ResultDetailDTOImpl(
      {required this.memberId,
      required this.faceImage,
      this.details,
      required this.resultDate,
      required final Map<String, double> probabilities})
      : _probabilities = probabilities;

  factory _$ResultDetailDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDetailDTOImplFromJson(json);

  @override
  final int memberId;
  @override
  final String faceImage;
  @override
  final String? details;
  @override
  final DateTime resultDate;
  final Map<String, double> _probabilities;
  @override
  Map<String, double> get probabilities {
    if (_probabilities is EqualUnmodifiableMapView) return _probabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_probabilities);
  }

  @override
  String toString() {
    return 'ResultDetailDTO(memberId: $memberId, faceImage: $faceImage, details: $details, resultDate: $resultDate, probabilities: $probabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDetailDTOImpl &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.faceImage, faceImage) ||
                other.faceImage == faceImage) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.resultDate, resultDate) ||
                other.resultDate == resultDate) &&
            const DeepCollectionEquality()
                .equals(other._probabilities, _probabilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, memberId, faceImage, details,
      resultDate, const DeepCollectionEquality().hash(_probabilities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDetailDTOImplCopyWith<_$ResultDetailDTOImpl> get copyWith =>
      __$$ResultDetailDTOImplCopyWithImpl<_$ResultDetailDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDetailDTOImplToJson(
      this,
    );
  }
}

abstract class _ResultDetailDTO implements ResultDetailDTO {
  const factory _ResultDetailDTO(
          {required final int memberId,
          required final String faceImage,
          final String? details,
          required final DateTime resultDate,
          required final Map<String, double> probabilities}) =
      _$ResultDetailDTOImpl;

  factory _ResultDetailDTO.fromJson(Map<String, dynamic> json) =
      _$ResultDetailDTOImpl.fromJson;

  @override
  int get memberId;
  @override
  String get faceImage;
  @override
  String? get details;
  @override
  DateTime get resultDate;
  @override
  Map<String, double> get probabilities;
  @override
  @JsonKey(ignore: true)
  _$$ResultDetailDTOImplCopyWith<_$ResultDetailDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
