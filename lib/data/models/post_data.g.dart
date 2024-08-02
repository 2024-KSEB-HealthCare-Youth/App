// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostDataImpl _$$PostDataImplFromJson(Map<String, dynamic> json) =>
    _$PostDataImpl(
      postId: json['postId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      likeCount: (json['likeCount'] as num).toInt(),
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      profileImage: json['profileImage'] as String,
      nickName: json['nickName'] as String,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentData.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PostDataImplToJson(_$PostDataImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'title': instance.title,
      'content': instance.content,
      'likeCount': instance.likeCount,
      'category': _$CategoryEnumMap[instance.category]!,
      'profileImage': instance.profileImage,
      'nickName': instance.nickName,
      'comments': instance.comments,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$CategoryEnumMap = {
  Category.FREE: 'FREE',
};
