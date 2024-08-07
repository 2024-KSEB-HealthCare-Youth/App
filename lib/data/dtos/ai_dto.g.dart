// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiDTOImpl _$$AiDTOImplFromJson(Map<String, dynamic> json) => _$AiDTOImpl(
      resultImage: json['resultImage'] as String,
      resultDetails: json['resultDetails'] as String?,
      faceImage: json['faceImage'] as String,
      basicSkinType: json['basicSkinType'] as String,
      advancedSkinType: (json['advancedSkinType'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SkinTypeEnumMap, e))
          .toList(),
      cosNames:
          (json['cosNames'] as List<dynamic>).map((e) => e as String).toList(),
      cosPaths:
          (json['cosPaths'] as List<dynamic>).map((e) => e as String).toList(),
      nutrNames:
          (json['nutrNames'] as List<dynamic>).map((e) => e as String).toList(),
      nutrPaths:
          (json['nutrPaths'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$AiDTOImplToJson(_$AiDTOImpl instance) =>
    <String, dynamic>{
      'resultImage': instance.resultImage,
      'resultDetails': instance.resultDetails,
      'faceImage': instance.faceImage,
      'basicSkinType': instance.basicSkinType,
      'advancedSkinType':
          instance.advancedSkinType?.map((e) => _$SkinTypeEnumMap[e]!).toList(),
      'cosNames': instance.cosNames,
      'cosPaths': instance.cosPaths,
      'nutrNames': instance.nutrNames,
      'nutrPaths': instance.nutrPaths,
    };

const _$SkinTypeEnumMap = {
  SkinType.ACNE: 'ACNE',
  SkinType.WRINKLE: 'WRINKLE',
  SkinType.ATOPHY: 'ATOPHY',
};
