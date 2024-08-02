// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_get_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentGetDTOImpl _$$CommentGetDTOImplFromJson(Map<String, dynamic> json) =>
    _$CommentGetDTOImpl(
      nickName: json['nickName'] as String,
      profileImage: json['profileImage'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CommentGetDTOImplToJson(_$CommentGetDTOImpl instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'profileImage': instance.profileImage,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
    };
