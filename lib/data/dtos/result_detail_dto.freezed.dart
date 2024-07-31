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
  String get resultDetails => throw _privateConstructorUsedError;
  String get resultImage => throw _privateConstructorUsedError;
  String get faceImage => throw _privateConstructorUsedError;

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
  $Res call({String resultDetails, String resultImage, String faceImage});
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
    Object? resultDetails = null,
    Object? resultImage = null,
    Object? faceImage = null,
  }) {
    return _then(_value.copyWith(
      resultDetails: null == resultDetails
          ? _value.resultDetails
          : resultDetails // ignore: cast_nullable_to_non_nullable
              as String,
      resultImage: null == resultImage
          ? _value.resultImage
          : resultImage // ignore: cast_nullable_to_non_nullable
              as String,
      faceImage: null == faceImage
          ? _value.faceImage
          : faceImage // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String resultDetails, String resultImage, String faceImage});
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
    Object? resultDetails = null,
    Object? resultImage = null,
    Object? faceImage = null,
  }) {
    return _then(_$ResultDetailDTOImpl(
      resultDetails: null == resultDetails
          ? _value.resultDetails
          : resultDetails // ignore: cast_nullable_to_non_nullable
              as String,
      resultImage: null == resultImage
          ? _value.resultImage
          : resultImage // ignore: cast_nullable_to_non_nullable
              as String,
      faceImage: null == faceImage
          ? _value.faceImage
          : faceImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDetailDTOImpl implements _ResultDetailDTO {
  const _$ResultDetailDTOImpl(
      {required this.resultDetails,
      required this.resultImage,
      required this.faceImage});

  factory _$ResultDetailDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDetailDTOImplFromJson(json);

  @override
  final String resultDetails;
  @override
  final String resultImage;
  @override
  final String faceImage;

  @override
  String toString() {
    return 'ResultDetailDTO(resultDetails: $resultDetails, resultImage: $resultImage, faceImage: $faceImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDetailDTOImpl &&
            (identical(other.resultDetails, resultDetails) ||
                other.resultDetails == resultDetails) &&
            (identical(other.resultImage, resultImage) ||
                other.resultImage == resultImage) &&
            (identical(other.faceImage, faceImage) ||
                other.faceImage == faceImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, resultDetails, resultImage, faceImage);

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
      {required final String resultDetails,
      required final String resultImage,
      required final String faceImage}) = _$ResultDetailDTOImpl;

  factory _ResultDetailDTO.fromJson(Map<String, dynamic> json) =
      _$ResultDetailDTOImpl.fromJson;

  @override
  String get resultDetails;
  @override
  String get resultImage;
  @override
  String get faceImage;
  @override
  @JsonKey(ignore: true)
  _$$ResultDetailDTOImplCopyWith<_$ResultDetailDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
