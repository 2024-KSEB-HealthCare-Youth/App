// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_get_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostGetDTOImpl _$$PostGetDTOImplFromJson(Map<String, dynamic> json) =>
    _$PostGetDTOImpl(
      postId: (json['postId'] as num).toInt(),
      title: json['title'] as String,
      likeCount: (json['likeCount'] as num?)?.toInt(),
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      profileImage: json['profileImage'] as String,
      nickName: json['nickName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PostGetDTOImplToJson(_$PostGetDTOImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'title': instance.title,
      'likeCount': instance.likeCount,
      'category': _$CategoryEnumMap[instance.category]!,
      'profileImage': instance.profileImage,
      'nickName': instance.nickName,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$CategoryEnumMap = {
  Category.FREE: 'FREE',
};
