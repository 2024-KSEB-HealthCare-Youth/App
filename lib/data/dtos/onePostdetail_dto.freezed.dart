// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onePostdetail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OnepostdetailDTO _$OnepostdetailDTOFromJson(Map<String, dynamic> json) {
  return _OnepostdetailDTO.fromJson(json);
}

/// @nodoc
mixin _$OnepostdetailDTO {
  int get postId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<CommentGetDTO> get comments => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnepostdetailDTOCopyWith<OnepostdetailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnepostdetailDTOCopyWith<$Res> {
  factory $OnepostdetailDTOCopyWith(
          OnepostdetailDTO value, $Res Function(OnepostdetailDTO) then) =
      _$OnepostdetailDTOCopyWithImpl<$Res, OnepostdetailDTO>;
  @useResult
  $Res call(
      {int postId,
      String title,
      int likeCount,
      Category category,
      String? profileImage,
      String nickName,
      String content,
      List<CommentGetDTO> comments,
      DateTime createdAt});
}

/// @nodoc
class _$OnepostdetailDTOCopyWithImpl<$Res, $Val extends OnepostdetailDTO>
    implements $OnepostdetailDTOCopyWith<$Res> {
  _$OnepostdetailDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? title = null,
    Object? likeCount = null,
    Object? category = null,
    Object? profileImage = freezed,
    Object? nickName = null,
    Object? content = null,
    Object? comments = null,
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
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentGetDTO>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnepostdetailDTOImplCopyWith<$Res>
    implements $OnepostdetailDTOCopyWith<$Res> {
  factory _$$OnepostdetailDTOImplCopyWith(_$OnepostdetailDTOImpl value,
          $Res Function(_$OnepostdetailDTOImpl) then) =
      __$$OnepostdetailDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int postId,
      String title,
      int likeCount,
      Category category,
      String? profileImage,
      String nickName,
      String content,
      List<CommentGetDTO> comments,
      DateTime createdAt});
}

/// @nodoc
class __$$OnepostdetailDTOImplCopyWithImpl<$Res>
    extends _$OnepostdetailDTOCopyWithImpl<$Res, _$OnepostdetailDTOImpl>
    implements _$$OnepostdetailDTOImplCopyWith<$Res> {
  __$$OnepostdetailDTOImplCopyWithImpl(_$OnepostdetailDTOImpl _value,
      $Res Function(_$OnepostdetailDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? title = null,
    Object? likeCount = null,
    Object? category = null,
    Object? profileImage = freezed,
    Object? nickName = null,
    Object? content = null,
    Object? comments = null,
    Object? createdAt = null,
  }) {
    return _then(_$OnepostdetailDTOImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentGetDTO>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnepostdetailDTOImpl implements _OnepostdetailDTO {
  const _$OnepostdetailDTOImpl(
      {required this.postId,
      required this.title,
      required this.likeCount,
      required this.category,
      this.profileImage,
      required this.nickName,
      required this.content,
      required final List<CommentGetDTO> comments,
      required this.createdAt})
      : _comments = comments;

  factory _$OnepostdetailDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnepostdetailDTOImplFromJson(json);

  @override
  final int postId;
  @override
  final String title;
  @override
  final int likeCount;
  @override
  final Category category;
  @override
  final String? profileImage;
  @override
  final String nickName;
  @override
  final String content;
  final List<CommentGetDTO> _comments;
  @override
  List<CommentGetDTO> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'OnepostdetailDTO(postId: $postId, title: $title, likeCount: $likeCount, category: $category, profileImage: $profileImage, nickName: $nickName, content: $content, comments: $comments, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnepostdetailDTOImpl &&
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
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      postId,
      title,
      likeCount,
      category,
      profileImage,
      nickName,
      content,
      const DeepCollectionEquality().hash(_comments),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnepostdetailDTOImplCopyWith<_$OnepostdetailDTOImpl> get copyWith =>
      __$$OnepostdetailDTOImplCopyWithImpl<_$OnepostdetailDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnepostdetailDTOImplToJson(
      this,
    );
  }
}

abstract class _OnepostdetailDTO implements OnepostdetailDTO {
  const factory _OnepostdetailDTO(
      {required final int postId,
      required final String title,
      required final int likeCount,
      required final Category category,
      final String? profileImage,
      required final String nickName,
      required final String content,
      required final List<CommentGetDTO> comments,
      required final DateTime createdAt}) = _$OnepostdetailDTOImpl;

  factory _OnepostdetailDTO.fromJson(Map<String, dynamic> json) =
      _$OnepostdetailDTOImpl.fromJson;

  @override
  int get postId;
  @override
  String get title;
  @override
  int get likeCount;
  @override
  Category get category;
  @override
  String? get profileImage;
  @override
  String get nickName;
  @override
  String get content;
  @override
  List<CommentGetDTO> get comments;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$OnepostdetailDTOImplCopyWith<_$OnepostdetailDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
