// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentDataImpl _$$CommentDataImplFromJson(Map<String, dynamic> json) =>
    _$CommentDataImpl(
      name: json['name'] as String,
      date: json['date'] as String,
      comment: json['comment'] as String,
      likes: (json['likes'] as num).toInt(),
    );

Map<String, dynamic> _$$CommentDataImplToJson(_$CommentDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'comment': instance.comment,
      'likes': instance.likes,
    };
