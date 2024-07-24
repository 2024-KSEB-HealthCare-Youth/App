// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'past_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PastDataImpl _$$PastDataImplFromJson(Map<String, dynamic> json) =>
    _$PastDataImpl(
      resultId:
          (json['resultId'] as List<dynamic>).map((e) => e as String).toList(),
      resultDate: (json['resultDate'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$PastDataImplToJson(_$PastDataImpl instance) =>
    <String, dynamic>{
      'resultId': instance.resultId,
      'resultDate':
          instance.resultDate.map((e) => e.toIso8601String()).toList(),
    };
