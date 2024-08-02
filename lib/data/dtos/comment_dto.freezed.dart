// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentDTO _$CommentDTOFromJson(Map<String, dynamic> json) {
  return _CommentDTO.fromJson(json);
}

/// @nodoc
mixin _$CommentDTO {
  String get nickName => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentDTOCopyWith<CommentDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentDTOCopyWith<$Res> {
  factory $CommentDTOCopyWith(
          CommentDTO value, $Res Function(CommentDTO) then) =
      _$CommentDTOCopyWithImpl<$Res, CommentDTO>;
  @useResult
  $Res call({String nickName, String content, String profileImage});
}

/// @nodoc
class _$CommentDTOCopyWithImpl<$Res, $Val extends CommentDTO>
    implements $CommentDTOCopyWith<$Res> {
  _$CommentDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickName = null,
    Object? content = null,
    Object? profileImage = null,
  }) {
    return _then(_value.copyWith(
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentDTOImplCopyWith<$Res>
    implements $CommentDTOCopyWith<$Res> {
  factory _$$CommentDTOImplCopyWith(
          _$CommentDTOImpl value, $Res Function(_$CommentDTOImpl) then) =
      __$$CommentDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickName, String content, String profileImage});
}

/// @nodoc
class __$$CommentDTOImplCopyWithImpl<$Res>
    extends _$CommentDTOCopyWithImpl<$Res, _$CommentDTOImpl>
    implements _$$CommentDTOImplCopyWith<$Res> {
  __$$CommentDTOImplCopyWithImpl(
      _$CommentDTOImpl _value, $Res Function(_$CommentDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickName = null,
    Object? content = null,
    Object? profileImage = null,
  }) {
    return _then(_$CommentDTOImpl(
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentDTOImpl implements _CommentDTO {
  const _$CommentDTOImpl(
      {required this.nickName,
      required this.content,
      required this.profileImage});

  factory _$CommentDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentDTOImplFromJson(json);

  @override
  final String nickName;
  @override
  final String content;
  @override
  final String profileImage;

  @override
  String toString() {
    return 'CommentDTO(nickName: $nickName, content: $content, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentDTOImpl &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nickName, content, profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentDTOImplCopyWith<_$CommentDTOImpl> get copyWith =>
      __$$CommentDTOImplCopyWithImpl<_$CommentDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentDTOImplToJson(
      this,
    );
  }
}

abstract class _CommentDTO implements CommentDTO {
  const factory _CommentDTO(
      {required final String nickName,
      required final String content,
      required final String profileImage}) = _$CommentDTOImpl;

  factory _CommentDTO.fromJson(Map<String, dynamic> json) =
      _$CommentDTOImpl.fromJson;

  @override
  String get nickName;
  @override
  String get content;
  @override
  String get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$CommentDTOImplCopyWith<_$CommentDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
