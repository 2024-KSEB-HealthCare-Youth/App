// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_get_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentGetDTO _$CommentGetDTOFromJson(Map<String, dynamic> json) {
  return _CommentGetDTO.fromJson(json);
}

/// @nodoc
mixin _$CommentGetDTO {
  int get postId => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentGetDTOCopyWith<CommentGetDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentGetDTOCopyWith<$Res> {
  factory $CommentGetDTOCopyWith(
          CommentGetDTO value, $Res Function(CommentGetDTO) then) =
      _$CommentGetDTOCopyWithImpl<$Res, CommentGetDTO>;
  @useResult
  $Res call(
      {int postId,
      String nickName,
      String? profileImage,
      String content,
      DateTime createdAt});
}

/// @nodoc
class _$CommentGetDTOCopyWithImpl<$Res, $Val extends CommentGetDTO>
    implements $CommentGetDTOCopyWith<$Res> {
  _$CommentGetDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? nickName = null,
    Object? profileImage = freezed,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentGetDTOImplCopyWith<$Res>
    implements $CommentGetDTOCopyWith<$Res> {
  factory _$$CommentGetDTOImplCopyWith(
          _$CommentGetDTOImpl value, $Res Function(_$CommentGetDTOImpl) then) =
      __$$CommentGetDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int postId,
      String nickName,
      String? profileImage,
      String content,
      DateTime createdAt});
}

/// @nodoc
class __$$CommentGetDTOImplCopyWithImpl<$Res>
    extends _$CommentGetDTOCopyWithImpl<$Res, _$CommentGetDTOImpl>
    implements _$$CommentGetDTOImplCopyWith<$Res> {
  __$$CommentGetDTOImplCopyWithImpl(
      _$CommentGetDTOImpl _value, $Res Function(_$CommentGetDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? nickName = null,
    Object? profileImage = freezed,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(_$CommentGetDTOImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentGetDTOImpl implements _CommentGetDTO {
  const _$CommentGetDTOImpl(
      {required this.postId,
      required this.nickName,
      this.profileImage,
      required this.content,
      required this.createdAt});

  factory _$CommentGetDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentGetDTOImplFromJson(json);

  @override
  final int postId;
  @override
  final String nickName;
  @override
  final String? profileImage;
  @override
  final String content;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'CommentGetDTO(postId: $postId, nickName: $nickName, profileImage: $profileImage, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentGetDTOImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, postId, nickName, profileImage, content, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentGetDTOImplCopyWith<_$CommentGetDTOImpl> get copyWith =>
      __$$CommentGetDTOImplCopyWithImpl<_$CommentGetDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentGetDTOImplToJson(
      this,
    );
  }
}

abstract class _CommentGetDTO implements CommentGetDTO {
  const factory _CommentGetDTO(
      {required final int postId,
      required final String nickName,
      final String? profileImage,
      required final String content,
      required final DateTime createdAt}) = _$CommentGetDTOImpl;

  factory _CommentGetDTO.fromJson(Map<String, dynamic> json) =
      _$CommentGetDTOImpl.fromJson;

  @override
  int get postId;
  @override
  String get nickName;
  @override
  String? get profileImage;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$CommentGetDTOImplCopyWith<_$CommentGetDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
