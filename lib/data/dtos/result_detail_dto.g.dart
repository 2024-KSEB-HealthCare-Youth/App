// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultDetailDTOImpl _$$ResultDetailDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ResultDetailDTOImpl(
      memberId: (json['memberId'] as num).toInt(),
      faceImage: json['faceImage'] as String,
      details: json['details'] as String?,
      resultDate: DateTime.parse(json['resultDate'] as String),
      probabilities: (json['probabilities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$ResultDetailDTOImplToJson(
        _$ResultDetailDTOImpl instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'faceImage': instance.faceImage,
      'details': instance.details,
      'resultDate': instance.resultDate.toIso8601String(),
      'probabilities': instance.probabilities,
    };
