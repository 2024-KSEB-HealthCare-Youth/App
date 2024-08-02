// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentDTOImpl _$$CommentDTOImplFromJson(Map<String, dynamic> json) =>
    _$CommentDTOImpl(
      nickName: json['nickName'] as String,
      content: json['content'] as String,
      profileImage: json['profileImage'] as String,
    );

Map<String, dynamic> _$$CommentDTOImplToJson(_$CommentDTOImpl instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'content': instance.content,
      'profileImage': instance.profileImage,
    };
