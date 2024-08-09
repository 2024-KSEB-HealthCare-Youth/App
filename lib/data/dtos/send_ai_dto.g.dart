// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_ai_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendAiDTOImpl _$$SendAiDTOImplFromJson(Map<String, dynamic> json) =>
    _$SendAiDTOImpl(
      resultDetails: json['resultDetails'] as String?,
      faceImage: json['faceImage'] as String,
      basicSkinType: $enumDecode(_$typeEnumMap, json['basicSkinType']),
      advancedSkinType: (json['advancedSkinType'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$skintypeEnumMap, e))
          .toList(),
      cosNames:
          (json['cosNames'] as List<dynamic>).map((e) => e as String).toList(),
      cosPaths:
          (json['cosPaths'] as List<dynamic>).map((e) => e as String).toList(),
      nutrNames:
          (json['nutrNames'] as List<dynamic>).map((e) => e as String).toList(),
      nutrPaths:
          (json['nutrPaths'] as List<dynamic>).map((e) => e as String).toList(),
      probabilities: (json['probabilities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$SendAiDTOImplToJson(_$SendAiDTOImpl instance) =>
    <String, dynamic>{
      'resultDetails': instance.resultDetails,
      'faceImage': instance.faceImage,
      'basicSkinType': _$typeEnumMap[instance.basicSkinType]!,
      'advancedSkinType':
          instance.advancedSkinType?.map((e) => _$skintypeEnumMap[e]!).toList(),
      'cosNames': instance.cosNames,
      'cosPaths': instance.cosPaths,
      'nutrNames': instance.nutrNames,
      'nutrPaths': instance.nutrPaths,
      'probabilities': instance.probabilities,
    };

const _$typeEnumMap = {
  type.DRY: 'DRY',
  type.OILY: 'OILY',
  type.COMBINATION: 'COMBINATION',
};

const _$skintypeEnumMap = {
  skintype.ACNE: 'ACNE',
  skintype.WRINKLES: 'WRINKLES',
};
