// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentDataImpl _$$CommentDataImplFromJson(Map<String, dynamic> json) =>
    _$CommentDataImpl(
      postId: json['postId'] as String,
      nickName: json['nickName'] as String,
      profileImage: json['profileImage'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CommentDataImplToJson(_$CommentDataImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'nickName': instance.nickName,
      'profileImage': instance.profileImage,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
    };
