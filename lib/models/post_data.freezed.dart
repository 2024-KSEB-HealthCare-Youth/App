// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

postData _$postDataFromJson(Map<String, dynamic> json) {
  return _postData.fromJson(json);
}

/// @nodoc
mixin _$postData {
  String get postId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  String get memberId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $postDataCopyWith<postData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $postDataCopyWith<$Res> {
  factory $postDataCopyWith(postData value, $Res Function(postData) then) =
      _$postDataCopyWithImpl<$Res, postData>;
  @useResult
  $Res call(
      {String postId,
      String title,
      String content,
      int likeCount,
      int commentCount,
      int viewCount,
      Category category,
      String memberId});
}

/// @nodoc
class _$postDataCopyWithImpl<$Res, $Val extends postData>
    implements $postDataCopyWith<$Res> {
  _$postDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? title = null,
    Object? content = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? viewCount = null,
    Object? category = null,
    Object? memberId = null,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$postDataImplCopyWith<$Res>
    implements $postDataCopyWith<$Res> {
  factory _$$postDataImplCopyWith(
          _$postDataImpl value, $Res Function(_$postDataImpl) then) =
      __$$postDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postId,
      String title,
      String content,
      int likeCount,
      int commentCount,
      int viewCount,
      Category category,
      String memberId});
}

/// @nodoc
class __$$postDataImplCopyWithImpl<$Res>
    extends _$postDataCopyWithImpl<$Res, _$postDataImpl>
    implements _$$postDataImplCopyWith<$Res> {
  __$$postDataImplCopyWithImpl(
      _$postDataImpl _value, $Res Function(_$postDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? title = null,
    Object? content = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? viewCount = null,
    Object? category = null,
    Object? memberId = null,
  }) {
    return _then(_$postDataImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$postDataImpl implements _postData {
  const _$postDataImpl(
      {required this.postId,
      required this.title,
      required this.content,
      required this.likeCount,
      required this.commentCount,
      required this.viewCount,
      required this.category,
      required this.memberId});

  factory _$postDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$postDataImplFromJson(json);

  @override
  final String postId;
  @override
  final String title;
  @override
  final String content;
  @override
  final int likeCount;
  @override
  final int commentCount;
  @override
  final int viewCount;
  @override
  final Category category;
  @override
  final String memberId;

  @override
  String toString() {
    return 'postData(postId: $postId, title: $title, content: $content, likeCount: $likeCount, commentCount: $commentCount, viewCount: $viewCount, category: $category, memberId: $memberId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$postDataImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, postId, title, content,
      likeCount, commentCount, viewCount, category, memberId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$postDataImplCopyWith<_$postDataImpl> get copyWith =>
      __$$postDataImplCopyWithImpl<_$postDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$postDataImplToJson(
      this,
    );
  }
}

abstract class _postData implements postData {
  const factory _postData(
      {required final String postId,
      required final String title,
      required final String content,
      required final int likeCount,
      required final int commentCount,
      required final int viewCount,
      required final Category category,
      required final String memberId}) = _$postDataImpl;

  factory _postData.fromJson(Map<String, dynamic> json) =
      _$postDataImpl.fromJson;

  @override
  String get postId;
  @override
  String get title;
  @override
  String get content;
  @override
  int get likeCount;
  @override
  int get commentCount;
  @override
  int get viewCount;
  @override
  Category get category;
  @override
  String get memberId;
  @override
  @JsonKey(ignore: true)
  _$$postDataImplCopyWith<_$postDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
