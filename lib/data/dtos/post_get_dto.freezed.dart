// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_get_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostGetDTO _$PostGetDTOFromJson(Map<String, dynamic> json) {
  return _PostGetDTO.fromJson(json);
}

/// @nodoc
mixin _$PostGetDTO {
  int get postId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int? get likeCount =>
      throw _privateConstructorUsedError; // likeCount can be null
  Category get category => throw _privateConstructorUsedError;
  String get profileImage => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostGetDTOCopyWith<PostGetDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostGetDTOCopyWith<$Res> {
  factory $PostGetDTOCopyWith(
          PostGetDTO value, $Res Function(PostGetDTO) then) =
      _$PostGetDTOCopyWithImpl<$Res, PostGetDTO>;
  @useResult
  $Res call(
      {int postId,
      String title,
      int? likeCount,
      Category category,
      String profileImage,
      String nickName,
      DateTime createdAt});
}

/// @nodoc
class _$PostGetDTOCopyWithImpl<$Res, $Val extends PostGetDTO>
    implements $PostGetDTOCopyWith<$Res> {
  _$PostGetDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? title = null,
    Object? likeCount = freezed,
    Object? category = null,
    Object? profileImage = null,
    Object? nickName = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostGetDTOImplCopyWith<$Res>
    implements $PostGetDTOCopyWith<$Res> {
  factory _$$PostGetDTOImplCopyWith(
          _$PostGetDTOImpl value, $Res Function(_$PostGetDTOImpl) then) =
      __$$PostGetDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int postId,
      String title,
      int? likeCount,
      Category category,
      String profileImage,
      String nickName,
      DateTime createdAt});
}

/// @nodoc
class __$$PostGetDTOImplCopyWithImpl<$Res>
    extends _$PostGetDTOCopyWithImpl<$Res, _$PostGetDTOImpl>
    implements _$$PostGetDTOImplCopyWith<$Res> {
  __$$PostGetDTOImplCopyWithImpl(
      _$PostGetDTOImpl _value, $Res Function(_$PostGetDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? title = null,
    Object? likeCount = freezed,
    Object? category = null,
    Object? profileImage = null,
    Object? nickName = null,
    Object? createdAt = null,
  }) {
    return _then(_$PostGetDTOImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
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
class _$PostGetDTOImpl implements _PostGetDTO {
  _$PostGetDTOImpl(
      {required this.postId,
      required this.title,
      required this.likeCount,
      required this.category,
      required this.profileImage,
      required this.nickName,
      required this.createdAt});

  factory _$PostGetDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostGetDTOImplFromJson(json);

  @override
  final int postId;
  @override
  final String title;
  @override
  final int? likeCount;
// likeCount can be null
  @override
  final Category category;
  @override
  final String profileImage;
  @override
  final String nickName;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'PostGetDTO(postId: $postId, title: $title, likeCount: $likeCount, category: $category, profileImage: $profileImage, nickName: $nickName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostGetDTOImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, postId, title, likeCount,
      category, profileImage, nickName, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostGetDTOImplCopyWith<_$PostGetDTOImpl> get copyWith =>
      __$$PostGetDTOImplCopyWithImpl<_$PostGetDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostGetDTOImplToJson(
      this,
    );
  }
}

abstract class _PostGetDTO implements PostGetDTO {
  factory _PostGetDTO(
      {required final int postId,
      required final String title,
      required final int? likeCount,
      required final Category category,
      required final String profileImage,
      required final String nickName,
      required final DateTime createdAt}) = _$PostGetDTOImpl;

  factory _PostGetDTO.fromJson(Map<String, dynamic> json) =
      _$PostGetDTOImpl.fromJson;

  @override
  int get postId;
  @override
  String get title;
  @override
  int? get likeCount;
  @override // likeCount can be null
  Category get category;
  @override
  String get profileImage;
  @override
  String get nickName;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PostGetDTOImplCopyWith<_$PostGetDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
