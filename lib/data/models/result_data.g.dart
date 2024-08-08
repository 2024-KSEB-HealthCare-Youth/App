// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultDataImpl _$$ResultDataImplFromJson(Map<String, dynamic> json) =>
    _$ResultDataImpl(
      skintype: json['skintype'] as String?,
      resultId: (json['resultId'] as num).toInt(),
      memberId: (json['memberId'] as num).toInt(),
      resultImage: json['resultImage'] as String,
      faceImage: json['faceImage'] as String,
      resultDetails: json['resultDetails'] as String,
      resultDate: DateTime.parse(json['resultDate'] as String),
      probabilities: (json['probabilities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$ResultDataImplToJson(_$ResultDataImpl instance) =>
    <String, dynamic>{
      'skintype': instance.skintype,
      'resultId': instance.resultId,
      'memberId': instance.memberId,
      'resultImage': instance.resultImage,
      'faceImage': instance.faceImage,
      'resultDetails': instance.resultDetails,
      'resultDate': instance.resultDate.toIso8601String(),
      'probabilities': instance.probabilities,
    };
