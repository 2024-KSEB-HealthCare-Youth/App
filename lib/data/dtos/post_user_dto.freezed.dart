// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostUserDTO _$PostUserDTOFromJson(Map<String, dynamic> json) {
  return _PostUserDTO.fromJson(json);
}

/// @nodoc
mixin _$PostUserDTO {
  String? get profileImage => throw _privateConstructorUsedError;
  String? get nickName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostUserDTOCopyWith<PostUserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostUserDTOCopyWith<$Res> {
  factory $PostUserDTOCopyWith(
          PostUserDTO value, $Res Function(PostUserDTO) then) =
      _$PostUserDTOCopyWithImpl<$Res, PostUserDTO>;
  @useResult
  $Res call({String? profileImage, String? nickName});
}

/// @nodoc
class _$PostUserDTOCopyWithImpl<$Res, $Val extends PostUserDTO>
    implements $PostUserDTOCopyWith<$Res> {
  _$PostUserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileImage = freezed,
    Object? nickName = freezed,
  }) {
    return _then(_value.copyWith(
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostUserDTOImplCopyWith<$Res>
    implements $PostUserDTOCopyWith<$Res> {
  factory _$$PostUserDTOImplCopyWith(
          _$PostUserDTOImpl value, $Res Function(_$PostUserDTOImpl) then) =
      __$$PostUserDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? profileImage, String? nickName});
}

/// @nodoc
class __$$PostUserDTOImplCopyWithImpl<$Res>
    extends _$PostUserDTOCopyWithImpl<$Res, _$PostUserDTOImpl>
    implements _$$PostUserDTOImplCopyWith<$Res> {
  __$$PostUserDTOImplCopyWithImpl(
      _$PostUserDTOImpl _value, $Res Function(_$PostUserDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileImage = freezed,
    Object? nickName = freezed,
  }) {
    return _then(_$PostUserDTOImpl(
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostUserDTOImpl implements _PostUserDTO {
  _$PostUserDTOImpl({this.profileImage, this.nickName});

  factory _$PostUserDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostUserDTOImplFromJson(json);

  @override
  final String? profileImage;
  @override
  final String? nickName;

  @override
  String toString() {
    return 'PostUserDTO(profileImage: $profileImage, nickName: $nickName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostUserDTOImpl &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, profileImage, nickName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostUserDTOImplCopyWith<_$PostUserDTOImpl> get copyWith =>
      __$$PostUserDTOImplCopyWithImpl<_$PostUserDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostUserDTOImplToJson(
      this,
    );
  }
}

abstract class _PostUserDTO implements PostUserDTO {
  factory _PostUserDTO({final String? profileImage, final String? nickName}) =
      _$PostUserDTOImpl;

  factory _PostUserDTO.fromJson(Map<String, dynamic> json) =
      _$PostUserDTOImpl.fromJson;

  @override
  String? get profileImage;
  @override
  String? get nickName;
  @override
  @JsonKey(ignore: true)
  _$$PostUserDTOImplCopyWith<_$PostUserDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
