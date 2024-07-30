// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$postDataImpl _$$postDataImplFromJson(Map<String, dynamic> json) =>
    _$postDataImpl(
      postId: json['postId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      likeCount: (json['likeCount'] as num).toInt(),
      commentCount: (json['commentCount'] as num).toInt(),
      viewCount: (json['viewCount'] as num).toInt(),
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      memberId: json['memberId'] as String,
      profileImage: json['profileImage'] as String,
      postDate: DateTime.parse(json['postDate'] as String),
      nickName: json['nickName'] as String,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$postDataImplToJson(_$postDataImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'title': instance.title,
      'content': instance.content,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'viewCount': instance.viewCount,
      'category': _$CategoryEnumMap[instance.category]!,
      'memberId': instance.memberId,
      'profileImage': instance.profileImage,
      'postDate': instance.postDate.toIso8601String(),
      'nickName': instance.nickName,
      'comments': instance.comments,
    };

const _$CategoryEnumMap = {
  Category.FREE: 'FREE',
};
