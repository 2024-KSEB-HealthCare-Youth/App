// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'past_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultItemImpl _$$ResultItemImplFromJson(Map<String, dynamic> json) =>
    _$ResultItemImpl(
      resultId: (json['resultId'] as num).toInt(),
      resultDate: DateTime.parse(json['resultDate'] as String),
    );

Map<String, dynamic> _$$ResultItemImplToJson(_$ResultItemImpl instance) =>
    <String, dynamic>{
      'resultId': instance.resultId,
      'resultDate': instance.resultDate.toIso8601String(),
    };

_$PastDataImpl _$$PastDataImplFromJson(Map<String, dynamic> json) =>
    _$PastDataImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PastDataImplToJson(_$PastDataImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
