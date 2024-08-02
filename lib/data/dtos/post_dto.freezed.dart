// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostDTO _$PostDTOFromJson(Map<String, dynamic> json) {
  return _PostDTO.fromJson(json);
}

/// @nodoc
mixin _$PostDTO {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostDTOCopyWith<PostDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDTOCopyWith<$Res> {
  factory $PostDTOCopyWith(PostDTO value, $Res Function(PostDTO) then) =
      _$PostDTOCopyWithImpl<$Res, PostDTO>;
  @useResult
  $Res call({String title, String content, String category});
}

/// @nodoc
class _$PostDTOCopyWithImpl<$Res, $Val extends PostDTO>
    implements $PostDTOCopyWith<$Res> {
  _$PostDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostDTOImplCopyWith<$Res> implements $PostDTOCopyWith<$Res> {
  factory _$$PostDTOImplCopyWith(
          _$PostDTOImpl value, $Res Function(_$PostDTOImpl) then) =
      __$$PostDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content, String category});
}

/// @nodoc
class __$$PostDTOImplCopyWithImpl<$Res>
    extends _$PostDTOCopyWithImpl<$Res, _$PostDTOImpl>
    implements _$$PostDTOImplCopyWith<$Res> {
  __$$PostDTOImplCopyWithImpl(
      _$PostDTOImpl _value, $Res Function(_$PostDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? category = null,
  }) {
    return _then(_$PostDTOImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostDTOImpl implements _PostDTO {
  _$PostDTOImpl(
      {required this.title, required this.content, required this.category});

  factory _$PostDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostDTOImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final String category;

  @override
  String toString() {
    return 'PostDTO(title: $title, content: $content, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostDTOImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostDTOImplCopyWith<_$PostDTOImpl> get copyWith =>
      __$$PostDTOImplCopyWithImpl<_$PostDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostDTOImplToJson(
      this,
    );
  }
}

abstract class _PostDTO implements PostDTO {
  factory _PostDTO(
      {required final String title,
      required final String content,
      required final String category}) = _$PostDTOImpl;

  factory _PostDTO.fromJson(Map<String, dynamic> json) = _$PostDTOImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$PostDTOImplCopyWith<_$PostDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
