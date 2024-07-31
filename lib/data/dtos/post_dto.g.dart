// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostDTOImpl _$$PostDTOImplFromJson(Map<String, dynamic> json) =>
    _$PostDTOImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$PostDTOImplToJson(_$PostDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'category': instance.category,
    };
