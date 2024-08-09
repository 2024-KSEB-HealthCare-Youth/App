// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onePostdetail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnepostdetailDTOImpl _$$OnepostdetailDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$OnepostdetailDTOImpl(
      postId: (json['postId'] as num).toInt(),
      title: json['title'] as String,
      likeCount: (json['likeCount'] as num).toInt(),
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      profileImage: json['profileImage'] as String?,
      nickName: json['nickName'] as String?,
      content: json['content'] as String,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentGetDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$OnepostdetailDTOImplToJson(
        _$OnepostdetailDTOImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'title': instance.title,
      'likeCount': instance.likeCount,
      'category': _$CategoryEnumMap[instance.category]!,
      'profileImage': instance.profileImage,
      'nickName': instance.nickName,
      'content': instance.content,
      'comments': instance.comments,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$CategoryEnumMap = {
  Category.FREE: 'FREE',
};
