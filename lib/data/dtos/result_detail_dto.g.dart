// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultDetailDTOImpl _$$ResultDetailDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ResultDetailDTOImpl(
      memberId: (json['memberId'] as num).toInt(),
      resultImage: json['resultImage'] as String,
      faceImage: json['faceImage'] as String,
      details: json['details'] as String?,
      resultDate: DateTime.parse(json['resultDate'] as String),
    );

Map<String, dynamic> _$$ResultDetailDTOImplToJson(
        _$ResultDetailDTOImpl instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'resultImage': instance.resultImage,
      'faceImage': instance.faceImage,
      'details': instance.details,
      'resultDate': instance.resultDate.toIso8601String(),
    };
