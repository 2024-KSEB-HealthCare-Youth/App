// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultDetailDTOImpl _$$ResultDetailDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ResultDetailDTOImpl(
      resultDetails: json['resultDetails'] as String,
      resultImage: json['resultImage'] as String,
      faceImage: json['faceImage'] as String,
    );

Map<String, dynamic> _$$ResultDetailDTOImplToJson(
        _$ResultDetailDTOImpl instance) =>
    <String, dynamic>{
      'resultDetails': instance.resultDetails,
      'resultImage': instance.resultImage,
      'faceImage': instance.faceImage,
    };
