// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditUserDTO _$EditUserDTOFromJson(Map<String, dynamic> json) {
  return _EditUserDTO.fromJson(json);
}

/// @nodoc
mixin _$EditUserDTO {
  String? get name => throw _privateConstructorUsedError;
  String? get nickName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditUserDTOCopyWith<EditUserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditUserDTOCopyWith<$Res> {
  factory $EditUserDTOCopyWith(
          EditUserDTO value, $Res Function(EditUserDTO) then) =
      _$EditUserDTOCopyWithImpl<$Res, EditUserDTO>;
  @useResult
  $Res call(
      {String? name,
      String? nickName,
      String? email,
      String? phoneNumber,
      String? profileImage});
}

/// @nodoc
class _$EditUserDTOCopyWithImpl<$Res, $Val extends EditUserDTO>
    implements $EditUserDTOCopyWith<$Res> {
  _$EditUserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? nickName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditUserDTOImplCopyWith<$Res>
    implements $EditUserDTOCopyWith<$Res> {
  factory _$$EditUserDTOImplCopyWith(
          _$EditUserDTOImpl value, $Res Function(_$EditUserDTOImpl) then) =
      __$$EditUserDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? nickName,
      String? email,
      String? phoneNumber,
      String? profileImage});
}

/// @nodoc
class __$$EditUserDTOImplCopyWithImpl<$Res>
    extends _$EditUserDTOCopyWithImpl<$Res, _$EditUserDTOImpl>
    implements _$$EditUserDTOImplCopyWith<$Res> {
  __$$EditUserDTOImplCopyWithImpl(
      _$EditUserDTOImpl _value, $Res Function(_$EditUserDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? nickName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_$EditUserDTOImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditUserDTOImpl implements _EditUserDTO {
  _$EditUserDTOImpl(
      {this.name,
      this.nickName,
      this.email,
      this.phoneNumber,
      this.profileImage});

  factory _$EditUserDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditUserDTOImplFromJson(json);

  @override
  final String? name;
  @override
  final String? nickName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? profileImage;

  @override
  String toString() {
    return 'EditUserDTO(name: $name, nickName: $nickName, email: $email, phoneNumber: $phoneNumber, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditUserDTOImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, nickName, email, phoneNumber, profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditUserDTOImplCopyWith<_$EditUserDTOImpl> get copyWith =>
      __$$EditUserDTOImplCopyWithImpl<_$EditUserDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditUserDTOImplToJson(
      this,
    );
  }
}

abstract class _EditUserDTO implements EditUserDTO {
  factory _EditUserDTO(
      {final String? name,
      final String? nickName,
      final String? email,
      final String? phoneNumber,
      final String? profileImage}) = _$EditUserDTOImpl;

  factory _EditUserDTO.fromJson(Map<String, dynamic> json) =
      _$EditUserDTOImpl.fromJson;

  @override
  String? get name;
  @override
  String? get nickName;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String? get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$EditUserDTOImplCopyWith<_$EditUserDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
